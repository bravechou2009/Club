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
	<div class="nav">
		<ul class="cc">
			<li class="current"><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum'; ?>">版块管理</a></li>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=unite'; ?>">版块合并</a></li>
			<!-- <li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=baseinfo'; ?>">基本信息</a></li>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=extinfo'; ?>">功能设置</a></li>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=classif'; ?>">主题分类</a></li>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=permissions'; ?>">权限相关</a></li>
			<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=credits'; ?>">积分相关</a></li> -->
		</ul>
	</div>
	<div class="h_a">搜索</div>
	<div class="table_full">
		<form id="J_forum_search_form" method="post" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=searchforum'; ?>">
			<table width="100%">
				<tr>
					<td>
						<div class="fl">
							<div id="J_search_suggestion" class="forum_search_pop" style="display:none;margin-top:25px;"></div>
						</div>
						<input id="J_search_input" class="input length_3 mr10" name="keyword" autoComplete="off" type="text"><button id="J_forum_search" class="btn btn_submit" type="submit">搜索</button></td>
				</tr>
			</table>
		<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
	</div>
	<form class="J_ajaxForm" data-role="list" action="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=dorun'; ?>" method="post">
	<div class="mb10">
		<a href="#" id="J_start_all" class="mr5">全部展开</a><span class="mr5 gray">|</span><a id="J_away_all" href="">全部收起</a>
	</div>
	<div class="table_list">
		<table width="100%" id="J_table_list" style="table-layout:fixed;">
			<colgroup>
				<col width="30">
				<col width="400">
				<col width="60">
				<col width="210">
				<col>
			</colgroup>
			<thead>
				<tr>
					<td></td>
					<td><span class="mr5">[顺序]</span>版块名称（双击版块名称可编辑版块标题）</td>
					<td class="tar">fid</td>
					<td>版主</td>
					<td>操作</td>
				</tr>
			</thead>
			<?php 
				$lang = array(
					'forum' => '',
					'sub' => '<span class="plus_icon plus_none_icon"></span>',
					'sub2' => '<span class="plus_icon plus_none_icon"></span><span class="plus_icon plus_none_icon"></span>'
				);
			
  foreach($catedb as $key => $cate) { 
  $cateClass = $forumList[$cate['fid']] ? ' away_icon' : ' zero_icon';?>
			<tbody>
			<tr id="J_forum_tr_<?php echo htmlspecialchars($cate['fid'], ENT_QUOTES, 'UTF-8');?>">
				<td><span data-id="<?php echo htmlspecialchars($cate['fid'], ENT_QUOTES, 'UTF-8');?>" class="J_start_icon<?php echo htmlspecialchars($cateClass, ENT_QUOTES, 'UTF-8');?>" title="双击进行修改"></span></td>
				<td><input type="text" class="input mr5" name="vieworder[<?php echo htmlspecialchars($cate['fid'], ENT_QUOTES, 'UTF-8');?>]" value="<?php echo htmlspecialchars($cate['vieworder'], ENT_QUOTES, 'UTF-8');?>" style="width:20px;"><span class="mr10 J_forum_names" data-id="<?php echo htmlspecialchars($cate['fid'], ENT_QUOTES, 'UTF-8');?>"><?php echo $cate['name'];?></span><a style="display:none" data-id="<?php echo htmlspecialchars($cate['fid'], ENT_QUOTES, 'UTF-8');?>" data-type="forum_child" data-forumlevel="2" data-html="tbody" href="#" class="link_add J_addChild">添加新版块</a></td>
				<td class="tar"><?php echo htmlspecialchars($cate['fid'], ENT_QUOTES, 'UTF-8');?></td>
				<td><input type="text" class="input length_3" name="manager[<?php echo htmlspecialchars($cate['fid'], ENT_QUOTES, 'UTF-8');?>]" value="<?php echo htmlspecialchars(trim($cate['manager'], ','), ENT_QUOTES, 'UTF-8');?>"></td>
				<td><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','thread/', rawurlencode($cate['fid']),'.html'; ?>" target="_blank" class="mr5">[访问]</a><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?fid=', rawurlencode($cate['fid']),'&m=bbs&c=setforum&a=edit'; ?>" class="mr5">[编辑]</a><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=deleteforum'; ?>" class="mr5 J_ajax_del" data-pdata="{'fid': '<?php echo htmlspecialchars($cate['fid'], ENT_QUOTES, 'UTF-8');?>'}">[删除]</a></td>
			</tr>
			</tbody>
				<?php  if ($forumList[$cate['fid']]) { ?>
			<tbody id="J_table_list_<?php echo htmlspecialchars($cate['fid'], ENT_QUOTES, 'UTF-8');?>">
					<?php  foreach ($forumList[$cate['fid']] as $key => $forum) { ?>
			<tr id="J_forum_tr_<?php echo htmlspecialchars($forum['fid'], ENT_QUOTES, 'UTF-8');?>">
				<td></td>
				<td><?php echo $lang[$forum['type']];?><span class="plus_icon<?php  if ($forum['isEnd']) echo ' plus_end_icon'; ?>"></span><input type="text" class="input mr5" name="vieworder[<?php echo htmlspecialchars($forum['fid'], ENT_QUOTES, 'UTF-8');?>]" value="<?php echo htmlspecialchars($forum['vieworder'], ENT_QUOTES, 'UTF-8');?>" style="width:20px;"><span class="mr10 J_forum_names" data-id="<?php echo htmlspecialchars($forum['fid'], ENT_QUOTES, 'UTF-8');?>"><?php echo $forum['name'];?></span><?php  if ($forum['type'] == 'forum') { ?><a style="display:none" data-id="<?php echo htmlspecialchars($forum['fid'], ENT_QUOTES, 'UTF-8');?>" data-type="forum_child" data-forumlevel="3" data-html="tr" href="#" class="link_add J_addChild">添加二级版块</a><?php  } elseif ($forum['type'] == 'sub') { ?><a style="display:none" data-id="<?php echo htmlspecialchars($forum['fid'], ENT_QUOTES, 'UTF-8');?>" data-type="forum_child" data-forumlevel="4" data-html="tr" href="#" class="link_add J_addChild">添加三级版块</a><?php  } ?></td>
				<td class="tar"><?php echo htmlspecialchars($forum['fid'], ENT_QUOTES, 'UTF-8');?></td>
				<td><input type="text" class="input length_3" name="manager[<?php echo htmlspecialchars($forum['fid'], ENT_QUOTES, 'UTF-8');?>]" value="<?php echo htmlspecialchars(trim($forum['manager'], ','), ENT_QUOTES, 'UTF-8');?>"></td>
				<td><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','thread/', rawurlencode($forum['fid']),'.html'; ?>" target="_blank" class="mr5">[访问]</a><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?fid=', rawurlencode($forum['fid']),'&m=bbs&c=setforum&a=edit'; ?>" class="mr5">[编辑]</a><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=deleteforum'; ?>" class="mr5 J_ajax_del" data-pdata="{'fid': '<?php echo htmlspecialchars($forum['fid'], ENT_QUOTES, 'UTF-8');?>'}">[删除]</a></td>
			</tr>
					<?php  } ?>
			</tbody>
				<?php  } 
  } ?>
		</table>
		<table width="100%">
			<tr><td colspan="5" style="padding-left:38px;"><a id="J_add_root" data-type="forum_root" data-html="tbody" href="" class="link_add">添加新分类</a></td></tr>
		</table>
	</div>
	<div class="btn_wrap">
		<div class="btn_wrap_pd">
			<button type="submit" class="btn btn_submit J_ajax_submit_btn">提交</button>
		</div>
	</div>
	<input type="hidden" name="csrf_token" value="<?php echo WindSecurity::escapeHTML(Wind::getComponent('windToken')->saveToken('csrf_token')); ?>"/></form>
	
