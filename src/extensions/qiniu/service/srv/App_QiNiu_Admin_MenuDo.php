<?php
defined('WEKIT_VERSION') or exit(403);
/**
 * 后台菜单扩展
 *
 * @author pw <pw@aliyun-inc.com>
 * @copyright http://www.phpwind.net/u-htm-uid-1793211.html
 * @license http://www.phpwind.net/u-htm-uid-1793211.html
 */
class App_QiNiu_Admin_MenuDo {
	
	/**
	 * @param array $config 后台菜单配置
	 * @return array
	 */
	public function app_QiNiuDo($config) {
		$config += array(
			'app_qiniu' => array('七牛存储', 'app/manage/*?app=qiniu', '', '', 'appcenter'),
			);
		return $config;
	}
}

?>