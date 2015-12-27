<?php
defined('WEKIT_VERSION') or exit(403);
Wind::import('APPS:admin.library.AdminBaseController');
class ManageController extends AdminBaseController {
	
	private $file = 'EXT:qiniu.qiniu.php';
	private $default = array();
	public  $conf;
	
	
	public function beforeAction($handlerAdapter) {
		parent::beforeAction($handlerAdapter);
		$this->conf = $this->_getYhcmsHlepDs()->Wfile($this->file);
		$this->conf || $this->conf = $this->default;
	}
	
	
	/* (non-PHPdoc)
	 * @see WindController::run()
	 */
	public function run() {
		$this->setOutput($this->conf, 'conf');
	}
	
	/**
	 * 应用的设置提交
	 *
	 */
	public function doRunAction() {
		$conf = $this->getInput('conf', 'post');
		$this->_getYhcmsHlepDs()->Wfile($this->file, '', TRUE, $conf);
        $type =	$conf['yunimg_qiniu_isopen'] == '1' ? 'yunimg' : 'local';
		$attService = Wekit::load('LIB:storage.PwStorage');
        $attService->setStoragesComponents($type);
		$this->showMessage('success');
	}
	
	
	private function _getYhcmsHlepDs() {
        return Wekit::load('EXT:qiniu.service.App_Yhcms_HelpDs');
    }
}