</div>
<script src="<?php echo htmlspecialchars(Wind::getComponent('response')->getData('G','url','js'), ENT_QUOTES, 'UTF-8');?>/pages/admin/common/common.js?v<?php echo htmlspecialchars(NEXT_RELEASE, ENT_QUOTES, 'UTF-8');?>"></script>
<script>
/*
root_tr_html 为“添加新分类”html；
child_tr_html 为“添加四级版块”html；
删除未保存子版块时不调用forumTree_table.js的公共方法，因为设置子版的关联删除，所以单独写在本页面，"J_new_forum_del"类调用。
*/
var root_tr_html = '<tr>\
						<td><span class="zero_icon mr10"></span></td>\
						<td>\
							<input type="text" style="width:20px;" value="" name="new_vieworder[0][]" class="input mr5">\
							<input name="new_forumname[0][]" type="text" class="input mr5" value="">\
							<input type="hidden" value="NEW_ID_" name="tempid[0][]">\
							<a style="display:none" data-nameid="NEW_ID_" class="link_add J_addChild" href="#" data-html="tbody" data-type="forum_child" data-id="temp_root_" data-forumlevel="2">添加新版块</a>\
						</td>\
						<td class="tar"></td>\
						<td><input type="text" name="new_manager[0][]" class="input length_3"></td>\
						<td><a class="mr5 J_newRow_del" href="#">[删除]</a></td>\
					</tr>';
					
