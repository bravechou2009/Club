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
<link href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/space/default/css'.Wekit::getGlobal('theme','debug'); ?>/style.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
</head>
<body <?php echo $space->space['backbround'];?>>
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
		<source src="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/space/default/images'; ?>/message/msg.wav" type="audio/wav" />
		<source src="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/space/default/images'; ?>/message/msg.mp3" type="audio/mp3" />
		<div style='overflow:hidden;width:0;float:left'><embed src='<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/space/default/images'; ?>/message/msg.wav' width='0' height='0' AutoStart='true' type='application/x-mplayer2'></embed></div>
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
<div class="space_page">
	<div class="space_header cc">
	<div class="title">
		<h1><a href="<?php echo htmlspecialchars($space->space['domain'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($space->space['space_name'], ENT_QUOTES, 'UTF-8');?></a></h1><div class="num">访问量<span><em></em><?php echo htmlspecialchars($space->space['visit_count'], ENT_QUOTES, 'UTF-8');?></span></div>
	</div>
	<div class="descrip"><?php echo htmlspecialchars($space->space['space_descrip'], ENT_QUOTES, 'UTF-8');?></div>
	<div class="space_nav">
		<ul>
			<li class="<?php echo htmlspecialchars(Pw::isCurrent($src == 'index'), ENT_QUOTES, 'UTF-8');?>"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($space->spaceUid),'.html'; ?>">新鲜事</a></li>
			<li class="<?php echo htmlspecialchars(Pw::isCurrent($src == 'thread'), ENT_QUOTES, 'UTF-8');?>"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-thread-run?uid=', rawurlencode($space->spaceUid); ?>">帖子</a></li>
			<?php
PwHook::display(array(PwSimpleHook::getInstance("space_nav"), "runDo"), array($space, $src), "", $__viewer);
?>
			<li class="<?php echo htmlspecialchars(Pw::isCurrent($src == 'profile'), ENT_QUOTES, 'UTF-8');?>"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-profile-run?uid=', rawurlencode($space->spaceUid); ?>">资料</a></li>
		</ul>
	</div>
	<?php  if ($space->tome == 2){ ?>
	<!--div class="fr"><div class="space_set_tip"></div></div-->
	<?php  } ?>
	<div class="url"><a href="<?php echo htmlspecialchars($space->space['domain'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($space->space['domain'], ENT_QUOTES, 'UTF-8');?></a></div>
