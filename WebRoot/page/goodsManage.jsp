<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="../kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="../kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript">
var editor1;
KindEditor.ready(function(K) {
				editor1 = K.create('textarea[name="description"]', {
				cssPath : '../kindeditor/plugins/code/prettify.css',
				uploadJson : '../kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '../kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				allowImageUpload : true,
				items : [
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link'],
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				},
				afterChange: function () {
         			this.sync();
        		},
        		afterBlur: function () {
        			this.sync(); 
        		}
			});
			prettyPrint();
		});
</script>
<script type="text/javascript">
var url;
var decimalReg=/^\d{0,8}\.{0,1}(\d{1,2})?$/;
function searchGoods(){
	$("#dg").datagrid('load', {
		"id" : $("#s_newsId").val(),
		"name":$("#s_name").val(),
		"brand":$("#s_brand").val(),
		"type":$("#s_type").val(),
		"description":$("#s_description").val(),
		"price1":$("#s_price1").val(),
		"price2":$("#s_price2").val(),
		"sort":$("#s_sort").combobox("getValue")
	});
}

function openGoodsAddDialog(){
	$("#dlg").dialog("open").dialog("setTitle","添加商品信息");
	$("#picToBe").html("");
	$("#picToBe").attr("href","");
	url="${pageContext.request.contextPath}/GoodsAdd";
}
function openGoodsModifyDialog(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条要编辑的数据！");
			 return;
		 }
		 var row=selectedRows[0];
		 $("#dlg").dialog("open").dialog("setTitle","编辑商品信息");
		 editor1.html(row.description);
		 changeVal(row.pic);
		 $("#picToBe").html("点击查看已存在图片");
		 $("#picToBe").attr("href","/pinkish_red/"+row.pic);
		 
		 $("#fm").form("load",row);
		 url="${pageContext.request.contextPath}/GoodsAdd?goodsId="+row.goodsId;
	 }
	 
	 function saveGoods(){
		 $("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if($("#price").val()==""){
					$.messager.alert("系统提示","请填写价格！");
					return false;
				}
				if(!decimalReg.test($("#price").val())){
					$.messager.alert("系统提示","价格格式错误！");
					return false;
				}
				var str=editor1.html();
				if(str==null||str.length==0){
					$.messager.alert("系统提示","请填入商品描述！");
					return false;
				}
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功！");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","保存失败！");
					return;
				}
			}
		 });
	 }
	 
	 function resetValue(){
	 	editor1.html("");
		 $("#name").val("");
		 $("#brand").val("");
		 $("#type").val("");
		 $("#price").val("");
		 $("#pic").val("");
		 $("#doc").val("");
		 editor1.html("");
		 $("#preview").css("display","none");
		  
		 
	 }
	 
	 function closeGoodsDialog(){
		 $("#dlg").dialog("close");
		 resetValue();
	 }

	 function deleteGoods(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length==0){
			 $.messager.alert("系统提示","请选择要删除的数据！");
			 return;
		 }
		 var strIds=[];
		 for(var i=0;i<selectedRows.length;i++){
			 strIds.push(selectedRows[i].goodsId);
		 }
		 var ids=strIds.join(",");
		 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/GoodsDelete",{ids:ids},function(result){
					if(result.success){
						 $.messager.alert("系统提示","已成功删除<font color=red>"+result.delNums+"</font>条数据!");
						 $("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败，请联系系统管理员！");
					}
				},"json");
			} 
		 });
	 }
