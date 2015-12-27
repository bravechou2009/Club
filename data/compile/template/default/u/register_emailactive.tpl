<!doctype html>
<html>
<head>
<!------
    X      X    I   ######      #       ###### 
      X  X      I   #           #   #   #  
       X        I   ######      # #     ######
     X   X      I   #           ##      #   
    X     X     I   #           # #     #      
   X        X   I   ######      #  #    ######
------>

<meta charset="<?php echo htmlspecialchars(Wekit::V('charset'), ENT_QUOTES, 'UTF-8');?>" />
<title><?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','seo','title'), ENT_QUOTES, 'UTF-8');?></title>
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<meta name="description" content="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','seo','description'), ENT_QUOTES, 'UTF-8');?>" />
<meta name="keywords" content="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','seo','keywords'), ENT_QUOTES, 'UTF-8');?>" />
<link rel="stylesheet" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/'.Wekit::C('site', 'theme.site.default').'/css'.Wekit::getGlobal('theme','debug'); ?>/core.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" />
<link rel="stylesheet" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/'.Wekit::C('site', 'theme.site.default').'/css'.Wekit::getGlobal('theme','debug'); ?>/style.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" />
<!-- <base id="headbase" href="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','base'), ENT_QUOTES, 'UTF-8');?>/" /> -->
<?php echo Wekit::C('site', 'css.tag');?>
<script>
//全局变量 Global Variables
var GV = {
	JS_ROOT : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','res'), ENT_QUOTES, 'UTF-8');?>/js/dev/',										//js目录
	JS_VERSION : '<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>',											//js版本号(不能带空格)
	JS_EXTRES : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','extres'), ENT_QUOTES, 'UTF-8');?>',
	TOKEN : '<?php echo htmlspecialchars(Wind::getComponent('windToken')->saveToken('csrf_token'), ENT_QUOTES, 'UTF-8');?>',	//token $.ajaxSetup data
	U_CENTER : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-index-run'; ?>',		//用户空间(参数 : uid)
<?php 
$loginUser = Wekit::getLoginUser();
if ($loginUser->isExists()) {
?>
	//登录后
	U_NAME : '<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>',										//登录用户名
	U_AVATAR : '<?php echo htmlspecialchars(Pw::getAvatar($loginUser->uid), ENT_QUOTES, 'UTF-8');?>',							//登录用户头像
<?php 
}
?>
	U_AVATAR_DEF : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>/face/face_small.jpg',					//默认小头像
	U_ID : parseInt('<?php echo htmlspecialchars($loginUser->uid, ENT_QUOTES, 'UTF-8');?>'),									//uid
	REGION_CONFIG : '',														//地区数据
	CREDIT_REWARD_JUDGE : '<?php echo $loginUser->showCreditNotice();?>',			//是否积分奖励，空值:false, 1:true
	URL : {
		LOGIN : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-login-run'; ?>',										//登录地址
		QUICK_LOGIN : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-login-fast'; ?>',								//快速登录
		IMAGE_RES: '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>',										//图片目录
		CHECK_IMG : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-login-showverify'; ?>',							//验证码图片url，global.js引用
		VARIFY : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','verify-index-get'; ?>',									//验证码html
		VARIFY_CHECK : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','verify-index-check'; ?>',							//验证码html
		HEAD_MSG : {
			LIST : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-minilist'; ?>'							//头部消息_列表
		},
		USER_CARD : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-card-run'; ?>',								//小名片(参数 : uid)
		LIKE_FORWARDING : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','bbs-post-doreply'; ?>',							//喜欢转发(参数 : fid)
		REGION : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','misc-webData-area'; ?>',									//地区数据
		SCHOOL : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','misc-webData-school'; ?>',								//学校数据
		EMOTIONS : "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','emotion-index-run?type=bbs'; ?>",					//表情数据
		CRON_AJAX : '<?php echo htmlspecialchars($runCron, ENT_QUOTES, 'UTF-8');?>',											//计划任务 后端输出执行
		FORUM_LIST : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','bbs-forum-list'; ?>',								//版块列表数据
		CREDIT_REWARD_DATA : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-index-showcredit'; ?>',					//积分奖励 数据
		AT_URL: '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','bbs-remind-run'; ?>',									//@好友列表接口
		TOPIC_TYPIC: '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','bbs-forum-topictype'; ?>'							//主题分类
	}
};
</script>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/wind.js?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
<?php
PwHook::display(array(PwSimpleHook::getInstance("head"), "runDo"), array(), "", $__viewer);
?>
<link href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/css'.Wekit::getGlobal('theme','debug'); ?>/register.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
</head>
<body>
<div class="wrap">
<?php if ($site_info_notice = Wekit::C('site','info.notice')) {?>
<style>.header_wrap{top:29px;}body{padding-top:75px;}</style><div id="notice"><?php echo htmlspecialchars($site_info_notice, ENT_QUOTES, 'UTF-8');?></div>
<?php }?>
<header class="header_wrap">
	<div id="J_header" class="header cc">
		<div class="logo">
			<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/',''; ?>">
				<?php  if($__css = Wekit::C('site', 'css.logo')) { ?>
				<!--后台logo上传-->
				<img src="<?php echo htmlspecialchars(Pw::getPath($__css), ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars(Wekit::C('site','info.name'), ENT_QUOTES, 'UTF-8');?>">
				<?php  } else { ?>
				<img src="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/'.Wekit::C('site', 'theme.site.default').'/images'; ?>/logo.png" alt="<?php echo htmlspecialchars(Wekit::C('site','info.name'), ENT_QUOTES, 'UTF-8');?>">
				<?php  } ?>
			</a>
		</div>
		<nav class="nav_wrap">
			<div class="nav">
				<ul>
	<?php  $nav = Wekit::load('SRV:nav.bo.PwNavBo');
		  $nav->setRouter();
		  $currentId =  '';
		   $main = $child = array();
		  if ($nav->isForum()) $nav->setForum($pwforum->foruminfo['parentid'], $fid, $tid);
		  $main = $nav->getNavFromConfig('main', true);
		  foreach($main as $key=>$value){
			if ($value['current']) {
				$current = 'current';
				$currentId = $key;
			} else {
				$current = '';
			}
			$value['child'] && $child[$key] = $value['child'];
		  ?>
					<li class="<?php echo htmlspecialchars($current, ENT_QUOTES, 'UTF-8');?>"><?php echo $value['name'];?></li>
	<?php  } ?>
				</ul>
			</div>
		</nav>
		<?php
