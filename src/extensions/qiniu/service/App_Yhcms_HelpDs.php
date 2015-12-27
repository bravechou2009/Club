<?php
defined('WEKIT_VERSION') || exit('Forbidden');

class App_Yhcms_HelpDs {
		
	public function Wfile($name, $field='', $write=false, $data=array()) {
		
		$file = Wind::getRealPath($name, TRUE);
		$conf = @include $file;
		$conf || $conf = array();
		if($write) {
			WindFile::savePhpData($file, $data);
			return $this->Wfile($name, $field);
		} else {
			if($field){
				return $conf[$field];
			} else {
				return $conf;	
			}
		}
	}
	
}