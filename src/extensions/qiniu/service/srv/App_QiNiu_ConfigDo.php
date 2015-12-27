<?php
defined('WEKIT_VERSION') or exit(403);
/**
 * 后台菜单添加
 */
class App_QiNiu_ConfigDo {
	
	public function changeStorage($config) {
		$config += array(
            'qiniu' => array(
                'name' => '7牛远程附件云存储', 
		        'alias' => 'qiniu', 
                'managelink' => 'app/qiniu/manage/run',
                'description' => '7牛远程附件云存储', 
                'components' => array('path' => 'EXT:qiniu.service.lib.App_QiNiu_Storage')
            ),
        );
		return $config;
	}
}

?>
