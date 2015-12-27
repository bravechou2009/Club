<?php
defined('WEKIT_VERSION') || exit('Forbidden');

/**
 * 上传组件
 */

require_once EXT_PATH . "./qiniu/service/sdk/qiniu/io.php";
require_once EXT_PATH . "./qiniu/service/sdk/qiniu/rs.php";
require_once EXT_PATH . "./qiniu/service/sdk/qiniu/fop.php";

class App_QiNiu_Storage {

	private $file = 'EXT:qiniu.qiniu.php';
	private $conf;
	private $default = array();
	private $attachPath;
	private $_qiniu;

	public function __construct() {
		$this->conf = $this->_getYhcmsHlepDs()->Wfile($this->file);
		$this->conf || $this->conf = $this->default;
		$this->attachPath = $this->conf['yunimg_qiniu_attachPath'] ? $this->conf['yunimg_qiniu_attachPath'].'/' : '';
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
        $site = Wekit::C('site');
		if(!$this->_GetQiNiu($dir .$path)){
			return 'http://'.$this->conf['yunimg_qiniu_domain'] .'/'. $this->attachPath . $dir .$path;
		} else {
			return $site['info.url'].'/attachment/'.$dir .$path;	
		}
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
            if($fh = fopen($source, 'rb')){
			$ret=$this->_UpQiNiu($source, $filePath);
            fclose($fh);
            if($this->conf['yunimg_qiniu_delmy']) Pw::deleteFile($source);
            return true;
            }else{
                return false;
            }
        }
        catch(Exception $e){
            return false;
        }
	}
	
	public function delete($path, $ifthumb = 0){
		$bool =  $this->_DeleteQiNiu($path);
		if(!$bool) return false;
		if ($ifthumb) {
			($ifthumb & 1) && $this->_DeleteQiNiu('thumb/' . $path);
			($ifthumb & 2) && $this->_DeleteQiNiu('thumb/mini/' . $path);
		}
		return true;
	}
	
	public function getAbsolutePath($filename, $dir) {
		return ATTACH_PATH .$dir . $filename;
	}
	
	public function _GetQiNiu($filePath) {
			$_filePath=$this->attachPath.$filePath;
			Qiniu_setKeys($this->conf['yunimg_qiniu_ak'], $this->conf['yunimg_qiniu_sk']);
			$this->curobj = new Qiniu_MacHttpClient(null);
			list($ret, $err) = Qiniu_RS_Stat($this->curobj, $this->conf['yunimg_qiniu_bucket'], $_filePath);
			$ret = $err == null ? false : true;
		return $ret;
	}
	
	public function _UpQiNiu($source, $filePath) {
			$_filePath=$this->attachPath.$filePath;
			Qiniu_setKeys($this->conf['yunimg_qiniu_ak'], $this->conf['yunimg_qiniu_sk']);
			$putPolicy = new Qiniu_RS_PutPolicy($this->conf['yunimg_qiniu_bucket']);
			$upToken = $putPolicy->Token(null);
			$putExtra = new Qiniu_PutExtra();
			$putExtra->Crc32 = 1;
			list($ret, $err) = Qiniu_PutFile($upToken, $_filePath, $source, $putExtra);
			$ret=$ret == null ? false : true;
		return $ret;
	}
	
	public function _DeleteQiNiu($path) {
			$_filePath=$this->attachPath.$path;
			Qiniu_setKeys($this->conf['yunimg_qiniu_ak'], $this->conf['yunimg_qiniu_sk']);
			$this->curobj = new Qiniu_MacHttpClient(null);
			$err = Qiniu_RS_Delete($this->curobj, $this->conf['yunimg_qiniu_bucket'], $_filePath);
			$ret = $err == null ? false : true;
		return $ret;
	}
	
	private function _getYhcmsHlepDs() {
        return Wekit::load('EXT:qiniu.service.App_Yhcms_HelpDs');
    }
	
}
?>