PwHook::display(array(PwSimpleHook::getInstance("header_nav"), "runDo"), array(), "", $__viewer);
?>
		<div class="header_search" role="search">
			<form action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','search-s-run'; ?>" method="post">
				<input type="text" id="s" aria-label="搜索关键词" accesskey="s" placeholder="请输入关键字" x-webkit-speech speech name="keyword"/>
				<button type="submit" aria-label="搜索"><span>搜索</span></button>
			<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
		</div>
		<?php  if (!$loginUser->isExists()) { ?>
<div class="header_login">
	<?php
PwHook::display(array(PwSimpleHook::getInstance("header_info_3"), "runDo"), array(), "", $__viewer);
?><a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-login-run'; ?>">登录</a><a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-register-run'; ?>">注册</a>
</div>
<?php  } else {
	if ($pwforum && $pwforum->isForum()) {
		$_tmpfid = $pwforum->fid;
		$_tmpcid = $pwforum->getCateId();
	} else {
		$_tmpfid = 0;
		$_tmpcid = $pwforum ? $pwforum->getCateId() : '0';
	}
?>
	<a class="header_login_btn" id="J_head_forum_post" role="button" aria-label="快速发帖" aria-haspopup="J_head_forum_pop" href="#" title="快速发帖" tabindex="-1"><span class="inside"><span class="header_post" >发帖</span></span></a>
	<div id="J_head_forum_pop" tabindex="0" class="pop_select_forum" style="display:none;" aria-label="快速发帖菜单,按ESC键关闭菜单">
		<a id="J_head_forum_close" href="#" class="pop_close" role="button">关闭窗口</a>
		<div class="core_arrow_top" style="left:310px;"><em></em><span></span></div>
		<div class="hd">发帖到其他版块</div>
		<div id="J_head_forum_ct" class="ct cc" data-fid="<?php echo htmlspecialchars($_tmpfid, ENT_QUOTES, 'UTF-8');?>" data-cid="<?php echo htmlspecialchars($_tmpcid, ENT_QUOTES, 'UTF-8');?>">
			<div class="pop_loading"></div>
		</div>
		<div class="ft">
			<div class="associate">
				<label class="fr"><input type="checkbox" id="J_head_forum_join" data-url="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','bbs-forum-join'; ?>">添加到我的版块</label>
				发帖到：<span id="J_post_to_forum"></span>
			</div>
			<div class="tac">
				<button type="button" class="btn btn_submit disabled" disabled="disabled" id="J_head_forum_sub" data-url="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','bbs-post-run'; ?>">确定</button>
			</div>
		</div>
	</div>
	<?php 
		$messageCount = $loginUser->info['notices'] + $loginUser->info['messages'];
		$messageClass = $messageCount ? 'header_message' : 'header_message header_message_none';
	?>
	<a class="header_login_btn" id="J_head_msg_btn" tabindex="0" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-message-run'; ?>" aria-haspopup="J_head_msg_pop" aria-label="消息菜单,按pagedown打开菜单,tab键导航,esc键关闭"><span class="inside"><span class="<?php echo htmlspecialchars($messageClass, ENT_QUOTES, 'UTF-8');?>">消息<em class="core_num J_hm_num"><?php echo htmlspecialchars($messageCount, ENT_QUOTES, 'UTF-8');?></em></span></span></a>
	<!--消息下拉菜单-->
	<div id="J_head_msg_pop" tabindex="0" aria-label="消息下拉菜单,按ESC键关闭菜单" class="header_menu_wrap my_message_menu" style="display:none;">
		<div class="header_menu cc">
			<div class="header_menu_hd" id="J_head_pl_hm"><span class="<?php echo htmlspecialchars($messageClass, ENT_QUOTES, 'UTF-8');?> header_message_down">消息<em class="core_num J_hm_num"><?php echo htmlspecialchars($messageCount, ENT_QUOTES, 'UTF-8');?></em></span></div>
			<div id="J_head_msg" class="my_message_content"><div class="pop_loading"></div></div>
		</div>
	</div>
	<div class="header_login_later">
		<?php
PwHook::display(array(PwSimpleHook::getInstance("header_info_1"), "runDo"), array(), "", $__viewer);
?>
		<a aria-haspopup="J_head_user_menu" aria-label="个人功能菜单,按pagedown打开菜单,tab键导航,esc键关闭" tabindex="0" rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($loginUser->uid),'.html'; ?>" id="J_head_user_a" class="username" title="<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars(Pw::substrs($loginUser->username,6), ENT_QUOTES, 'UTF-8');?><em class="core_arrow"></em></a>
		<?php
PwHook::display(array(PwSimpleHook::getInstance("header_info_2"), "runDo"), array(), "", $__viewer);
?>
		<div class="fl">
		<div id="J_head_user_menu" role="menu" class="header_menu_wrap my_menu_wrap" style="display:none;">
			<div class="header_menu my_menu cc">
				<div class="header_menu_hd" id="J_head_pl_user"><span title="<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>" class="username"><?php echo htmlspecialchars(Pw::substrs($loginUser->username,6), ENT_QUOTES, 'UTF-8');?></span><em class="core_arrow_up"></em></div>
				<ul class="ct cc">
				<?php  $nav = Wekit::load('SRV:nav.bo.PwNavBo');
					$myNav = $nav->getNavFromConfig('my');
					foreach($myNav as $key=>$value){
				?>
					<li><?php echo $value['name'];?></li>
				<?php  } 
 
				$_url = '';
				$_panelManage = false;

				// $_toCheck: permission name => array(permission key, url path)
				$_toCheck = array(
					'panel_bbs_manage'     => array('thread_check', 'manage/content/run'),
					'panel_user_manage'    => array('user_check', 'manage/user/run'),
					'panel_report_manage'  => array('report_manage', 'manage/report/run'),
					'panel_recycle_manage' => array('recycle', 'manage/recycle/run'),
				);
				foreach ($_toCheck as $_permName => $_permInfo) {
					if ($_panelManage) {
						break;
					}
					$_permission  = $loginUser->getPermission($_permName, false, array());
					if ($_permission && isset($_permission[$_permInfo[0]])) {
						$_url = $_permInfo[1];
						$_panelManage = true;
					}
				}
				if ($_panelManage) {
				?>
					<li><a href="<?php echo htmlspecialchars(WindUrlHelper::createUrl($_url), ENT_QUOTES, 'UTF-8');?>" rel="nofollow"><em class="icon_system"></em>前台管理</a></li>
				<?php } if (Pw::getstatus($loginUser->info['status'], PwUser::STATUS_ALLOW_LOGIN_ADMIN) || Pw::inArray(3, $loginUser->groups)) {?>
					<li><a href="<?php echo htmlspecialchars(Wind::getComponent('router')->getRoute('pw')->checkUrl('admin.php'), ENT_QUOTES, 'UTF-8');?>" target="_blank" rel="nofollow"><em class="icon_admin"></em>系统后台</a></li>
				<?php  } ?>
				</ul>
				<ul class="ft cc">
					<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','profile-index-run'; ?>"><em class="icon_profile"></em>个人设置</a></li>
					<?php
PwHook::display(array(PwSimpleHook::getInstance("header_my"), "runDo"), array(), "", $__viewer);
?>
					<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-login-logout'; ?>" rel="nofollow"><em class="icon_quit"></em>退出</a></li>
				</ul>
			</div>
		</div>
		</div>
	</div>
	<?php  if ($loginUser->info['message_tone'] > 0 && $messageCount > 0) { ?>
	<audio autoplay="autoplay">
		<source src="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/images'; ?>/message/msg.wav" type="audio/wav" />
		<source src="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/images'; ?>/message/msg.mp3" type="audio/mp3" />
		<div style='overflow:hidden;width:0;float:left'><embed src='<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/images'; ?>/message/msg.wav' width='0' height='0' AutoStart='true' type='application/x-mplayer2'></embed></div>
	</audio>
	<?php  } 
  } ?>

	</div>