//返回二~四级版块添加的html
function forumChild(forum_level, a_id, name_id){
	var forum_text, plus_none_icon_arr = [], temp_name = 'new_', temp_id ='id_';
	
	if (forum_level === 2) {
		forum_text = '添加二级版块';
	} else if (forum_level === 3) {
		forum_text = '添加三级版块';
	} else {
		forum_text = '';
	} 
	
	//不同级别html差异
	for (var i=2; i < forum_level; i++){
		plus_none_icon_arr.push('<span class="plus_icon plus_none_icon"></span>');
	};
	
	//name_id值为添加按钮的data-nameid属性，表示父版未保存
	if(name_id) {
		temp_name = 'temp_'; 
		temp_id = name_id;	//未保存父版的隐藏input的value值
	}
	
	return '<tr data-del_level="'+ forum_level +'"><td></td>\
				<td>'+ plus_none_icon_arr.join('') +'\
					<span class="plus_icon plus_end_icon"></span>\
					<input type="text" style="width:20px;" value="" name="'+ temp_name +'vieworder['+ temp_id +'][]" class="input mr5">\
					<input name="'+ temp_name +'forumname['+ temp_id +'][]" type="text" class="input mr5" value="">\
					<input type="hidden" value="NEW_ID_" name="tempid['+ temp_id +'][]">\
					<a style="display:none" data-nameid="'+ a_id +'" class="link_add J_addChild" href="#" data-id="id_" data-html="tr" data-type="forum_child" data-forumlevel="'+ (forum_level+1) +'">'+ forum_text +'</a>\
				</td>\
				<td class="tar"></td>\
				<td><input type="text" name="'+ temp_name +'manager['+ temp_id +'][]" class="input length_3"></td>\
				<td><a href="" class="mr5 J_new_forum_del">[删除]</a></td>\
			</tr>';
}

Wind.js(GV.JS_ROOT+ 'pages/admin/common/forumTree_table.js?v=' +GV.JS_VERSION);

