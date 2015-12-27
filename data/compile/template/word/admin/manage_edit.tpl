<!doctype html>
<html>
<head>
<meta charset="<?php echo htmlspecialchars(Wekit::V('charset'), ENT_QUOTES, 'UTF-8');?>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title><?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','c','name'), ENT_QUOTES, 'UTF-8');?></title>
<link href="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','css'), ENT_QUOTES, 'UTF-8');?>/admin_style.css?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>" rel="stylesheet" />
<script>
//全局变量，是Global Variables不是Gay Video喔
var GV = {
	JS_ROOT : "<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','res'), ENT_QUOTES, 'UTF-8');?>/js/dev/",																									//js目录
	JS_VERSION : "<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>",																										//js版本号
	TOKEN : '<?php echo htmlspecialchars(Wind::getComponent('windToken')->saveToken('csrf_token'), ENT_QUOTES, 'UTF-8');?>',	//token ajax全局
	REGION_CONFIG : {},
	SCHOOL_CONFIG : {},
	URL : {
		LOGIN : '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','loginUrl'), ENT_QUOTES, 'UTF-8');?>',																													//后台登录地址
		IMAGE_RES: '<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','images'), ENT_QUOTES, 'UTF-8');?>',																										//图片目录
		REGION : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','misc-webData-area'; ?>',					//地区
		SCHOOL : '<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','misc-webData-school'; ?>'				//学校
	}
};
</script>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/wind.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/jquery.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>

</head>
<body style="width:390px;" class="body_none">
	<form class="J_ajaxForm" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?_json=1&m=word&c=manage&a=doedit'; ?>" method="post">
	<div class="pop_cont">
		<div class="pop_table" style="height:200px;">
			<table width="100%">
				<tr>
					<th>敏感词</th>
					<td>
					<span class="must_red">*</span><input type="text" name="word[word]" class="input length_5" value="<?php echo htmlspecialchars($detail['word'], ENT_QUOTES, 'UTF-8');?>" />
					<div class="cc gray"></div>
					</td>
				</tr>
				<tr>
					<th>等级</th>
					<td>
						<select class="select_5" name="word[type]" id="J_type">
								<?php  foreach($typeList as $key=>$value){ 
  $selected = ($key == $detail['word_type']) ? 'selected' : '' ?>
								<option value="<?php echo htmlspecialchars($key, ENT_QUOTES, 'UTF-8');?>" <?php echo htmlspecialchars($selected, ENT_QUOTES, 'UTF-8');?>><?php echo htmlspecialchars($value, ENT_QUOTES, 'UTF-8');?></option>
								<?php  } ?>
						</select>
					</td>
				</tr>
				<?php  $display = ($detail['word_type'] == 3) ? '' : 'display:none;';$detail['word_replace'] = $detail['word_replace'] ? $detail['word_replace'] : '****';?>
				<tr id="J_replace" style="<?php echo htmlspecialchars($display, ENT_QUOTES, 'UTF-8');?>">
					<th>替换为</th>
					<td>
						<span class="must_red">*</span><input class="input length_5" type="text" name="word[replace]" value="<?php echo htmlspecialchars($detail['word_replace'], ENT_QUOTES, 'UTF-8');?>" >
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="pop_bottom">
		<button class="btn fr" id="J_dialog_close" type="button">取消</button>
		<button type="submit" class="btn btn_submit J_ajax_submit_btn fr mr10">提交</button>
	</div>
	<input name="id" type="hidden" value="<?php echo htmlspecialchars($detail['word_id'], ENT_QUOTES, 'UTF-8');?>">
	<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/pages/admin/common/common.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
<script>
$(function(){	
	$('#J_type').on('change', function(){
		var $this = $(this),
		value = $this.val();
		if (value == 3) {
			$('#J_replace').show();
			return true;
		}
		$('#J_replace').hide()
	});
});
</script>
</body>
</html>