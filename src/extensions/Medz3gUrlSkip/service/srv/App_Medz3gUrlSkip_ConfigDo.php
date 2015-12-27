<?php
defined('WEKIT_VERSION') or exit(403);
/**
 * 后台菜单添加
 *
 * @author С�� <lovevipdsw@vip.qq.com>
 * @copyright http://www.medz.cn
 * @license http://www.medz.cn
 */
class App_Medz3gUrlSkip_ConfigDo {
	
	public function getHead() {
		$global = wekit::getGlobal();
		$url = $this->getUrl($global['request']);
		$this->goToUrl($url['wap'], $url['pc'], $url['state']);
	}
	
	public function getFooter() {
		$global = wekit::getGlobal();
		$url = $this->getUrl($global['request']);
		$this->echoJavaScript($url['wap'], $url['pc']);
	}
	
	public function goToUrl($wapUrl, $pcUrl, $state) {
		$is = $_GET['is'];
		if(empty($is)) {
			if($this->is_wap() != $state) {
				$html = "";
				if($this->is_wap() == "wap") {
					$html = '
						<script type="text/javascript">
							window.location.href="' . $wapUrl . '";
						</script>
					';
				} else if($this->is_wap() == "pc") {
					$html = '
						<script type="text/javascript">
							window.location.href="' . $pcUrl . '";
						</script>
					';
				}
				if(!empty($wapUrl) && !empty($pcUrl)) {
					echo $html;
				}
			}
		}
	}
	
	public function getUrl($s) {
		if($s['m'] == 'bbs' || $s['m'] == "message" || $s['m'] == "u") {
			$pc = WindUrlHelper::createUrl($s['mca'] . $this->_get());
			$wap = WindUrlHelper::createUrl("3g/" . $s['c'] . "/" . $s['a'] . $this->_get());
		}
		if($s['m'] == "space") {
			if($s['c'] == "index" || $s['c'] == "profile") {
				$pc = WindUrlHelper::createUrl($s['mca'] . $this->_get());
				$wap = WindUrlHelper::createUrl("3g/profile/" . $s['a'] . $this->_get());
			}
		}
		if($s['m'] == "profile") {
			$pc = WindUrlHelper::createUrl($s['mca'] . $this->_get());
			if($s['c'] == "index") {
				$wap = WindUrlHelper::createUrl("3g/userinfo/" . $s['a'] . $this->_get());
			}
			if($s['c'] == "education" || $s['c'] == "work" || $s['c'] == "secret" || $s['c'] == "password") {
				$wap = WindUrlHelper::createUrl("3g/" . $s['c'] . "/" . $s['a'] . $this->_get());
			}
		}
		$state = "pc";
		/* -----------------------分割线------------------------- */
		if($s['m'] == '3g') {
			$wap = WindUrlHelper::createUrl($s['mca'] . $this->_get());
			if($s['c'] == "forumlist" || $s['c'] == "index" || $s['c'] == "thread" || $s['c'] == "read" || $s['c'] == "post") {
				$pc = WindUrlHelper::createUrl("bbs/" . $s['c'] . "/" . $s['a'] . $this->_get());
			}
			if($s['c'] == "message" || $s['c'] == "notice") {
				$pc = WindUrlHelper::createUrl("message/" . $s['c'] . "/" . $s['a'] . $this->_get());
			}
			if($s['c'] == "profile") {
				$pc = WindUrlHelper::createUrl("space/index/" . $s['a'] . $this->_get());
			}
			if($s['c'] == "login" || $s['c'] == "findPwd" || $s['c'] == "register") {
				$pc = WindUrlHelper::createUrl("u/" . $s['c'] . "/" . $s['a'] . $this->_get());
			}
			if($s['c'] == "userinfo") {
				$pc = WindUrlHelper::createUrl("profile/index/" . $s['a'] . $this->_get());
			}
			if($s['c'] == "education" || $s['c'] == "work" || $s['c'] == "secret" || $s['c'] == "password") {
				$pc = WindUrlHelper::createUrl("profile/" . $s['c'] . "/" . $s['a'] . $this->_get());
			}
			$state = "wap";
		}
		return array('pc' => $pc, 'wap' => $wap, 'state' => $state);
	}
	
	public function echoJavaScript($wapUrl, $pcUrl) {
		if(strstr($wapUrl, "?")) {
			$wapUrl .= "&is=1";
		} else {
			$wapUrl .= "?is=1";
		}
		if(strstr($pcUrl, "?")) {
			$pcUrl .= "&is=1";
		} else {
			$pcUrl .= "?is=1";
		}
		$html = '
		<script type="text/javascript">
			wap = document.getElementById("a_wap");
			pc = document.getElementById("a_pc");
			wap.href = "' . $wapUrl . '";
			pc.href = "' . $pcUrl . '";
		</script>
		';
		echo $html;
	}
	
	public function _get() {
		$get = array();
		foreach($_GET as $k => $v) {
			if($k != "c" && $k != "m" && $k != "a" && $k != "is") {
				$get[$k] = $v;
			}
		}
		$ar = "?";
		$i = 1;
		foreach($get as $k => $v) {
			$ar .= $k . "=" . $v;
			if($i < count($get)) {
				$ar .= "&";
				$i++;
			}
		}
		return $ar;
	}
	
	public function is_wap(){
		if(stristr($_SERVER['HTTP_VIA'],"wap")) {// 先检查是否为wap代理，准确度高
			return 'wap';
		} else if(strpos(strtoupper($_SERVER['HTTP_ACCEPT']),"VND.WAP.WML") > 0) {// 检查浏览器是否接受 WML.
			return 'wap';
		} else if(preg_match('/(blackberry|configuration\/cldc|hp |hp-|htc |htc_|htc-|iemobile|kindle|midp|mmp|motorola|mobile|nokia|opera mini|opera |Googlebot-Mobile|YahooSeeker\/M1A1-R2D2|android|iphone|ipod|mobi|palm|palmos|pocket|portalmmm|ppc;|smartphone|sonyericsson|sqh|spv|symbian|treo|up.browser|up.link|vodafone|windows ce|xda |xda_)/i', $_SERVER['HTTP_USER_AGENT'])) {//检查USER_AGENT
			return 'wap';		 	
		}else{
			return 'pc';
		}
	}
}

?>