</header>
<?php 
if ($child) {
foreach ($child as $ck => $cv) {
	 if ($currentId == $ck){
?>
	<div class="nav_weak" id="<?php echo htmlspecialchars($ck, ENT_QUOTES, 'UTF-8');?>">
<?php  }else{ ?>
	<div class="nav_weak" id="<?php echo htmlspecialchars($ck, ENT_QUOTES, 'UTF-8');?>" style="display:none">
<?php  } ?>
		<ul class="cc">
			<?php  foreach($cv as $_v){
				$current = $_v['current'] ? 'current' : '';
			?>
			<li class="<?php echo htmlspecialchars($current, ENT_QUOTES, 'UTF-8');?>"><?php echo $_v['name'];?></li>
			<?php  } ?>
		</ul>
	</div>
<?php }} ?>
<div class="tac"> </div>
	<div class="main_wrap">
		<div class="box_wrap register cc">
			<div class="reg_activation">
	<?php if($from == 'login') {?>
				<h1><?php echo htmlspecialchars($username, ENT_QUOTES, 'UTF-8');?>，欢迎您回来，请激活您的帐号！</h1>
	<?php } else {?>
				<h1><?php echo htmlspecialchars($username, ENT_QUOTES, 'UTF-8');?>，恭喜您注册成为<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','sitename'), ENT_QUOTES, 'UTF-8');?>会员</h1>
	<?php }?>
				<p class="text"><?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','sitename'), ENT_QUOTES, 'UTF-8');?> 已向 <span id="J_orgin_email"><?php echo htmlspecialchars($email, ENT_QUOTES, 'UTF-8');?></span> 发送激活邮件。<br>
				请您立即登录该邮箱，并点击邮件中的激活链接，即可开通帐户完成注册。<a href="<?php echo htmlspecialchars($gotoEmail, ENT_QUOTES, 'UTF-8');?>" class="btn btn_submit f12" target="_blank">查看激活邮件</a></p>
				<div class="reg_activation_tip">
					<h2>提示：</h2>
					<p>若您长时间未收到激活邮件，请检查您的垃圾箱或广告箱，邮件有可能被误认为垃圾或广告邮件。<br>
					如确认无法找到您的激活邮件，可<a id="J_re_send" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-register-sendActiveEmailAgain?_statu=', rawurlencode($_statu); ?>" class="s4">重新发送激活邮件</a>，也可<a id="J_email_change_btn" href="#" class="s4">更改邮箱地址</a>，用其他的邮箱再收一封新的激活邮件。</p>
				</div>
			</div>
		</div>
		<div id="J_email_change_wrap" class="core_pop_wrap" style="display:none;">
			<div class="core_pop">
				<div style="width:380px;">
					<form id="J_email_form" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-register-editEmail'; ?>" method="post">
					<input type="hidden" value="<?php echo htmlspecialchars($_statu, ENT_QUOTES, 'UTF-8');?>" name="_statu" />
					<div class="pop_top"><a href="#" class="pop_close" id="J_email_close">关闭</a><strong>修改邮箱地址</strong></div>
					<div class="p20">
						<div class="tips" id="J_email_tip" style="display:none;"></div>
						<div style="display:none;margin:27px 0 10px 82px;" class="fl mail_down" id="J_email_list"></div>
						<div class="cc">
							<span class="mr10" style="line-height:26px;">新邮箱地址：</span><span class="must_red mr10" style=" position:inherit;">*</span><input autocomplete="off" name="email" id="J_email_input" type="text" class="input length_4">
						</div>
					</div>
					<div class="pop_bottom">
						<button class="btn btn_submit mr10" type="submit">确定</button><button id="J_email_cancl" class="btn" type="button">取消</button>
					</div>
					<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
				</div>
			</div>
		</div>
	</div>