$(function(){

	//版块_新添加的行可直接删除
	$('#J_table_list').on('click', 'a.J_new_forum_del', function (e) {
		e.preventDefault();
		var $this = $(this), tr = $this.parents('tr');
		
		//跟当前行比较"del-level"的值，含子版不删除
		if(tr.data('del_level') < tr.next().data('del_level')) {
			Wind.use('dialog', function(){
				Wind.dialog.alert('该版块含有子版块，请先删除所有子版块，再进行此操作！', function(){
					$this.focus();
				});
			});
		}else{
			tr.remove();
		}
		
	});
	

	//双击编辑版块名称
	var org_val;
	$('#J_table_list').on('dblclick', '.J_forum_names', function() {
		var $this = $(this), $input = $('<input type="text" value="'+ $this.text() +'" data-id="'+  $this.data('id') +'" class="input mr5 J_forum_names_input" name="name">');
		org_val = $this.text(); //原始版块名
		$input.insertAfter($this).focus();
		$this.remove();
	});
	
	//版块名称input失焦ajax提交
	$('#J_table_list').on('blur', '.J_forum_names_input', function() {
		var $this = $(this),
			restore = function() { //版块取消编辑状态
				$this.hide().after('<span class="mr10 J_forum_names" data-id="'+ $this.data('id') +'">'+ $this.val() +'</span>');
				$this.remove();
			};
			
		//判断版块名是否修改过
		if($this.val() !== org_val) {
			$.post("<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=editname'; ?>", {fid: $this.data('id'), name: $this.val() }, function(data){
				if(data.state === 'success') {
					restore();
				}
			});
		}else{
			restore();
		}
		
	});

	
	
/*
	搜索建议：输入>=2个字符开始提交查询，支持上下键选择；点击下拉的匹配项进入版块编辑，点击搜索按钮则高亮匹配的tr行
*/
	
	var search_input = $('#J_search_input'),			//搜索栏
		suggestion_list = $('#J_search_suggestion'),	//搜索匹配列表
		input_val;										//搜索值，用于比较是否有更改
	
	//搜索框聚焦
	search_input.focus(function(){
		var $this = $(this);
		
		//搜索框粘帖
		this.onpaste = function(){
		
			//清楚重复的延时操作
			if(search_input.ptimer) {
				clearTimeout(search_input.ptimer);
			}
			
			//粘帖半秒后提交查询
			search_input.ptimer = setTimeout(function(){
				search_suggestion($('#J_search_input').val());
			}, 500)

		}
		
		//通过浏览器（ff8.0）“后退”到本页面时，可能搜索内容为空，但是有隐藏的匹配项
		if(!$this.val()) {
			return false;
		}
		
		//已经匹配搜索，搜索框重新聚焦时显示匹配，避免重复ajax
		if(suggestion_list.children().length) {
			suggestion_list.fadeIn('fast');
		}
		
	});
	
	
	
	//搜索输入
	search_input.keyup(function(e){
		var $this = $(this);
		
		//键盘上下选择搜索建议
		if(suggestion_list.children().length & (e.keyCode === 38 || e.keyCode === 40)) {
		
			var li_current = suggestion_list.find('li.current'); //当前选中项，上下键未修改状态
			/*var f_or_l = (e.keyCode === 40 ? 'first' : 'last'),
				p_or_n = (e.keyCode === 40 ? $.next : 'prev');*/
			//
			if(e.keyCode === 38) {
				//键盘_向上
				
				if(!li_current.length) {
					//没有有选中项时
					suggestion_list.find('li:last').addClass('current');
				}else{
					//有选中项时
					li_current.removeClass('current').prev().addClass('current');
				}
				
				
				
			}else if(e.keyCode === 40) {
				//键盘_向下
				
				if(!li_current.length) {
					//没有有选中项时
					suggestion_list.find('li:first').addClass('current');
				}else{
					//有选中项时
					li_current.removeClass('current').next().addClass('current');
				}
				
			}
			
			if(suggestion_list.find('li.current').length) {
					search_input.val(suggestion_list.find('li.current').text());
			}else{
				search_input.val(input_val);
			}
				
			return false;
			
			
		}
		
		
		if($this.val() === input_val) {
			return false; //搜索值未改变则不做查询
		}
		
		//停止输入半秒后开始查询
		if(search_input.timer) {
			clearTimeout(search_input.timer);
		}
		search_input.timer = setTimeout(function(){
			search_suggestion($this.val());
		}, 500);
		
	});
	
	
	//点击搜索建议列表，进入版块编辑
	search_input.keypress(function(e) {
	
		//可点击条件：有匹配搜索列表&列表里有被选中的项&按回车(enter)键
		if(suggestion_list.children() && suggestion_list.find('li.current').length && e.keyCode === 13) {
			e.preventDefault();
			search_input.blur(); //ff(8.0)从编辑页返回时，搜索栏会聚焦
			window.location.href = suggestion_list.find('li.current > a').attr('href'); //进入版块编辑
		}
		
	});
	
	//搜索框失焦，隐藏匹配列表
	search_input.blur(function() {
		suggestion_list.fadeOut('fast');
	});
	
	//搜索查询显示函数
	function search_suggestion(search_data) {
		input_val = search_data; //把搜索值赋给input_val，用于比较搜索值
		var search_text = $.trim(search_data.replace(/[^\x00-\xff]/g, "**")); //搜索内容首尾去空格，且每1个汉字转由两个*符号替代
		
		if(search_text.length >= 2) {
			//搜索内容大于2个字符，提交查询
			
			$.post('<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=searchforum'; ?>', {'keyword':search_data}, function(data) {
			
				if(data.state === 'success') {
					var push_html = [];
					$.each(data.data, function(i, o){
						push_html.push('<li><a href="<?php echo Wind::getComponent('response')->getData('G', 'url', 'base'),'/','admin.php?m=bbs&c=setforum&a=edit'; ?>&fid='+ o.fid +'">'+ o.name +'</a></li>');
					});console.log(push_html);
					suggestion_list.html($('<ul/>').append(push_html.join(''))).fadeIn('fast');
				}else{
					suggestion_list.fadeOut('fast', function(){
						$(this).empty();
					});
				}
				
			}, 'json');
			
		}else{
			//搜索内容大于2个字符，隐藏并清空下拉匹配
			suggestion_list.fadeOut('fast', function(){
				$(this).empty();
			});
		}
	}
	
	
	//点击“搜索”按钮，高亮匹配的tr行
	Wind.use('ajaxForm',function() {
	
		$('#J_forum_search_form').ajaxForm({
			dataType	: 'json',
			success : function(data) {
				if(data.state === 'success') {
					//取消已有的高亮
					$('#J_table_list tr.high_light').removeClass('high_light');
					
					//循环匹配的高亮
					$.each(data.data, function(i, o) {
						$('#J_forum_tr_' + o.fid).addClass('high_light');
					});

					//定位第一个
					$(document).scrollTop($('tr.high_light:first').offset().top);
					
				}
			}
		});
		
	});
	
	
	//搜索匹配列表hover状态背景色
	suggestion_list.on('mouseenter', 'li', function(){
		$(this).addClass('current');
	}).on('mouseleave', 'li', function(){
		$(this).removeClass('current');
	});
	
	
});
</script>
</body>
</html>