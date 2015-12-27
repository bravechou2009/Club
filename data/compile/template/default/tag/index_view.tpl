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
<link href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/css'.Wekit::getGlobal('theme','debug'); ?>/tag.css?v=<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
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
		<pw-tpl id="main_segment"/>
		<div class="bread_crumb">
			<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/',''; ?>" class="home" title="<?php echo Wekit::C("site", "info.name"); ?>">首页</a><em>&gt;</em><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-run'; ?>">话题</a><em>&gt;</em><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag/', rawurlencode($tag['tag_name']),'.html'; ?>"><?php echo htmlspecialchars($tag['tag_name'], ENT_QUOTES, 'UTF-8');?></a>
		</div>
		<pw-tpl id="myTagPage_segment"/>
		<div class="main cc">
			<div class="main_body">
				<div class="main_content">
					<div class="box_wrap tag_info_box cc">
						<div class="banner"><img src="<?php echo htmlspecialchars(Pw::getPath($tag['tag_logo']), ENT_QUOTES, 'UTF-8');?>" width="110" alt="<?php echo htmlspecialchars($tag['tag_name'], ENT_QUOTES, 'UTF-8');?>" onerror="this.onerror=null;this.src='<?php echo Wind::getComponent('response')->getData('G', 'url', 'themes').'/site/default/images'; ?>/tags/default.png'"/></div>
						<div class="name"><h3><?php echo htmlspecialchars($tag['tag_name'], ENT_QUOTES, 'UTF-8');?></h3>
						<?php  if (!$tag['attention']) { ?>
						<a rel="nofollow" id="J_follow_btn" data-type="add" data-id="<?php echo htmlspecialchars($tag['tag_id'], ENT_QUOTES, 'UTF-8');?>" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-attention?id=', rawurlencode($tag['tag_id']),'&type=add'; ?>" class="core_follow J_qlogin_trigger">关注该话题</a>
						<?php  } else { ?>
						<a rel="nofollow" id="J_follow_btn" data-type="del" data-id="<?php echo htmlspecialchars($tag['tag_id'], ENT_QUOTES, 'UTF-8');?>" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-attention?id=', rawurlencode($tag['tag_id']),'&type=del'; ?>" class="core_unfollow J_qlogin_trigger">取消关注</a>
						<?php  } ?>
						</div>
						<div class="num">
							<ul class="cc">
								<li>帖子：<em><?php echo htmlspecialchars($tag['content_count'], ENT_QUOTES, 'UTF-8');?></em></li>
								<li>被关注：<em id="J_follow_count"><?php echo htmlspecialchars($tag['attention_count'], ENT_QUOTES, 'UTF-8');?></em></li>
							</ul>
						</div>
						<div class="notice">
						<?php  $subExcerpt = Pw::substrs($tag['excerpt'], 170); ?>
							<span id="J_tag_excerpt_part"><?php echo htmlspecialchars($subExcerpt, ENT_QUOTES, 'UTF-8');?></span>
							<span style="display:none;" id="J_tag_excerpt_all"><?php echo htmlspecialchars($tag['excerpt'], ENT_QUOTES, 'UTF-8');?></span>
							<?php  if ($tag['excerpt'] != $subExcerpt) { ?>
							<a href="#" id="J_show_more" data-type="open" class="more s4">阅读全部&darr;</a>
							<?php  } ?>
						</div>
					</div>
					<div class="box_wrap tag_page_view">
						<div class="content_nav">
							<ul class="cc">
							<?php  $thread_current = !$args['type'] ?  "class='current'" : '';
									$user_current = ($args['type'] == 'users') ?  "class='current'" : '';
							?>
								<li <?php echo $thread_current;?>><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag/', rawurlencode($tag['tag_name']),'.html'; ?>">最新帖子</a></li>
								<li <?php echo $user_current;?>><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag/', rawurlencode($tag['tag_name']),'.html?type=users'; ?>">会员</a></li>
							</ul>
						</div>
						<div class="">
					<?php  if ($args['type'] == 'users') { 
  if ($users) { ?>
						<div class="tag_uesr_list">
							<ul class="cc">
								<?php  foreach ($users as $u) { ?>
								<li>
									<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($u['uid']),'.html'; ?>" class="J_user_card_show" data-uid="<?php echo htmlspecialchars($u['uid'], ENT_QUOTES, 'UTF-8');?>"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($u['uid'], 'middle'), ENT_QUOTES, 'UTF-8');?>" data-type="middle" width="100" height="100" alt="<?php echo htmlspecialchars($u['username'], ENT_QUOTES, 'UTF-8');?>" /></a>
									<p><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($u['uid']),'.html'; ?>" class="J_user_card_show" data-uid="<?php echo htmlspecialchars($u['uid'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($u['username'], ENT_QUOTES, 'UTF-8');?></a></p>
								</li>
								<?php  } ?>
							</ul>
						</div>
						<div class="tac">
							<?php $__tplPageCount=(int)$count;
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
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_pre J_pages_pre">&laquo;&nbsp;上一页</a>
	<?php  if ($_page_min > 1) { 
		$_page_i = 1;		
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>">1...</a>
	<?php  } 
  for ($_page_i = $_page_min; $_page_i < $__tplPageCurrent; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  } ?>
	<strong><?php echo htmlspecialchars($__tplPageCurrent, ENT_QUOTES, 'UTF-8');?></strong>
<?php  if ($__tplPageCurrent < $_page_max) { 
  for ($_page_i = $__tplPageCurrent+1; $_page_i <= $_page_max; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  if ($_page_max < $__tplPageTotal) { 
		$_page_i = $__tplPageTotal;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>">...<?php echo htmlspecialchars($__tplPageTotal, ENT_QUOTES, 'UTF-8');?></a>
	<?php  }
		$_page_i = $__tplPageCurrent+1;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_next J_pages_next">下一页&nbsp;&raquo;</a>
<?php  } ?>
</div>
<?php } ?>
						</div>
						<?php  } else { ?>
						<div class="not_content">
							<p>啊哦，暂没有会员关注该话题哦，我来<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-attention?id=', rawurlencode($tag['tag_id']),'&type=add'; ?>" id="J_none_follow" class="J_qlogin_trigger">关注一下</a>！</p>
						</div>
						<?php  } 
  } else { 
  if ($contents) { ?>
						<div class="tag_lists_wrap" id="J_tag_feed_lists">
							<?php  foreach ($contents as $key => $value) { 
								if (!$value['content']) continue;
							?>
							<dl class="cc">
								<dt class="face"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($value['created_userid']),'.html'; ?>" class="J_user_card_show" data-uid="<?php echo htmlspecialchars($value['created_userid'], ENT_QUOTES, 'UTF-8');?>"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($value['created_userid'], 'small'), ENT_QUOTES, 'UTF-8');?>" data-type="small" width="50" height="50" alt="<?php echo htmlspecialchars($value['created_username'], ENT_QUOTES, 'UTF-8');?>" /></a></dt>
								<dd class="text_content">
									<?php  if ($allowManage) { 
  if ($value['tagifcheck']) { ?>
									<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-doshield?id=', rawurlencode($tag['tag_id']),'&type_id=', rawurlencode($value['type_id']),'&param_id=', rawurlencode($value['param_id']),'&ifcheck=0'; ?>" class="shield J_tag_shield" title="将该帖移出这个话题">屏蔽</a>
										<?php  } else { ?>
									<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-doshield?id=', rawurlencode($tag['tag_id']),'&type_id=', rawurlencode($value['type_id']),'&param_id=', rawurlencode($value['param_id']),'&ifcheck=1'; ?>" class="shield J_tag_shield" title="取消屏蔽">取消屏蔽</a>
										<?php  } 
  } ?>
									<div class="content">
										<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($value['created_userid']),'.html'; ?>" class="name J_user_card_show" data-uid="<?php echo htmlspecialchars($value['created_userid'], ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($value['created_username'], ENT_QUOTES, 'UTF-8');?></a>：
										<em><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','articles/', rawurlencode($value['tid']),'.html'; ?>" class="title"><?php echo htmlspecialchars($value['subject'], ENT_QUOTES, 'UTF-8');?></a></em><br>
										<div class="descrip"><?php echo htmlspecialchars(Pw::substrs(Pw::stripWindCode($value['content'],true),125), ENT_QUOTES, 'UTF-8');?></div>
									</div>
									<div class="info">
										<span class="time"><?php echo htmlspecialchars($value['created_time_auto'], ENT_QUOTES, 'UTF-8');?></span>&nbsp;来自版块&nbsp;-&nbsp;<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','thread/', rawurlencode($value['fid']),'.html'; ?>"><?php echo $value['forum_name'];?></a>
										<?php  if($relatedTags[$value['tid']]){ 
  foreach($relatedTags[$value['tid']] as $k=>$v){ if ($k==$key) continue; ?>
											<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag/', rawurlencode($v['tag_name']),'.html'; ?>"><?php echo htmlspecialchars($v['tag_name'], ENT_QUOTES, 'UTF-8');?></a>
											<?php  } 
  } ?>
									</div>
								</dd>
							</dl>
							<?php  } ?>
							<div class="tac">
								<?php $__tplPageCount=(int)$count;
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
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_pre J_pages_pre">&laquo;&nbsp;上一页</a>
	<?php  if ($_page_min > 1) { 
		$_page_i = 1;		
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>">1...</a>
	<?php  } 
  for ($_page_i = $_page_min; $_page_i < $__tplPageCurrent; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  } ?>
	<strong><?php echo htmlspecialchars($__tplPageCurrent, ENT_QUOTES, 'UTF-8');?></strong>
<?php  if ($__tplPageCurrent < $_page_max) { 
  for ($_page_i = $__tplPageCurrent+1; $_page_i <= $_page_max; $_page_i++) { 
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($_page_i, ENT_QUOTES, 'UTF-8');?></a>
	<?php  } 
  if ($_page_max < $__tplPageTotal) { 
		$_page_i = $__tplPageTotal;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>">...<?php echo htmlspecialchars($__tplPageTotal, ENT_QUOTES, 'UTF-8');?></a>
	<?php  }
		$_page_i = $__tplPageCurrent+1;
	?>
	<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view?page=', rawurlencode($_page_i); 
 echo htmlspecialchars($args ? '&' . http_build_query($args) : '', ENT_QUOTES, 'UTF-8');?>" class="pages_next J_pages_next">下一页&nbsp;&raquo;</a>
<?php  } ?>
</div>
<?php } ?>
							</div>
						</div>
						<?php  } else { ?>
						<div class="not_content">
							啊哦，这个话题下暂没有任何内容哦！
						</div>
						<?php  } 
  } ?>
						</div>
					</div>
				</div>
			</div>
			<div class="main_sidebar">
				<?php  if (!$loginUser->isExists()) { 
  Wind::import('APPS:u.service.helper.PwUserHelper'); 
  $_loginWay = PwUserHelper::getLoginMessage(); ?>
    <div class="box_wrap sidebar_login">
        <!--
		<form id="J_login_form" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-login-dologin'; ?>" method="post">
		<dl>
			<dt id="J_sidebar_login_dt" class="cc">
				<i class="icon_username" title="请输入<?php echo htmlspecialchars($_loginWay, ENT_QUOTES, 'UTF-8');?>"></i><label for="J_username">用户名</label><input required type="text" class="input" id="J_username" name="username" placeholder="<?php echo htmlspecialchars($_loginWay, ENT_QUOTES, 'UTF-8');?>">
				<i class="icon_password" title="请输入密码"></i><label for="J_password">密　码</label><input required type="password" class="input" id="J_password" name="password" placeholder="密码">
			</dt>
			<dd class="associate"><a class="sendpwd" rel="nofollow" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-findPwd-run'; ?>">找回密码</a><label for="head_checkbox" title="下次自动登录"><input type="checkbox" id="head_checkbox" name="rememberme" value="31536000">自动登录</label></dd>
			<dd class="operate"><button type="submit" id="J_sidebar_login" class="btn btn_big btn_submit">登录</button><a class="btn btn_big btn_error" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-register-run'; ?>" rel="nofollow">立即注册</a></dd>
		</dl>
		<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
        -->
        <dd class="operate"><button type="button" id="J_sidebar_login" class="btn btn_big btn_submit" onclick="location.href='<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-login-run'; ?>'">登录</button><a class="btn btn_big btn_error" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-register-run'; ?>" rel="nofollow" onclick="location.href='<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','u-register-run'; ?>'">立即注册</a></dd>
    </div>
<?php  } else { 
  $_group = $loginUser->getGroupInfo(); ?>
	<div class="box_wrap user_info">
		<dl class="cc">
			<dt id="J_ava_ie6">
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($loginUser->uid),'.html'; ?>"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($loginUser->uid), ENT_QUOTES, 'UTF-8');?>" data-type="middle" width="72" height="72" alt="<?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?>" /></a>
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','profile-avatar-run?_left=avatar'; ?>"><b></b><span>修改头像</span></a>
			</dt>
			<dd>
				<div class="name"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($loginUser->uid),'.html'; ?>" class="username"><?php echo htmlspecialchars($loginUser->username, ENT_QUOTES, 'UTF-8');?><i></i></a></div>
				<div class="level"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','profile-right-run?_left=right'; ?>"><?php echo htmlspecialchars($_group['name'], ENT_QUOTES, 'UTF-8');?></a></div>
				<div class="level_img">
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','profile-credit-run'; ?>"><img src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>/level/<?php echo htmlspecialchars($_group['image'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($_group['name'], ENT_QUOTES, 'UTF-8');?>" /></a>
				</div>
			</dd>
		</dl>
		<div class="num">
			<ul class="cc">
				<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-run'; ?>"><span><?php echo htmlspecialchars($loginUser->info['follows'], ENT_QUOTES, 'UTF-8');?></span><em>关注</em></a></li>
				<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-fans-run'; ?>"><span><?php echo htmlspecialchars($loginUser->info['fans'], ENT_QUOTES, 'UTF-8');?></span><em>粉丝</em></a></li>
				<li class="tail"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-article-run'; ?>"><span><?php echo htmlspecialchars($loginUser->info['postnum'], ENT_QUOTES, 'UTF-8');?></span><em>帖子</em></a></li>
			</ul>
		</div>
	<?php  if (Wekit::C('site','medal.isopen')){ ?>
		<div class="medal_widget" id="J_medal_widget">
			<a href="javascript:;" class="next next_disabled J_lazyslide_next" title="下一组"><em></em></a>
			<a href="javascript:;" class="pre pre_disabled J_lazyslide_prev" title="上一组"><em></em></a>
			<div class="medal_list_wrap">
			<ul id="J_medal_widget_ul" class="cc J_lazyslide_list" style="width:900px;">
			<?php  
				$J_medals = Wekit::load('medal.srv.PwMedalCache')->getMyAndAutoMedal($loginUser->uid);
				$_medals = array_slice($J_medals, 0, 6, true);
				foreach ($_medals as $medal){
			
  if($medal['award_status'] !=4){ ?>
					<li class="doing"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" /></a></li>
				<?php  }else{ ?>
					<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" /></a></li>
				<?php  } 
  } ?>
			</ul>
			<textarea id="J_sidebar_medal_ta" style="display:none">
				<?php  foreach ($J_medals as $medal){ 
  if($medal['award_status'] !=4){ ?><li class="doing"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" /></a></li><?php  }else{ ?><li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>"><img src="<?php echo htmlspecialchars($medal['icon'], ENT_QUOTES, 'UTF-8');?>" width="30" height="30" title="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" alt="<?php echo htmlspecialchars($medal['name'], ENT_QUOTES, 'UTF-8');?>" /></a></li><?php  } 
  } ?></textarea>
			</div>
		</div>
	<?php  } 
  
	$punchService = Wekit::load('space.srv.PwPunchService');
	list($punchOpen,$punchFriendOpen) = $punchService->getPunchConfig();
	if ($punchOpen) {
		list($punchStatus,$punchButton,$punchData) = $punchService->getPunch();
		$punchStatus = $punchStatus ? '' : 'punch_widget_disabled';
		list($monthDay,$weekDay) = $punchService->formatWeekDay(Pw::getTime());
	 ?>
	<div class="cc punch_widget_wrap">
		<div id="J_punch_main_tip" class="fl dn">
		<?php  if ($punchData) { ?>
			<div class="tips">
				<div class="core_arrow_top"><em></em><span></span></div>
				<?php echo htmlspecialchars($punchData['username'], ENT_QUOTES, 'UTF-8');?>已帮你领取<span class="red"><?php echo htmlspecialchars($punchData['cNum'], ENT_QUOTES, 'UTF-8');?></span><?php echo htmlspecialchars($punchData['cUnit'], ENT_QUOTES, 'UTF-8');
 echo htmlspecialchars($punchData['cType'], ENT_QUOTES, 'UTF-8');?>
			</div>
		<?php  } ?>
		</div>
		<div class="punch_widget <?php echo htmlspecialchars($punchStatus, ENT_QUOTES, 'UTF-8');?>" id="J_punch_widget">
			<div class="date"><?php echo htmlspecialchars($monthDay, ENT_QUOTES, 'UTF-8');?><span><?php echo htmlspecialchars($weekDay, ENT_QUOTES, 'UTF-8');?></span></div>
			<div class="cont"><a data-tips="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-punch-punchtip'; ?>" data-uri="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-punch-punch'; ?>" href="#" id="J_punch_mine" tabindex="-1" target="_blank"><?php echo htmlspecialchars($punchButton, ENT_QUOTES, 'UTF-8');?></a></div>
			<?php  if ($punchFriendOpen) { ?>
			<a data-uri="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','space-punch-friend'; ?>" href="#" id="J_punch_friend" class="help_ta" tabindex="-1" target="_blank">帮Ta打卡</a>
			<?php  } ?>
		</div>
	</div>
<?php  } ?>
	</div>
<?php  } ?>

<pw-drag id="sidebar_1" />
<?php  if ($loginUser->isExists()) { ?>
	<div class="box_wrap">
		<h2 class="box_title J_sidebar_box_toggle">我的应用</h2>
		<div class="my_app_list">
			<ul>
				<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','vote-my-run'; ?>"><span class="icon_vote"></span>投票</a></li>
				<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','like-mylike-run'; ?>"><span class="icon_like"></span>喜欢</a></li>
				<?php  if (Wekit::C('site','medal.isopen')){ ?>
				<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>"><span class="icon_medal"></span>勋章</a></li>
				<?php }
 if (1 == Wekit::C('site', 'task.isOpen')) {?>
				<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','task-index-run'; ?>"><span class="icon_task"></span>任务</a></li>
				<?php }?>
			</ul>
		</div>
	</div>
<?php  } ?>
<!--advertisement id='Site.Sider.User' sys='1'/-->
<?php  
	if ($loginUser->info['recommend_friend']) {
		$pFriends = Wekit::load('attention.srv.PwAttentionRecommendFriendsService')->getRecommentUser($loginUser);
		if ($pFriends) {
		$otherFriends = array_slice($pFriends,3);
		$pFriends = array_slice($pFriends,0,3);
 ?>
<div class="box_wrap" id="J_friend_maybe">
	<h2 class="box_title J_sidebar_box_toggle">可能认识的人</h2>
	<div class="side_may_list" id="J_friend_maybe_list" data-url="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-recommendfriend'; ?>">
	<?php 
		$i = 0;
		foreach($pFriends as $v){
			$pUid = $v['uid'];
			//if ($v['cnt'] < 1) continue;
			$class = ($i > 1) ? 'display:none;' : '';
			$class2 = ($i > 0) ? 'display:none;' : '';
			$load = ($i > 0) ? 'false' : 'true';
			$arrow = ($i == 0) ? '&uarr;' : '&darr;';
	 ?>
		<div class="J_friend_maybe_items">
			<dl>
				<dt><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($pUid),'.html'; ?>" class="J_user_card_show" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>"><img class="J_avatar" src="<?php echo htmlspecialchars(Pw::getAvatar($pUid,'small'), ENT_QUOTES, 'UTF-8');?>" width="50" height="50" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>" data-type="small" /></a></dt>
				<dd>
					<p class="title"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($pUid),'.html'; ?>" class="J_user_card_show" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($v['username'], ENT_QUOTES, 'UTF-8');?></a></p>
					<p><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-add'; ?>" class="core_follow J_friend_maybe_follow mr10" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>" role="button" rel="nofollow">关注</a>
					<?php  if ($v['cnt']) { ?>
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-samefriend?uid=', rawurlencode($pUid); ?>" class="unmore J_friend_view" data-uid="<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($v['cnt'], ENT_QUOTES, 'UTF-8');?>个共同好友<?php echo $arrow;?></a>
					<?php  } ?>
					</p>
				</dd>
			</dl>
			<?php  if ($v['sameUser']) { ?>
			<div id="J_friend_related_<?php echo htmlspecialchars($pUid, ENT_QUOTES, 'UTF-8');?>" class="related J_friend_related" style="<?php echo htmlspecialchars($class2, ENT_QUOTES, 'UTF-8');?>" data-load="<?php echo htmlspecialchars($load, ENT_QUOTES, 'UTF-8');?>">
				
				<div class="menu_arrow"><em></em><span></span></div>
				<?php  
					$tmp = array();
					foreach($v['sameUser'] as $sk => $su){
						if (!trim($su)) continue;
						$tmp[] = sprintf('<a href="%s" class="J_user_card_show" data-uid="%d" target="_blank">%s</a>',WindUrlHelper::createUrl('space/index/run',array('uid'=>$sk)),$sk,$su);
					}
					$tmp = implode('、', $tmp);
				 ?>
				 您关注的人中： <?php echo $tmp;
  if($v['cnt'] > 3) {?>等<?php echo htmlspecialchars($v['cnt'], ENT_QUOTES, 'UTF-8');?>人<?php  } ?> 也关注了Ta
			</div>
			<?php  } ?>
		</div>
	<?php 
		$i++;
		}
	 ?>
		
	</div>
</div>
<?php  }} ?>
<pw-drag id="sidebar_thread" />
 
				<?php  if($hotTagList) { 
?>
<div class="box_wrap">
	<h2 class="box_title">热门话题</h2>
	<div class="tag_hot_list">
		<ul>
			<?php  foreach($hotTagList as $k=>$v){ ?>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag/', rawurlencode($v['tag_name']),'.html'; ?>" class="title"><?php echo htmlspecialchars($v['tag_name'], ENT_QUOTES, 'UTF-8');?></a><em class="num"><?php echo htmlspecialchars($v['content_count'], ENT_QUOTES, 'UTF-8');?></em></li>
			<?php  } if (count($hotTagList) > 9) { ?>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-run'; ?>#tag_more_list" class="title">查看更多</a></li>
			<?php  } ?>
		</ul>
	</div>
</div>
<?php  } 
  if ($loginUser->isExists()) { ?>
<div class="box_wrap">
	<h2 class="box_title">我的话题</h2>
	<div class="side_cate_list">
		<?php  if ($myTags['tags']) { ?>
		<ul id="J_side_my_tags">
			<?php  foreach($myTags['tags'] as $v){ ?>
			<li><a data-id="<?php echo htmlspecialchars($v['tag_id'], ENT_QUOTES, 'UTF-8');?>" title="取消关注该话题" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-attention?type=del&id=', rawurlencode($v['tag_id']); ?>" class="icon_del J_tag_del">删除</a><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag/', rawurlencode($v['tag_name']),'.html'; ?>" class="title"><?php echo htmlspecialchars($v['tag_name'], ENT_QUOTES, 'UTF-8');?><em>(<?php echo htmlspecialchars($v['content_count'], ENT_QUOTES, 'UTF-8');?>)</em></a></li>
			<?php  } if ($myTags['step']) { ?>
			<li><a id="J_tag_more" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-attentionlist'; ?>" data-viewurl="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-view'; ?>" data-delurl="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-attention?type=del'; ?>" class="title" data-step="<?php echo htmlspecialchars($myTags['step'], ENT_QUOTES, 'UTF-8');?>">查看更多</a></li>
			<?php  } ?>
		</ul>
		<?php  } else { ?>
		<div style="padding:20px 0;"><div class="not_content_mini"><i></i>你还没关注任何话题</div></div>
		<?php  } ?>
	</div>
</div>
<?php  } ?>
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
var URL_ADD = '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-attention?type=add'; ?>',	//关注
	URL_DEL = '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-attention?type=del'; ?>';	//取消关注
	
Wind.use('jquery', 'global', function(){

<?php  if ($loginUser->isExists()) { ?>
	//关注&取消关注
	var follow_btn = $('#J_follow_btn'),
		follow_count = $('#J_follow_count');	//关注统计
	follow_btn.on('click', function(e){
		e.preventDefault();
		var $this = $(this),
			type = $this.data('type'),
			url = (type === 'add' ? URL_ADD : URL_DEL),
			count = parseInt(follow_count.text()),
			anti_text = (type === 'add' ? '取消关注' : '关注该话题'),			//文案
			anti_type = (type === 'add' ? 'delete' : 'add'),				//标识
			anti_cls = (type === 'add' ? 'core_unfollow' : 'core_follow'),	//class
			anti_count = (type === 'add' ? count+1 : count-1);		//关注统计

		$.post(url, {id : $this.data('id')}, function(data){

			if(data.state === 'success') {
				//写入相对的信息
				$this.text(anti_text);
				$this.data('type', anti_type);
				$this.removeClass().addClass(anti_cls);

				follow_count.text(anti_count);
			}else if(data.state === 'fail') {
				Wind.Util.resultTip({
					error : true,
					msg : data.message
				});
			}
		}, 'json');
	});

	//关注一下
	$('#J_none_follow').on('click', function(e){
		e.preventDefault();
		var $this = $(this);
		$.getJSON($this.attr('href'), function(data){
			if(data.state === 'success') {
				Wind.Util.resultTip({
					msg : '关注成功',
					msg : data.message,
					follow : $this,
					callback : function(){
						window.location.reload();
					}
				});
			}else if(data.state === 'fail') {
				Wind.Util.resultTip({
					error : true,
					msg : data.message,
					follow : $this
				});
			}
		})
	});

	//ie6屏蔽
	if($.browser.msie && $.browser.version < 7) {
		$('#J_tag_feed_lists dl').hover(function(){
			$(this).addClass('current');
		}, function(){
			$(this).removeClass('current');
		});
	}
	

<?php  } ?>

	//阅读全部
	var tag_excerpt_part = $('#J_tag_excerpt_part'),
		tag_excerpt_ta = $('#J_tag_excerpt_ta');
		
	$('#J_show_more').on('click', function(e){
		e.preventDefault();
		var $this = $(this),
			tag_excerpt_all = $('#J_tag_excerpt_all'),
			type = $this.data('type'),
			anti_type = (type === 'open' ? 'close' : 'open'),
			anti_text = (type === 'open' ? '收起↑' : '阅读全部↓');
		
		if(type === 'open') {
			//阅读全部
			
			if(tag_excerpt_all.length) {
				//已经有html
				tag_excerpt_all.show();
				tag_excerpt_part.hide();
			}else{
				tag_excerpt_part.hide().before(tag_excerpt_ta.text());
			}
			
		}else{
			tag_excerpt_all.hide();
			tag_excerpt_part.show();
			$this.data('type', 'open');
		}
		
		//修改文案
		$this.data('type', anti_type).text(anti_text);
		
	});
	
	//屏蔽
	$('a.J_tag_shield').on('click', function(e){
		e.preventDefault();
		var $this = $(this);
		$.post($this.attr('href'), function(data){
			if(data.state === 'success') {
				Wind.Util.resultTip({
					elem : $this,
					follow : true,
					msg : '操作成功',
					callback : function(){
						window.location.reload();
					}
				});
			//	$this.parents('dl').slideUp('slow', function(){
			//		$(this).remove();
			//	});
			}else{
				Wind.Util.resultTip({
					error : true,
					elem : $this,
					follow : true,
					msg : data.message
				});
			}
		}, 'json');
	});
	
	Wind.use(GV.JS_ROOT +'pages/tag/tag_index.js?v=' + GV.JS_VERSION);
	
});
</script>

</body>
</html>