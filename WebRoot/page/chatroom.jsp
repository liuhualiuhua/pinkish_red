<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*"
	pageEncoding="UTF-8"%>
<%
	Users users = (Users) session.getAttribute("user");
	if (users == null) {
		response.sendRedirect("/pinkish_red/index.jsp");
		return;
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>聊天室</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="/pinkish_red/style/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/pinkish_red/js/jquery-1.9.1.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/pinkish_red/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="../kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="../kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript">
var editor1;
KindEditor.ready(function(K) {
				editor1 = K.create('textarea[name="content"]', {
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
				}
			});
			prettyPrint();
		});
</script>
<script type="text/javascript">
var flag=0;
function getMessage(){
	var userIds=$("#idToBe").val();
	$.get(
		"/pinkish_red/MessageList4UI",
		{'page':1,'rows':15},
		function(date){
			var date=$.parseJSON(date);
			if(date){
				date.rows.forEach(
					function(item){
						flag=item.messageId;
						var str;
						if(item.userId==userIds){
							str="<p class='bg-success text-danger text-right'>";
						}else{
							str="<p >";
						}
						str=str+item.userName+"("+item.postTime.substring(11,20)+"):<br>"+item.content+"</p>";
						$("#boardPanel").append(str);
						if($("#boardPanel").scrollTop()>400){
							$('p:first').remove();
						}
					}
				);
				$("#boardPanel").scrollTop("1500");
			}
		}
	);
}

function getUnReadMsg(){
	var userIds=$("#idToBe").val();
	$.get(
		"/pinkish_red/MessageUnReadList",
		{"flag":flag},
		function(date){
			var date=$.parseJSON(date);
			if(date){
				$.each(date.users,function(i,n){
					if($("#"+i+"").length<=0){
						var str="<li id='"+i+"' class='list-group-item'>"+n+"</li>";
						$("#list-group").append(str);
					}
				});
				if(date.messages.length>0){
				date.messages.forEach(
					function(item){
						flag=item.messageId;
						var str;
						if(item.userId==userIds){
							str="<p class='bg-success text-danger text-right'>";
						}else{
							str="<p >";
						}
						str=str+item.userName+"("+item.postTime.substring(11,20)+"):<br>"+item.content+"</p>";
						$("#boardPanel").append(str);
						if($("#boardPanel").scrollTop()>400){
							$('p:first').remove();
						}
					}
				);	
				$("#boardPanel").scrollTop("1500");
				}
			}
		}
	);
}


var pages=1;
function getOldMessage(){
	var userIds=$("#idToBe").val();
	$.get(
		"/pinkish_red/MessageList4UI",
		{'page':pages,'rows':15},
		function(date){
			var date=$.parseJSON(date);
			if(date&&date.rows.length>0){
				$("#oldContent").empty();
				date.rows.forEach(
					function(item){
						var str;
						if(item.userId==userIds){
							str="<p class='bg-success text-danger text-right'>";
						}else{
							str="<p >";
						}
						str=str+item.userName+"("+item.postTime.substring(11,20)+"):<br>"+item.content+"</p>";
						$("#oldContent").append(str);
					}
				);
				$("#oldContent").scrollTop("1500");
			}else{
				alert("没有更多内容");
				pages=pages-1;
			}	
		}
	);
}

function getOld(){
	$("#oldContent").empty();
	pages=1;
	getOldMessage();
	$("#oldContent").scrollTop("2500");
}

function older(){
	
	pages=pages+1;
	getOldMessage();
	$("#oldContent").scrollTop("2500");
}

function newer(){
	if(pages>=2){
		$("#oldContent").empty();
		pages=pages-1;
		getOldMessage();
	}else{
		alert("没有更多内容");
		return;
	}
	$("#oldContent").scrollTop("2500");
}

function sendMessage(content){
	$.post(
		"/pinkish_red/MessageAdd",
		{"content":content},
		function(date){
			var date=$.parseJSON(date);
			if(date.success){
				//alert("成功");
			}else{
				alert("失败");
			}
		}
	);
}

function change(){
	var str=editor1.html();
	sendMessage(str);
	$("#boardPanel").append("<p>"+$("#nameToBe").val()+": <br>"+str+"</p>");
	$("#boardPanel").scrollTop("1000");
	if($("#boardPanel").scrollTop()>=500){
		$("p:first").remove();
	}
	editor1.html("");
	
}

function cleanButton(){
	$("#boardPanel").html("");
}
function sleep(d){
  for(var t = Date.now();Date.now() - t <= d;);
}

function logoutLogout(){
	$.get(
	"/pinkish_red/MessageUnReadList",
	{"remove":$("#idToBe").val()}
	);
}
$(document).ready(function(){
	getMessage();
	//sleep(1000);
	//getUnReadMsg();
	var timers=setInterval(getUnReadMsg,5000);
});
</script>
<script type="text/javascript">
window.onbeforeunload = function() {  
	clearInterval(timers);
    logoutLogout();
};
</script>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9">
				<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">聊天室</h3>
				  </div>
				  <div class="panel-body" style="height:360px;overflow-y:scroll" id="boardPanel">
				    
				  </div>
				  <div class="panel-footer">
				   	<textarea id="content" name="content" cols="100" rows="6" style="width:100%;height:150px;visibility:hidden;">
				   	
				   	</textarea>
				   	<nav>
					  <ul class="pager">
					    <li class="previous" id="sendButton"><a href="javascript:change()">发送</a></li>
					    <li class="previous" id="cleanButton"><a href="javascript:cleanButton()">清空</a></li>
					    <li class="next" onclick="getOld()"><a href="javascritp:getOld()" data-toggle="modal" data-target="#myModal">查看聊天记录 </a></li>
					  </ul>
					</nav>
				 </div>
				</div>
			</div>
			<div class="col-sm-3">
				<br><b></b><br>
				<ul class="list-group" id="list-group">
					<li class="list-group-item">在线人员：</li>
				</ul>

			</div>
		</div>
	</div>
	
	



	
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">聊天记录</h4>
      </div>
      <div class="modal-body">
        	<div id="oldContent" style="height:250px;overflow-y:scroll;">
			</div>
      </div>
       <div class="modal-footer">
	        <nav>
			  <ul class="pager">
			    <li><a href="javascript:older()">前一页</a></li>
			    <li><a href="javascript:newer()">后一页</a></li>
			  </ul>
			</nav>
	  </div>


    </div>
  </div>
</div>

</body>
</html>
<input type="hidden" id="nameToBe" value="${sessionScope.user.name }">
<input type="hidden" id="idToBe" value="${sessionScope.user.userId} }">