<!--.main-wrap,#main End-->
<div class="tac">
 <br />
 
</div>
<div class="footer_wrap">
	<div class="footer">
		<pw-drag id="footer_segment"/>
		<div class="bottom">
		<?php 
			$nav = Wekit::load('SRV:nav.bo.PwNavBo');
			$bottom = $nav->getNavFromConfig('bottom');
			foreach($bottom as $key=>$value){
		
 echo $value['name'];
  } ?>
		</div>
		<p>All Rights Reserved <a href="http://bbs.xieke.org" target="_blank" rel="nofollow">Xiekers</a> Base PHPWind</a> <a href="http://www.miitbeian.gov.cn" target="_blank" rel="nofollow"><?php echo htmlspecialchars(Wekit::C('site','info.icp'), ENT_QUOTES, 'UTF-8');?></a></p>
		<p><?php echo Wekit::C('site','statisticscode');?></p>
	</div>
	 
	 
	 
	<div id="cloudwind_common_bottom"></div>
	<?php
PwHook::display(array(PwSimpleHook::getInstance("footer"), "runDo"), array(), "", $__viewer);
?>
</div>

<!--返回顶部-->
<a href="#" rel="nofollow" role="button" id="back_top" tabindex="-1">返回顶部</a>

</div>
<script>
Wind.use('jquery', 'global', 'ajaxForm', 'emailAutoMatch', 'draggable', 'validate', function(){
/*
 * 重新发送激活邮件
*/
	var send_able = true;
	$('#J_re_send').on('click', function(e){
		e.preventDefault();

		var $this = $(this);
		
		//防重复点击
		if(!send_able) {
			return false;
		}
		send_able = false;
		
		Wind.Util.ajaxMaskShow();
		$.ajax({
			type : 'post',
			url : $(this).attr('href'),
			dataType : 'json',
			success : function(data){
				Wind.Util.ajaxMaskRemove();
				Wind.Util.resultTip({
					error : ( data.state=='fail' ? true : false ),
					msg : data.message,
					follow : $this
				});
				send_able = true;
			}
		});
		
	});
	
	var email_change_wrap = $('#J_email_change_wrap'),
		email_tip = $('#J_email_tip'),
		email_input = $('#J_email_input'),
		email_form = $("#J_email_form");
	
	//更改邮箱地址
	$('#J_email_change_btn').on('click', function(e){
		e.preventDefault();

		Wind.Util.popPos(email_change_wrap);

        email_change_wrap.draggable( { handle : '.pop_top'} );
		
		email_input.emailAutoMatch();
			
		//邮箱验证
		email_form.validate({
			errorPlacement: function(error, element) {
				//错误提示容器
				email_tip.show().html(error);
			},
			errorElement: 'span',
			errorClass : 'tips_icon_error',
			validClass		: 'tips_icon_success',
			onkeyup : false, //remote ajax
			rules: {
				email : {
					required	: true,
					email : true,
					remote		: {
						url : "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-register-checkemail'; ?>", 
						type : 'post',
						dataType: "json",
						data : {
							username: '<?php echo htmlspecialchars($username, ENT_QUOTES, 'UTF-8');?>',
							email : function(){
								return $("#J_email_input").val();
							}
						}
					}
				}
			},
			highlight	: false,
			unhighlight	: function(element, errorClass, validClass) {
				email_tip.hide();
			},
			onfocusout	:  function(element){
				/*var _this = this;
				if(email_input.val() === $('#J_orgin_email').text()) {
					email_tip.show().html('<span class="'+ this.settings.errorClass +'" data-text="text">与目前邮箱相同，请重新输入<span>');
					return;
				}*/
				//邮箱匹配点击后，延时处理
				/*setTimeout(function(){
					_this.element(element);
				}, 150);*/
			},
			messages : {
				email : {
					required : '邮箱不能为空',
					email : '请输入正确的电子邮箱地址',
					remote : '该电子邮箱已被注册，请更换别邮箱' //ajax验证默认提示
				}
			},
			submitHandler:function(form) {
				//提交
				var btn = $(form).find('button:submit');
				$(form).ajaxSubmit({
					dataType	: 'json',
					beforeSubmit: function(arr, $form, options) {
						//global.js
						Wind.Util.ajaxBtnDisable(btn);
					},
					success		: function(data, statusText, xhr, $form) {
						//global.js
						Wind.Util.ajaxBtnEnable(btn);
						
						if(data.state === 'success') {
							Wind.Util.resultTip({
								msg : data.message,
								follow : btn
							});

							emailPopHide();
						}else if(data.state === 'fail'){
							email_tip.text(data.message).show();
						}
					}
				});
			}
		});

	});
	
	
					
	//点击关闭
	$('#J_email_close, #J_email_cancl').on('click', function(e){
		e.preventDefault();
		emailPopHide();
	});
	
	
	//关闭邮箱修改弹窗
	function emailPopHide(){
		email_change_wrap.hide();
		email_input.val('');
		email_tip.html('').hide();
	}
	
});
</script>
</body>
</html>
