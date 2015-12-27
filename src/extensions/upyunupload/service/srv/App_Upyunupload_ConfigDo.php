<?php
defined('WEKIT_VERSION') or exit(403);
/**
 * 后台菜单添加
 *
 * @author UpYun.com <faq@upyun.com>
 * @copyright https://www.upyun.com/
 * @license https://www.upyun.com/
 */
class App_Upyunupload_ConfigDo {
	
	/**
	 * 获取又拍UpYun云存储附件助手后台菜单
	 *
	 * @param array $config
	 * @return array 
	 */
	public function getAdminMenu($config) {
		$config += array(
			'ext_upyunupload' => array('又拍UpYun云存储附件助手', 'app/manage/*?app=upyunupload', '', '', 'appcenter'),
			);
		return $config;
	}
	public function changeStorage($config) {
		$config += array(
            'upyun' => array(
                'name' => 'UpYun 远程附件云存储', 
		        'alias' => 'upyunupload', 
                'managelink' => 'app/upyunupload/manage/run',
                'description' => '又拍 UpYun 远程附件云存储', 
                'components' => array('path' => 'EXT:upyunupload.service.lib.App_Upyunupload_Storage')
            ),
        );
		return $config;
	}
}

?>
