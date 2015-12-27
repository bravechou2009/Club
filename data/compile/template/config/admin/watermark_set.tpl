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
<body>
<div class="wrap">

<!-- start -->
	<div class="nav">
		<ul class="cc">
		<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=config&c=watermark'; ?>">水印设置</a></li>
		<li  class="current"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=config&c=watermark&a=set'; ?>">水印策略</a></li>
		</ul>
	</div>
	
	<form method="post" class="J_ajaxForm" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=config&c=watermark&a=doset'; ?>" data-role="list">
	<div class="h_a">水印策略</div>
	<div class="table_full mb10">
		<table class="J_check_wrap" width="100%">
			<colgroup>
			<col class="th">
			<col width="400">
			<col>
			</colgroup>
			<?php  foreach ($watermarkExt as $name => $title) {?>
			<tr>
				<th><?php echo htmlspecialchars($title, ENT_QUOTES, 'UTF-8');?></th>
				<td>
					<ul class="switch_list cc">
						<li><label><input type="radio" name="ext[<?php echo htmlspecialchars($name, ENT_QUOTES, 'UTF-8');?>]" value="1" <?php echo htmlspecialchars(Pw::ifcheck(Pw::inArray($name,$config['mark.markset'])), ENT_QUOTES, 'UTF-8');?>><span>开启</span></label></li>
						<li><label><input type="radio" name="ext[<?php echo htmlspecialchars($name, ENT_QUOTES, 'UTF-8');?>]" value="0" <?php echo htmlspecialchars(Pw::ifcheck(!Pw::inArray($name,$config['mark.markset'])), ENT_QUOTES, 'UTF-8');?>><span>关闭</span></label></li>
					</ul>
				</td>
				<td>&nbsp;</td>
			</tr>
			<?php }?>
		</table>
	</div>
	<div class="btn_wrap">
		<div class="btn_wrap_pd">
			<button class="btn btn_submit mr10 J_ajax_submit_btn" type="submit">提交</button>
		</div>
	</div>
	<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
	
<!--=================结束=================-->
</div>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/pages/admin/common/common.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
</body>
</html>