<?php if (!function_exists("NOTICE_SEGMENT_ATTENTION_MINILIST")) {function NOTICE_SEGMENT_ATTENTION_MINILIST($v){?>
<!--这个是关注消息的页面-->

<!--弹窗列表-->
<?php 
$array = array_slice($v['extend_params'],0,3); 
$countNum = count($v['extend_params']);
$countNum = $countNum > 1 ? '等'.$countNum.'人' : '';
$tmpSeparator='';
?>
	<dl class="notice_segment_list cc">
		<dt class="notice_tip_icon">
			<?php  if (!$v['is_read']) { ?>
			<span class="icon_follow_new J_unread_icon" title="未读">[未读]</span>
			<?php  } else { ?>
			<span class="icon_follow" title="已读">[已读]</span>
			<?php  } ?>
		</dt>
		<dd class="notice_segment_cont">
			<div class="summary">
			<?php foreach ($array as $u) {
 echo htmlspecialchars($tmpSeparator, ENT_QUOTES, 'UTF-8');?><a target="_blank" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($u['uid']),'.html'; ?>"><?php echo htmlspecialchars($u['username'], ENT_QUOTES, 'UTF-8');?></a><?php $tmpSeparator='、';}?>&nbsp;<?php echo htmlspecialchars($countNum, ENT_QUOTES, 'UTF-8');?>关注了您
			</div>
			<div class="time"><?php echo htmlspecialchars(Pw::time2str($v['modified_time'], 'auto'), ENT_QUOTES, 'UTF-8');?></div>
		</dd>
	</dl>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_ATTENTION_DETAIL")) {function NOTICE_SEGMENT_ATTENTION_DETAIL($detailList,$notice,$prevNotice,$nextNotice){?>



<!--弹窗详情-->
	<div class="my_message_top" id="J_hm_top">
	<span class="fr">
		<span>
		<?php  if ($prevNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-detail?id=', rawurlencode($prevNotice['id']); ?>">&lt;&nbsp;前一条</a>
		<?php  } else { ?>
		&lt;&nbsp;前一条
		<?php  } ?>
		</span><i>|</i>
		<?php  if ($nextNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-detail?id=', rawurlencode($nextNotice['id']); ?>">后一条&nbsp;&gt;</a>
		<?php  } else { ?>
		后一条&nbsp;&gt;
		<?php  } ?>
		</span>
	<a class="J_hm_back" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-minilist'; ?>">&lt;&lt;&nbsp;返回</a>
</div>
<?php 
$array = array_slice($notice['extend_params'],0,3); 
$countNum = count($notice['extend_params']);
$countNum = $countNum > 1 ? '等'.$countNum.'人' : '';
$tmpSeparator='';
?>
	<div class="tips" style="border-left:0;border-right:0;border-top:0;"><?php foreach ($array as $u) {
 echo htmlspecialchars($tmpSeparator, ENT_QUOTES, 'UTF-8');?><a target="_blank" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($u['uid']),'.html'; ?>"><?php echo htmlspecialchars($u['username'], ENT_QUOTES, 'UTF-8');?></a><?php $tmpSeparator='、';}?>&nbsp;<?php echo htmlspecialchars($countNum, ENT_QUOTES, 'UTF-8');?>关注了您，<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-fans-run'; ?>" target="_blank">查看全部粉丝&nbsp;&gt;&gt;</a></div>
	<div class="J_hm_list my_message_follow">
	<?php  foreach($detailList['fans'] as $value){ ?>
		<dl class="cc">
			<dt><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($value['uid']),'.html'; ?>"><img src="<?php echo htmlspecialchars(Pw::getAvatar($value['uid'], 'small'), ENT_QUOTES, 'UTF-8');?>" data-type="small" width="50" height="50" onerror="this.onerror=null;this.src='<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>/face/face_small.jpg'" alt="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>" /></a></dt>
			<dd>
				<div class="name"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($value['uid']),'.html'; ?>"><?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?></a></div>
				<?php  if (isset($detailList['follows'][$value['uid']])) { ?>
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-message-pop?uid=', rawurlencode($value['uid']); ?>" class="fr message J_send_msg_pop" data-name="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>"><em></em>写私信</a>
				<span class="core_unfollow">已关注</span>
				<?php  } else { ?>
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-add'; ?>" class="core_follow J_msg_follow" data-uid="<?php echo htmlspecialchars($value['uid'], ENT_QUOTES, 'UTF-8');?>">加关注</a>
				<?php  } ?>
			</dd>
		</dl>
	<?php  } ?>
	</div>
	<div class="my_message_bottom">
		<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-run?type=', rawurlencode($notice['typeid']); ?>">查看全部关注通知&nbsp;&gt;&gt;</a>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_ATTENTION_LIST")) {function NOTICE_SEGMENT_ATTENTION_LIST($v){?>



<!--页列表-->
<?php 
$array = array_slice($v['extend_params'],0,3); 
$countNum = count($v['extend_params']);
$countNum = $countNum > 1 ? '等'.$countNum.'人' : '';
$tmpSeparator='';
?>
	<div class="ct cc J_notice_item">
		<div class="check"><input name="ids[]" class="J_check" type="checkbox" value="<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>"  style="display:none;"></div>
		<div class="content J_notice_content cp">
			<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-detaillist?id=', rawurlencode($v['id']); ?>" class="open_up J_notice_show" data-role="down">展开&darr;</a>
			<div class="title">
				<span class="notice_tip_icon">
				<?php  if (!$v['is_read']) { ?>
				<span class="icon_follow_new" title="未读"></span>
				<?php  } else { ?>
				<span class="icon_follow" title="已读"></span>
				<?php  } ?>
				</span><?php foreach ($array as $u) {
 echo htmlspecialchars($tmpSeparator, ENT_QUOTES, 'UTF-8');?><a target="_blank" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($u['uid']),'.html'; ?>"><?php echo htmlspecialchars($u['username'], ENT_QUOTES, 'UTF-8');?></a><?php $tmpSeparator='、';}?>&nbsp;<?php echo htmlspecialchars($countNum, ENT_QUOTES, 'UTF-8');?>关注了您
			</div>
			<div class="title J_notice_all" style="display:none;"></div>
			<div class="info">
				<span class="time"><?php echo htmlspecialchars(Pw::time2str($v['modified_time'], 'auto'), ENT_QUOTES, 'UTF-8');?></span>
				<span class="operating"><span class="line">|</span><a class="J_msg_del" href="#" data-uri="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-delete'; ?>" data-pdata="{'id':'<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>'}">删除</a></span>
			</div>
		</div>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_ATTENTION_DETAILLIST")) {function NOTICE_SEGMENT_ATTENTION_DETAILLIST($detailList,$notice){?>



<!--页详情-->
	<div class="J_hm_list notice_follow_list ">
	<?php  foreach($detailList['fans'] as $value){ ?>
		<dl class="cc">
			<dt><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($value['uid']),'.html'; ?>"><img src="<?php echo htmlspecialchars(Pw::getAvatar($value['uid'], 'small'), ENT_QUOTES, 'UTF-8');?>" data-type="small" width="50" height="50" onerror="this.onerror=null;this.src='<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>/face/face_small.jpg'" alt="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>" /></a></dt>
			<dd>
				<div class="name"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($value['uid']),'.html'; ?>"><?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?></a></div>
				<?php  if (isset($detailList['follows'][$value['uid']])) { ?>
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-message-pop?uid=', rawurlencode($value['uid']); ?>" class="fr message J_send_msg_pop" data-name="<?php echo htmlspecialchars($value['username'], ENT_QUOTES, 'UTF-8');?>"><em></em>写私信</a>
				<span class="core_unfollow">已关注</span>
				<?php  } else { ?>
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','my-follow-add'; ?>" class="core_follow J_msg_follow" data-uid="<?php echo htmlspecialchars($value['uid'], ENT_QUOTES, 'UTF-8');?>">加关注</a>
				<?php  } ?>
			</dd>
		</dl>
	<?php  } ?>
	</div>

<?php }}?><?php if (!function_exists("NOTICE_SEGMENT_REMIND_MINILIST")) {function NOTICE_SEGMENT_REMIND_MINILIST($v){?>
<!--at用户消息-->

<!--弹窗列表-->
	<dl class="notice_segment_list cc">
		<dt class="notice_tip_icon">
			<?php  if (!$v['is_read']) { ?>
			<span class="icon_at_new J_unread_icon" title="未读">[未读]</span>
			<?php  } else { ?>
			<span class="icon_at" title="已读">[已读]</span>
			<?php  } ?>
		</dt>
		<dd class="notice_segment_cont">
			<div class="summary">
				<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($v['extend_params']['remindUid']),'.html'; ?>" target="_blank"><?php echo htmlspecialchars($v['extend_params']['remindUsername'], ENT_QUOTES, 'UTF-8');?></a> <?php echo $v['extend_params']['notice'];?>
			</div>
			<div class="time"><?php echo htmlspecialchars(Pw::time2str($v['modified_time'],'auto'), ENT_QUOTES, 'UTF-8');?></div>
		</dd>
	</dl>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_REMIND_DETAIL")) {function NOTICE_SEGMENT_REMIND_DETAIL($detailList,$notice,$prevNotice,$nextNotice){?>



<!--弹窗详情-->
	<div class="my_message_top" id="J_hm_top">
	<span class="fr">
		<span>
		<?php  if ($prevNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-detail?id=', rawurlencode($prevNotice['id']); ?>">&lt;&nbsp;前一条</a>
		<?php  } else { ?>
		&lt;&nbsp;前一条
		<?php  } ?>
		</span><i>|</i>
		<?php  if ($nextNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-detail?id=', rawurlencode($nextNotice['id']); ?>">后一条&nbsp;&gt;</a>
		<?php  } else { ?>
		后一条&nbsp;&gt;
		<?php  } ?>
		</span>
	<a class="J_hm_back" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-minilist'; ?>">&lt;&lt;&nbsp;返回</a>
</div>
	<?php  
		$loginUser = Wekit::getLoginUser(); 
		$blacklist = Wekit::load('user.PwUserBlack')->getBlacklist($loginUser->uid);
		if (Pw::inArray($notice['extend_params']['remindUid'],$blacklist)) { 
		?>
	<div class="tips" style="border-left:0;border-right:0;border-top:0;">已把<?php echo htmlspecialchars($notice['extend_params']['remindUsername'], ENT_QUOTES, 'UTF-8');?>列入黑名单，您不会再收到Ta的通知。</div>
	<?php  } ?>
	<div class="notice_segment_wrap">
		<dl class="notice_segment_list cc">
			<dt class="notice_tip_icon">
				<span class="icon_at" title="已读">[已读]</span>
			</dt>
			<dd class="notice_segment_cont">
				<div class="summary">
					<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($detailList['extend_params']['remindUid']),'.html'; ?>"  target="_blank"><?php echo htmlspecialchars($detailList['extend_params']['remindUsername'], ENT_QUOTES, 'UTF-8');?></a> <?php echo $detailList['extend_params']['notice'];?>
				</div>
				<div class="time"><?php echo htmlspecialchars(Pw::time2str($notice['modified_time'],'auto'), ENT_QUOTES, 'UTF-8');?></div>
			</dd>
		</dl>
	</div>
	<div class="my_message_bottom">
		<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-run?type=', rawurlencode($notice['typeid']); ?>">查看全部提醒通知&nbsp;&gt;&gt;</a>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_REMIND_LIST")) {function NOTICE_SEGMENT_REMIND_LIST($v){?>



<!--页列表-->
	<div class="ct cc J_notice_item">
		<div class="check"><input name="ids[]" class="J_check" type="checkbox" value="<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>" style="display:none;"></div>
		<div class="content">
			<div class="title">
				<span class="notice_tip_icon">
				<?php  if (!$v['is_read']) { ?>
				<span class="icon_at_new" title="未读"></span>
				<?php  } else { ?>
				<span class="icon_at" title="已读"></span>
				<?php  } ?>
				</span><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','user/', rawurlencode($v['extend_params']['remindUid']),'.html'; ?>" target="_blank"><?php echo htmlspecialchars($v['extend_params']['remindUsername'], ENT_QUOTES, 'UTF-8');?></a> <?php echo $v['extend_params']['notice'];?>
			</div>
			<div class="info">
				<span class="time"><?php echo htmlspecialchars(Pw::time2str($v['modified_time'],'auto'), ENT_QUOTES, 'UTF-8');?></span>
				<span class="operating">
					<span class="line">|</span>
					<a class="J_msg_del" href="#" data-uri="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-delete'; ?>" data-pdata="{'id':'<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>'}">删除</a>
					<!-- span class="line">|</span>
					<a class="J_addblack" data-type="notice" data-user="<?php echo htmlspecialchars($v['extend_params']['remindUsername'], ENT_QUOTES, 'UTF-8');?>" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-message-addBlack?uid=', rawurlencode($v['extend_params']['remindUid']); ?>" data-referer="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','profile-secret-black?_left=secret'; ?>">加入黑名单</a -->
				</span>
			</div>
		</div>
	</div>

<?php }}?><?php if (!function_exists("NOTICE_SEGMENT_MEDAL_MINILIST")) {function NOTICE_SEGMENT_MEDAL_MINILIST($v){?>
<!--勋章消息-->

<!--弹窗列表-->
	<?php  
	$medal = Wekit::load('medal.PwMedalInfo')->getMedalInfo($v['extend_params']['medelId']);
	//$medal['icon'] = Wekit::load('medal.srv.PwMedalService')->getMedalImage($medal['path'], $medal['icon']);
	?>
	<dl class="notice_segment_list cc">
		<dt class="notice_tip_icon">
			<?php  if (!$v['is_read']) { ?>
			<span class="icon_medal_new J_unread_icon" title="未读">[未读]</span>
			<?php  } else { ?>
			<span class="icon_medal" title="已读">[已读]</span>
			<?php  } ?>
		</dt>
		<dd class="notice_segment_cont">
			<div class="summary">
		<?php  if ($v['extend_params']['type'] == 1){ ?>
			恭喜！您已达到领取《<?php echo htmlspecialchars($v['extend_params']['name'], ENT_QUOTES, 'UTF-8');?>》勋章的要求，请到<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>">我的勋章</a>页面领取。
		<?php  }elseif($v['extend_params']['type'] == 2){ ?>
			恭喜！管理员颁发给您《<?php echo htmlspecialchars($v['extend_params']['name'], ENT_QUOTES, 'UTF-8');?>》勋章，请到<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>">我的勋章</a>页面领取。
		<?php  }elseif($v['extend_params']['type'] == 3){ ?>
			恭喜！您申请的《<?php echo htmlspecialchars($v['extend_params']['name'], ENT_QUOTES, 'UTF-8');?>》勋章已通过审核，请到<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>">我的勋章</a>页面领取。
		<?php  }elseif($v['extend_params']['type'] == 4){ ?>
			抱歉，您申请的《<?php echo htmlspecialchars($v['extend_params']['name'], ENT_QUOTES, 'UTF-8');?>》勋章因不符合要求，未通过管理员审核，请谅解。如有问题请联系管理员。
		<?php  }elseif($v['extend_params']['type'] == 5){ ?>
			抱歉，您的《<?php echo htmlspecialchars($v['extend_params']['name'], ENT_QUOTES, 'UTF-8');?>》勋章被收回。
		<?php  }elseif($v['extend_params']['type'] == 7){ ?>
			抱歉，您的《<?php echo htmlspecialchars($v['extend_params']['name'], ENT_QUOTES, 'UTF-8');?>》勋章被收回。
		<?php  } ?>
			</div>
			<div class="time"><?php echo htmlspecialchars(Pw::time2str($v['modified_time'],'auto'), ENT_QUOTES, 'UTF-8');?></div>
		</dd>
	</dl>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_MEDAL_DETAIL")) {function NOTICE_SEGMENT_MEDAL_DETAIL($detailList,$notice,$prevNotice,$nextNotice){?>



<!--弹窗详情-->
	<div class="my_message_top" id="J_hm_top">
	<span class="fr">
		<span>
		<?php  if ($prevNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-detail?id=', rawurlencode($prevNotice['id']); ?>">&lt;&nbsp;前一条</a>
		<?php  } else { ?>
		&lt;&nbsp;前一条
		<?php  } ?>
		</span><i>|</i>
		<?php  if ($nextNotice) { ?>
		<a class="J_hm_page" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-detail?id=', rawurlencode($nextNotice['id']); ?>">后一条&nbsp;&gt;</a>
		<?php  } else { ?>
		后一条&nbsp;&gt;
		<?php  } ?>
		</span>
	<a class="J_hm_back" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-minilist'; ?>">&lt;&lt;&nbsp;返回</a>
</div>
	<div class="notice_segment_wrap">
		<dl class="notice_segment_list cc">
			<dt class="notice_tip_icon">
				<span class="icon_medal" title="已读">[已读]</span>
			</dt>
			<dd class="notice_segment_cont">
				<div class="summary">
	<?php  
		if ($detailList['medalInfo'] ){
	
  if ($detailList['extend_params']['type'] == 1){ ?>
				恭喜！您已达到领取《<?php echo htmlspecialchars($detailList['extend_params']['name'], ENT_QUOTES, 'UTF-8');?>》勋章的要求，请到<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>">我的勋章</a>页面领取。
			<?php  }elseif($detailList['extend_params']['type'] == 2){ ?>
				恭喜！管理员颁发给您《<?php echo htmlspecialchars($detailList['extend_params']['name'], ENT_QUOTES, 'UTF-8');?>》勋章，请到<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>">我的勋章</a>页面领取。
			<?php  }elseif($detailList['extend_params']['type'] == 3){ ?>
				恭喜！您申请的《<?php echo htmlspecialchars($detailList['extend_params']['name'], ENT_QUOTES, 'UTF-8');?>》勋章已通过审核，请到<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>">我的勋章</a>页面领取。
			<?php  }elseif($detailList['extend_params']['type'] == 4){ ?>
				抱歉，您申请的《<?php echo htmlspecialchars($detailList['extend_params']['name'], ENT_QUOTES, 'UTF-8');?>》勋章因不符合要求，未通过管理员审核，请谅解。如有问题请联系管理员。
			<?php  }elseif($detailList['extend_params']['type'] == 5){ ?>
				抱歉，您的《<?php echo htmlspecialchars($detailList['extend_params']['name'], ENT_QUOTES, 'UTF-8');?>》勋章被收回。
			<?php  }elseif($detailList['extend_params']['type'] == 7){ ?>
				抱歉，您的《<?php echo htmlspecialchars($detailList['extend_params']['name'], ENT_QUOTES, 'UTF-8');?>》勋章被收回。收回原因：管理员手动收回
			<?php  } 
  } ?>
				</div>
				<div class="time"><?php  echo Pw::time2str($notice['modified_time'],'auto');?></div>
			</dd>
		</dl>
	</div>
	<div class="my_message_bottom">
		<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-run?type=', rawurlencode($notice['typeid']); ?>">查看全部勋章通知&nbsp;&gt;&gt;</a>
	</div>

<?php }}?>
<?php if (!function_exists("NOTICE_SEGMENT_MEDAL_LIST")) {function NOTICE_SEGMENT_MEDAL_LIST($v){?>



<!--页列表-->
<?php  
	$medal = Wekit::load('medal.PwMedalInfo')->getMedalInfo($v['extend_params']['medelId']);
	//$medal['icon'] = Wekit::load('medal.srv.PwMedalService')->getMedalImage($medal['path'], $medal['icon']);
	//$ignoreString = $v['is_ignore'] ? '取消忽略' : '忽略';
	//$doIgnore = $v['is_ignore'] ? 0 : 1;
	//$type = $v['is_ignore'] ? false : true;
	?>
	<div class="ct cc J_notice_item">
		<div class="check"><input name="ids[]" class="J_check" type="checkbox" value="<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>" style="display:none;"></div>
		<div class="content">
			<div class="title">
				<span class="notice_tip_icon">
				<?php  if (!$v['is_read']) { ?>
				<span class="icon_medal_new" title="未读"></span>
				<?php  } else { ?>
				<span class="icon_medal" title="已读"></span>
				<?php  } ?>
				</span>
				<?php  if ($v['extend_params']['type'] == 1){ ?>
					恭喜！您已达到领取《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>"><?php echo htmlspecialchars($v['extend_params']['name'], ENT_QUOTES, 'UTF-8');?></a>》勋章的要求，请到<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>">我的勋章</a>页面领取。
				<?php  }elseif($v['extend_params']['type'] == 2){ ?>
					恭喜！管理员颁发给您《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>"><?php echo htmlspecialchars($v['extend_params']['name'], ENT_QUOTES, 'UTF-8');?></a>》勋章，请到<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>">我的勋章</a>页面领取。
				<?php  }elseif($v['extend_params']['type'] == 3){ ?>
					恭喜！您申请的《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>"><?php echo htmlspecialchars($v['extend_params']['name'], ENT_QUOTES, 'UTF-8');?></a>》勋章已通过审核，请到<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>">我的勋章</a>页面领取。
				<?php  }elseif($v['extend_params']['type'] == 4){ ?>
					抱歉，您申请的《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>"><?php echo htmlspecialchars($v['extend_params']['name'], ENT_QUOTES, 'UTF-8');?></a>》勋章因不符合要求，未通过管理员审核，请谅解。如有问题请联系管理员。
				<?php  }elseif($v['extend_params']['type'] == 5){ ?>
					抱歉，您的《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>"><?php echo htmlspecialchars($v['extend_params']['name'], ENT_QUOTES, 'UTF-8');?></a>》勋章被收回。
				<?php  }elseif($v['extend_params']['type'] == 7){ ?>
					抱歉，您的《<a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','medal-index-run'; ?>"><?php echo htmlspecialchars($v['extend_params']['name'], ENT_QUOTES, 'UTF-8');?></a>》勋章被收回。
				<?php  } ?>
			</div>
			<div class="info">
				<span class="time"><?php echo htmlspecialchars(Pw::time2str($v['modified_time'],'auto'), ENT_QUOTES, 'UTF-8');?></span>
				<span class="operating"><span class="line">|</span><a class="J_msg_del" href="#" data-uri="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','message-notice-delete'; ?>" data-pdata="{'id':'<?php echo htmlspecialchars($v['id'], ENT_QUOTES, 'UTF-8');?>'}">删除</a></span>
			</div>
		</div>
	</div>

<?php }}?>