</script>
<script> 
function setImagePreview() { 
	var docObj=document.getElementById("doc"); 
	var imgObjPreview=document.getElementById("preview"); 
	if(docObj.files && docObj.files[0]){ 
		//火狐下，直接设img属性 
		imgObjPreview.style.display = 'block'; 
		imgObjPreview.style.width = '180px'; 
		imgObjPreview.style.height = '160px'; 
		//imgObjPreview.src = docObj.files[0].getAsDataURL(); 
		//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
		imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]); 
	}else{ 
		//IE下，使用滤镜 
		docObj.select(); 
		var imgSrc = document.selection.createRange().text; 
		var localImagId = document.getElementById("localImag"); 
		//必须设置初始大小 
		localImagId.style.width = "180px"; 
		localImagId.style.height = "160px"; 
		//图片异常的捕捉，防止用户修改后缀来伪造图片 
		try{ 
			localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)"; 
			localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc; 
		}catch(e){ 
		    alert("您上传的图片格式不正确，请重新选择!"); 
		    return false; 
		} 
		imgObjPreview.style.display = 'none'; 
		document.selection.empty(); 
	} 
	return true; 
} 
</script>
<script type="text/javascript">
function changeVal(stext){
	$("#pic").val(stext);
}
</script>

  </head>
  
  <body>
    <table id="dg" title="新闻管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" pageSize:"20"  rownumbers="true"
		url="${pageContext.request.contextPath}/GoodsList" fit="true"
		toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="goodsId" width="10" align="center">商品ID</th>
				<th field="name" width="10" align="center">名称</th>
				<th field="brand" width="20" align="center">品牌</th>
				<th field="type" width="20" align="center">型号</th>
				<th field="description" width="30" align="center">描述</th>
				<th field="price" width="10" align="center">价格</th>
				<th field="pic" width="30" align="center">图片</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
 	<div>
 		<a href="javascript:openGoodsAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openGoodsModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteGoods()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	<div>
 		
 		&nbsp;商品ID：<input type="text" id="s_goodsId" size="5"  onkeydown="if(event.keyCode==13) searchGoods()"/>
 		&nbsp;名称：<input type="text" id="s_name" size="8" onkeydown="if(event.keyCode==13) searchGoods()"/>
 		&nbsp;品牌：<input type="text" id="s_brand" size="8" onkeydown="if(event.keyCode==13) searchGoods()"/>
 		&nbsp;型号：<input type="text" id="s_type" size="10" onkeydown="if(event.keyCode==13) searchGoods()"/>
 		&nbsp;描述：<input type="text" id="s_description" size="10" onkeydown="if(event.keyCode==13) searchGoods()"/>
 		&nbsp;价格范围：<input type="text" id="s_price1" size="5" onkeydown="if(event.keyCode==13) searchGoods()"/>
~~<input type="text" id="s_price2" size="5" onkeydown="if(event.keyCode==13) searchGoods()"/>
 		&nbsp;排序：<select class="easyui-combobox" id="s_sort" name="s_sort"  editable="false" panelHeight="auto">
   					<option value="">排序方式</option>
   					<option value="asc">按价格升序</option>
   					<option value="desc">按价格降序</option>
   				</select>
 		<a href="javascript:searchGoods()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 </div>


 <div id="dlg" class="easyui-dialog" style="width:700px;height:380px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" name="fm" method="post" enctype="multipart/form-data">
   	<table cellspacing="8px">
   		<tr>
   			<td>名称：</td>
   			<td><input type="text" id="name" name="name" class="easyui-validatebox" autocomplete="off" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>品牌：</td>
   			<td>
   			<input type="text" id="brand" name="brand" class="easyui-validatebox" autocomplete="off" required="true"/>
   			&nbsp;<font color="red">*</font>
   			</td>
   		</tr>
   		<tr>
   			<td>型号：</td>
   			<td><input type="text" id="type" name="type" class="easyui-validatebox" autocomplete="off" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>价格：</td>
   			<td>
   			<input type="text" id="price" name="price" class="easyui-validatebox" autocomplete="off" required="true"/>
   			&nbsp;<font color="red">*</font>
   			</td>
   		</tr>
   		<tr>
   			<td>图片URL：</td>
   			<td colspan="3">
   				<a  id="picToBe" href="" target="_blank"></a>
	   			<input type="hidden" id="pic" name="pic"  autocomplete="off" />
   			</td>
   		</tr>
   		<tr>
   			<td>图片文件：</td>
   			<td colspan="3">
   				<input type=file  name="doc" id="doc" onchange="javascript:setImagePreview();"> 
   			</td>
   		</tr>
   		
   		<tr>
   			<td>图片预览：</td>
			<td colspan="3">
			   <div id="localImag" style="text-align:center"> 
					<img id="preview" width=-1 height=-1 style="diplay:none" />
				</div>
			</td>
   		</tr>
   		<tr>
   		<td>描述：</td>
   			<td colspan="4">
   				&nbsp;<font color="red">*</font>
   				<br>
   				<textarea id="description" name="description" cols="100" rows="6" style="width:100%;height:150px;visibility:hidden;"></textarea>
   			</td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:saveGoods()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeGoodsDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>



  </body>
</html>
