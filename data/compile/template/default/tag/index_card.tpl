<?php  
	if ($tag['isAttention']) {
		$type = 'del';
		$core_unfollow = 'core_unfollow';
		$attentionText = '取消关注';
	} else {
		$type = 'add';
		$core_unfollow = '';
		$attentionText = '关注该话题';
	}
?>
<div class="name"><h3><?php echo htmlspecialchars($tag['tag_name'], ENT_QUOTES, 'UTF-8');?></h3><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-attention?id=', rawurlencode($tag['tag_id']); ?>" data-id="<?php echo htmlspecialchars($tag['tag_id'], ENT_QUOTES, 'UTF-8');?>" data-type="<?php echo htmlspecialchars($type, ENT_QUOTES, 'UTF-8');?>" class="core_follow J_read_tag_follow <?php echo htmlspecialchars($core_unfollow, ENT_QUOTES, 'UTF-8');?>"><?php echo htmlspecialchars($attentionText, ENT_QUOTES, 'UTF-8');?></a></div>
<div class="num">
	<ul class="cc">
		<li>帖子：<em><?php echo htmlspecialchars($tag['content_count'], ENT_QUOTES, 'UTF-8');?></em></li>
		<li>被关注：<em><?php echo htmlspecialchars($tag['attention_count'], ENT_QUOTES, 'UTF-8');?></em></li>
	</ul>
</div>
<?php  if (!$tag['isAttention']) { ?>
<div class="ft">
	关注后，最新的话题内容将显示在<a class="J_qlogin_trigger" data-referer="true" href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','tag-index-my'; ?>">我的话题</a>中
</div>
<?php  } ?>