</div>
	<?php  if ($space->tome == 2){ ?>
		<a id="J_space_set" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-myspace-run'; ?>" class="design_space_edit">模块管理</a>
	<?php  } ?>

	<div class="cc">
		<div class="space_content">
			<div class="box">
				<div class="my_article">
					<div class="hd">
							<h2><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-follows-run?uid=', rawurlencode($space->spaceUid); ?>"  class="<?php echo htmlspecialchars($classCurrent[0], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($host, ENT_QUOTES, 'UTF-8');?>的关注</a></h2>
					</div>
				</div>
				<div class="space_fans">
				<?php  if ($follows) { 
  foreach ($follows as $key => $value) { ?>
				<dl class="cc">
					<dt><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($value['touid']),'.html'; ?>" data-uid="<?php echo htmlspecialchars($value['touid'], ENT_QUOTES, 'UTF-8');?>" class="J_user_card_show"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($value['touid'], 'small'), ENT_QUOTES, 'UTF-8');?>" data-type="small" width="50" height="50" /></a><a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-message-pop?username=', rawurlencode($value['username']); ?>" data-name="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>" class="called J_send_msg_pop J_qlogin_trigger">打招呼</a></dt>
					<dd>
						<div class="title">
							<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($value['touid']),'.html'; ?>" data-uid="<?php echo htmlspecialchars($value['touid'], ENT_QUOTES, 'UTF-8');?>" class="name J_user_card_show"><?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?></a>
						<?php  $status = Pw::checkOnline($value['lastvisit']) ? '' : 'un';
							if($value['gender']){ ?>
							<span class="women_<?php echo htmlspecialchars($status, ENT_QUOTES, 'UTF-8');?>ol"></span>
						<?php  }else{ ?>
							<span class="man_<?php echo htmlspecialchars($status, ENT_QUOTES, 'UTF-8');?>ol"></span>
						<?php  } ?>
						</div>
						<div class="num">
							关注<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-follows-run?uid=', rawurlencode($value['uid']); ?>"><?php echo htmlspecialchars($value['follows'], ENT_QUOTES, 'UTF-8');?></a><span>|</span>粉丝<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-fans-run?uid=', rawurlencode($value['uid']); ?>"><?php echo htmlspecialchars($value['fans'], ENT_QUOTES, 'UTF-8');?></a><span>|</span>帖子<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-thread-run?uid=', rawurlencode($value['uid']); ?>"><?php echo htmlspecialchars($value['postnum'], ENT_QUOTES, 'UTF-8');?></a>
						</div>
						<!-- <div class="action">回复了帖子<a href="">那些年，我们一起游过的海南（完整版）</a><span class="time">（<?php echo htmlspecialchars(Pw::time2str($value['created_time'], 'auto'), ENT_QUOTES, 'UTF-8');?>）</span></div> -->

						<div class="attribute">
							<?php  if (isset($myfollows[$value['uid']])) { 
  if (isset($fans[$value['uid']])) {?>
								<span class="mnfollow" title="互相关注">互相关注</span>
								<?php } else {?>
								<span class="core_unfollow">已关注</span>
								<?php  } 
  } elseif ($loginUser->isExists() && $loginUser->uid != $value['uid']) {
								$isfan = isset($fans[$value['uid']]) ? 'true' : 'false';
							?>
							<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-add'; ?>" class="core_follow J_spaceta_follow J_qlogin_trigger" data-followed="<?php echo htmlspecialchars($isfan, ENT_QUOTES, 'UTF-8');?>" data-uid="<?php echo htmlspecialchars($value['touid'], ENT_QUOTES, 'UTF-8');?>">加关注</a>
							<?php  } ?>
						</div>
					</dd>
				</dl>
				<?php  } 
 $__tplPageCount=(int)$count;
$__tplPagePer=(int)$perpage;
$__tplPageTotal=(int)0;
$__tplPageCurrent=(int)$page;
if($__tplPageCount > 0 && $__tplPagePer > 0){
$__tmp = ceil($__tplPageCount / $__tplPagePer);
($__tplPageTotal !== 0 &&  $__tplPageTotal < $__tmp) || $__tplPageTotal = $__tmp;}
$__tplPageCurrent > $__tplPageTotal && $__tplPageCurrent = $__tplPageTotal;
if ($__tplPageTotal > 1) {
 
$_page_min = max(1, $__tplPageCurrent-3);
$_page_max = min($__tplPageTotal, $__tplPageCurrent+3);
?>
<div class="pages">
<?php  if ($__tplPageCurrent > $_page_min) { 
	$_page_i = $__tplPageCurrent-1;
?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-follows-run?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_pre J_pages_pre">&laquo;&nbsp;上一页</a>
	<?php  if ($_page_min > 1) { 
		$_page_i = 1;		
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-follows-run?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>">1...</a>
	<?php  } 
  for ($_page_i = $_page_min; $_page_i < $__tplPageCurrent; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-follows-run?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  } ?>
	<strong><?php echo htmlspecialchars($__tplPageCurrent, ENT_QUOTES, 'UTF-8');?></strong>
<?php  if ($__tplPageCurrent < $_page_max) { 
  for ($_page_i = $__tplPageCurrent+1; $_page_i <= $_page_max; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-follows-run?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  if ($_page_max < $__tplPageTotal) { 
		$_page_i = $__tplPageTotal;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-follows-run?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>">...<?php echo htmlspecialchars($__tplPageTotal, ENT_QUOTES, 'UTF-8');?></a>
	<?php  }
		$_page_i = $__tplPageCurrent+1;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-follows-run?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_next J_pages_next">下一页&nbsp;&raquo;</a>
<?php  } ?>
</div>
<?php } 
  } else { ?>
				<form action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-batchadd'; ?>" method="post" id="J_nofollow_form">
					<!--无关注人时-->
					
					<?php if ($space->tome == 2) {
 if($recommend){?>
							<div class="nofollow_list J_check_wrap">
								<div class="hd">啊哦，你还没有关注任何人，赶紧先关注些人！</div>
								<ul class="cc">
									<?php  foreach ($recommend as $value) { ?>
									<li><a data-uid="<?php echo htmlspecialchars($value['uid'], ENT_QUOTES, 'UTF-8');?>" class="J_user_card_show" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($value['uid']),'.html'; ?>"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($value['uid'], 'middle'), ENT_QUOTES, 'UTF-8');?>" data-type="middle" width="90" height="90" alt="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>" /></a><label><input class="J_check" type="checkbox" name="uids[]" value="<?php echo htmlspecialchars($value['uid'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?></label></li>
									<?php  } ?>
								</ul>
								<div class="ft">
									<button type="submit" class="btn btn_big btn_submit disabled" disabled="true" id="J_nofollow_btn"><span class="add"></span>关注</button>
									<label><input class="J_check_all" type="checkbox">全选</label>
								</div>
							</div>
						<?php } else {?>
							<div class="not_content">啊哦，你还没有关注任何人，赶紧先关注些人！</div>
						<?php }
 } else {?>
						<div class="not_content">啊哦，Ta还没有关注任何人！</div>
					<?php }?>
					
					
					<!--无关注人时结束-->	
				<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
				<?php  } ?>	
				</div>
			</div>

		</div>
		<div class="space_sidebar">
					<div class="box">
				<div class="space_user_info">
					<div class="face"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($space->spaceUid,'big'), ENT_QUOTES, 'UTF-8');?>" data-type="big" width="180" height="180" /></div>
					<h2 class="name"><?php echo htmlspecialchars($space->spaceUser['username'], ENT_QUOTES, 'UTF-8');?></h2>
					<?php  if($space->tome != 2){ ?>
					<div class="operate cc">
						<?php  if($space->tome >= 4){ ?>
						<a class="follow unfollow J_space_follow J_qlogin_trigger" data-uid="<?php echo htmlspecialchars($space->spaceUid, ENT_QUOTES, 'UTF-8');?>" data-role="unfollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-delete?uid=', rawurlencode($space->spaceUid); ?>" >取消关注</a>
						<?php  }else{ ?>
						<a rel="nofollow" class="J_space_follow follow J_qlogin_trigger" data-uid="<?php echo htmlspecialchars($space->spaceUid, ENT_QUOTES, 'UTF-8');?>" data-role="follow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-add'; ?>"><em></em>加关注</a>
						<?php  } ?>		
						<a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-message-pop?uid=', rawurlencode($space->spaceUser['uid']); ?>" class="message J_qlogin_trigger J_send_msg_pop" data-name="<?php echo htmlspecialchars($space->spaceUser['username'], ENT_QUOTES, 'UTF-8');?>"><em></em>写私信</a>
						<?php
PwHook::display(array(PwSimpleHook::getInstance("space_user_info"), "runDo"), array($space), "", $__viewer);
?>
					</div>
					<?php  } ?>	
					<div class="present"><?php echo htmlspecialchars($space->spaceUser['sign'], ENT_QUOTES, 'UTF-8');?></div>
					<div class="num">
						<ul>
							<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-follows-run?uid=', rawurlencode($space->spaceUid); ?>"><span><?php echo htmlspecialchars($space->spaceUser['follows'], ENT_QUOTES, 'UTF-8');?></span><em>关注</em></a></li>
							<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-fans-run?uid=', rawurlencode($space->spaceUid); ?>"><span><?php echo htmlspecialchars($space->spaceUser['fans'], ENT_QUOTES, 'UTF-8');?></span><em>粉丝</em></a></li>
							<li class="tail"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-thread-run?uid=', rawurlencode($space->spaceUid); ?>"><span><?php echo htmlspecialchars($space->spaceUser['postnum'], ENT_QUOTES, 'UTF-8');?></span><em>帖子</em></a></li>
						</ul>
					</div>
					<?php  if (Wekit::C('site','medal.isopen')){ ?>
					<div class="medal">
						<ul class="cc">
							<?php  
								$medalIds = explode(',', $space->spaceUser['medal_ids']);
								$medals = Wekit::load('medal.srv.PwMedalCache')->fetchMedal($medalIds);
								foreach ($medals as $medal){
							?>
								<li><a rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>"/></a>
								</li>
							<?php  } ?>	
						</ul>
					</div>
					<?php  } 
  
					$punchService = Wekit::load('space.srv.PwPunchService');
					list($punchOpen,$punchFriendOpen) = $punchService->getPunchConfig();
					if ($punchOpen && ($space->tome == 2 || ($space->tome == 3 && $punchFriendOpen))) {
							list($punchStatus,$punchButton,$punchData) = $punchService->getSpacePunch($space);
							$punchStatus = $punchStatus ? '' : 'punch_widget_disabled';
							if ($space->tome == 2) {
								$punchUrl = WindUrlHelper::createUrl('space/punch/punch');
								$spaceTome = '你';
							} else {
								$punchUrl = WindUrlHelper::createUrl('space/punch/dofriend?friend='.$space->spaceUser['uid']);
								$spaceTome = 'Ta';
							}
							list($monthDay,$weekDay) = $punchService->formatWeekDay(Pw::getTime());
					 ?>
						<div class="punch_widget <?php echo htmlspecialchars($punchStatus, ENT_QUOTES, 'UTF-8');?>" id="J_punch_widget" style="display:none;">
							<div class="date"><?php echo htmlspecialchars($monthDay, ENT_QUOTES, 'UTF-8');?><span><?php echo htmlspecialchars($weekDay, ENT_QUOTES, 'UTF-8');?></span></div>
							<div class="cont"><a id="J_punch_mine" data-role="space" href="<?php echo htmlspecialchars($punchUrl, ENT_QUOTES, 'UTF-8');?>" class="btn_punch"><?php echo htmlspecialchars($punchButton, ENT_QUOTES, 'UTF-8');?></a></div>
						</div>
						<?php  if ($punchData) { ?>
						<div style="display:none;"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-index-run?username=', rawurlencode($punchData['username']); ?>"><?php echo htmlspecialchars($punchData['username'], ENT_QUOTES, 'UTF-8');?></a> 已帮<?php echo htmlspecialchars($spaceTome, ENT_QUOTES, 'UTF-8');?>领取<?php echo htmlspecialchars($punchData['cNum'], ENT_QUOTES, 'UTF-8');
 echo htmlspecialchars($punchData['cUnit'], ENT_QUOTES, 'UTF-8');
 echo htmlspecialchars($punchData['cType'], ENT_QUOTES, 'UTF-8');?></div>
						<?php  } 
  } ?>
				</div>
			</div>
<script>
	var SPACE_FOLLOW = "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-add'; ?>",
		SPACE_UNFOLLOW = "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-delete'; ?>";
</script>
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
var URL_UNFOLLOW = "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-delete'; ?>",
		URL_FOLLOW = "<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-add'; ?>";
//引入js组件
Wind.use('jquery', 'global', 'dialog', 'ajaxForm', 'tabs', 'draggable', 'uploadPreview', function(){
	Wind.js(GV.JS_ROOT +'pages/space/space_index.js?v='+ GV.JS_VERSION);

	//关注 取消
	var lock = false;
	$('a.J_spaceta_follow').on('click', function(e){
		if(!GV.U_ID) {
			return false;
		}
		e.preventDefault();
		var $this = $(this);

		if(lock) {
			return false;
		}
		lock = true;

		Wind.Util.ajaxMaskShow();
		$.post(this.href, {
			uid: $this.data('uid')
		}, function(data){
			Wind.Util.ajaxMaskRemove();
			lock = false;

			if(data.state == 'success') {
				var followed = $this.data('followed');
				if(followed) {
					//已关注我
					$this.replaceWith('<span class="mnfollow">互相关注</span>');
				}else{
					$this.replaceWith('<span class="core_unfollow">已关注</span>');
				}

			}else if(data.state == 'fail') {
				Wind.Util.resultTip({
					elem : $this,
					error : true,
					follow : true,
					msg : data.message[0]
				});
			}
			
		}, 'json').fail(function(){
			lock = false;
		});

	});

<?php  if (!$follows) { ?>
	/*
	 * 无关注
	*/
	var nofollow_btn = $('#J_nofollow_btn');
	$('input:checkbox').prop('checked', false);
	//复选框
	$('input.J_check_all').on('change', function(){
		if(this.checked) {
			nofollow_btn.prop('disabled', false).removeClass('disabled');
		}else{
			nofollow_btn.prop('disabled', true).addClass('disabled');
		}
	});

	var checks = $('input.J_check');

	checks.on('change', function(){
		if (checks.filter(':checked').length > 0) {
			nofollow_btn.prop('disabled', false).removeClass('disabled');
		}else{
			nofollow_btn.prop('disabled', true).addClass('disabled');
		}
	});

	$('#J_nofollow_form').ajaxForm({
		dataType : 'json',
		beforeSubmit : function(){
			//global.js
			Wind.Util.ajaxBtnDisable(nofollow_btn);
		},
		success : function(data){
			if(data.state == 'success') {
				location.reload();
			}else{
				//global.js
				Wind.Util.ajaxBtnEnable(nofollow_btn);
			}
		}
	});
<?php  } ?>
});
</script>
</body>
</html>