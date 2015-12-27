<?php
defined('WEKIT_VERSION') || exit('Forbidden');

/**
 * 上传组件
 *
 * @author BiangBiang <biangbiangguoguo@163.com>
 * @copyright ©2003-2103 UpYun.com
 * @license https://www.upyun.com
 * @version $Id: App_Upyunupload_Storage.php  2012-12-18 BiangBiang $
 * @package upload
 */

require_once EXT_PATH . "./upyunupload/service/sdk/upyun.class.php";

class App_Upyunupload_Storage {

	private $_config;
	private $_upyun = null;
    private $api_access = array(UpYun::ED_AUTO, UpYun::ED_TELECOM, UpYun::ED_CNC, UpYun::ED_CTT);

	public function __construct() {
		$this->_config = Wekit::C('attachment');
        $dir = $this->_config['upyun.dir'];
        $url = $dir == "" ? "" : "/$dir";
        $this->_config['upyun.url'] = $this->_config['upyun.url'].$url;
        $this->_config['upyun.dir'] = $dir == "" ? "." : $dir;
        $this->_config['upyun.access'] = intval($this->_config['upyun.access']);
        $this->_config['upyun.access'] = $this->api_access[$this->_config['upyun.access']];
	}
	
	/**
	 * 获取web地址
	 *
	 * @param string $path 相对存储地址
	 * @param int $ifthumb 是否获取缩略图
	 * @return string
	 */
	public function get($path, $ifthumb) {
		$dir = '';
		if ($ifthumb & 2) {
			$dir = 'thumb/mini/';
		} elseif ($ifthumb & 1) {
			$dir = 'thumb/';
		}
		return $this->_config['upyun.url'] . '/' . $dir . $path;
	}
	
	/**
	 * 获取下载地址
	 *
	 * @param string $path
	 * @return string 文件真实存储路径
	 */
	public function getDownloadUrl($path) {
		return $this->get($path, 0);
	}
	
	/**
	 * 存储附件,如果是远程存储，记得删除本地文件
	 *
	 * @param string $source 本地源文件地址
	 * @param string $filePath 存储相对位置
	 * @return bool
	 */
	public function save($source, $filePath) {
        try{
            if($fh = fopen($source,'rb')){
            $rsp = $this->_getUpyun()->writeFile('/' . $this->_config['upyun.dir'] . '/' . $filePath,$fh,True);
            fclose($fh);
            Pw::deleteFile($source);
            return true;
            }else{
                return false;
            }
        }
        catch(Exception $e){
            return false;
        }
	}
	
	/**
	 * 获取附件上传时存储在本地的文件地址
	 *
	 * @param string $filename 文件名
	 * @param string $dir 目录名
	 * @return string
	 */
	public function getAbsolutePath($filename, $dir) {
		return DATA_PATH . 'upload/' . Pw::time2str(WEKIT_TIMESTAMP, 'j') . '/' . str_replace('/', '_', $dir) . $filename;
	}
	
	/**
	 * 删除附件
	 *
	 * @param string $path 附件地址
	 */
	public function delete($path, $ifthumb = 0) {
        try{
            $this->_getUpyun()->delete('/' . $this->_config['upyun.dir'] . '/' . $path);
            if ($ifthumb) {
                ($ifthumb & 1) && $this->_getUpyun()->delete('/' . $this->_config['upyun.dir'] . '/' . 'thumb/' . $path);
                ($ifthumb & 2) && $this->_getUpyun()->delete('/' . $this->_config['upyun.dir'] . '/' . 'thumb/mini/' . $path);
            }
            return true;
        }
        catch(Exception $e){
            return false;
        }
	}

	public function _getUpyun() {
		if ($this->_upyun == null) {
			$this->_upyun = new UpYun($this->_config['upyun.bucket'],$this->_config['upyun.user'],$this->_config['upyun.pwd'],$this->_config['upyun.access']);
		}
		return $this->_upyun;
	}
}
?>
