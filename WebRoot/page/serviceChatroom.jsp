<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="UTF-8"%>
<%
Users users=(Users)session.getAttribute("user");
if(users==null){
	response.sendRedirect("/pinkish_red/index.jsp");
	return;
}
 %>
<html>
<head>
<title>客服聊天室</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="/pinkish_red/style/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/pinkish_red/js/jquery-1.9.1.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/pinkish_red/js/bootstrap.min.js"></script>
<script type="text/javascript">
function getCount(){
	$.get(
		"/pinkish_red/NoteCount",
		{},
		function(date){
			var date=$.parseJSON(date);
			if(date.result){
				$("#tbody").empty();
				date.content.forEach(
					function(item){
					var str="<tr ><td>"+item.fromName+"</td><td><button onclick='change("+item.fromId+")' type='button' class='btn btn-default btn-sm' data-toggle='modal' data-target='#myModal'>聊天 <span class='badge'>"+item.toId+"</span></button></td></tr>";
					$("#tbody").append(str);
					}
				)
			}	
		}
	);
}
function sendNote(userId,str){
	$.post(
		"/pinkish_red/NoteAdd",
		{"userId":userId,"content":str},
		function(date){
			var date=$.parseJSON(date);
			if(date.result){
				//alert("成功");
			}else{
				alert("失败");
			}
		}
	);
}
function getNotes(userId){
	var userId=$("#apple").val();
	$.get(
		"/pinkish_red/NoteList",
		{"userId":userId},
		function(date){
			var date=$.parseJSON(date);
			if(date.result){
				date.content.forEach(
					function(item){
						var str;
						if(item.fromId!=userId){
							str="<p class='bg-success text-danger text-right'>";
						}else{
							str="<p class='bg-success text-danger text-left'>";
						}
						str=str+item.fromName+"("+item.postTime.substring(11,20)+"):"+item.content+"</p>";
						$("#content").append(str);
						$("#content").scrollTop("1000");
						if($("#content").scrollTop()>400){
							$('p:first').remove();
						}
					}
				);
			}
		}
	);
}
var timers;
function change(userId){
	clearInterval(timers);
	$("#apple").val(userId);
	$("#content").empty();
	getNotes();
	timers=setInterval(getNotes,3000);
}

function remove(){
	clearInterval(timers);
}
function refreshList(){
	$("#tbody").empty();
	clearInterval(timers);
	getCount();
}

var page=1;
var userId=0;
function getOldUsersList(){
	$.get(
		"/pinkish_red/NoteUsersList",
		{},
		function(date){
			var date=$.parseJSON(date);
			if(date.result){
				$("#oldTbody").empty();
				date.content.forEach(
					function(item){
						var str="<tr><td>"+item.name+"</td><td><button type='button' onclick='old("+item.userId+")' class='btn btn-default btn-sm' data-toggle='modal' data-target='#myModal2'>聊天记录</button></td><td><button onclick='change("+item.userId+")' type='button' class='btn btn-default  btn-sm' data-toggle='modal' data-target='#myModal'>发起聊天</button></td></tr>";
						$("#oldTbody").append(str);
					}
				)
			}
		}
	);
}
function getOldNotesList(){
	$.get(
		"/pinkish_red/NoteList",
		{"page":page,"userId":userId,"readSign":0},
		function(date){
		var date=$.parseJSON(date);
			if(date.result){
				$("#oldContent").empty();
				date.content.forEach(
					function(item){
						var str="<p class='bg-success text-danger'>"+item.fromName+"("+item.postTime+"):<br>"+item.content+"</p>";
						$("#oldContent").append(str);
					}
				);
				$("#oldContent").scrollTop("1000");
			}else{
				alert("没有更多内容");
				page=page-1;
			}
		}
	);
}
function old(fromId){
	page=1;
	userId=fromId;
	getOldNotesList();
}
function older(){
	page=page+1;
	getOldNotesList();
	
}
function newer(){
	if(page>=2){
		page=page-1;
	}else{
		alert("已经是最后一页");
		return;
	}
	getOldNotesList();
}
$(document).ready(function(){
	$("#closeLabel").click(function(){
		clearInterval(timers);
	});
	refreshList();
	
	getOldUsersList();

	$("#go").click(function(){
		var notes=$("#banana").val();
		var userId=$("#apple").val();
		
		sendNote(userId,notes);
		
		if(notes!=null&&notes!=""){
		var str="<p class='bg-success text-danger'>"+notes+"</P>";
			$("#content").append(str);
			$("#banana").val("");
			$("#content").scrollTop("1000");
			if($("#content").scrollTop()>200){
				$('p:first').remove();
			}
		}
			
	});
});
</script>
</head>

<body style="background-color:#EEE">
	<div class="container-fluid">
		<br>
		<div class="row">
			<div class="col-sm-4">
				
				<div class="row">
					<div class="col-xs-4 col-sm-1">
					</div>
					<div class="col-xs-4 col-sm-11">
					<div class="panel panel-primary">
					  <div class="panel-heading">
					  <h3 class="panel-title">未读消息</h3>
					  </div>
					  <div class="panel-body">
						
					    	<table class="table table-hover table-bordered table-condensed"">
								<thead>
								<tr>
									<td>用户名</td>
									<td>
									<button type="button" class="btn btn-default btn-sm" onclick="refreshList()">
									刷新列表  
									</button>
									</td>
								</tr>
								</thead>
								<tbody id="tbody">						
												
								</tbody>
							</table>
					    
					  </div>
					</div>
					
					
					
<br></br>

						
						<div class="panel panel-success">
						  <div class="panel-heading">
						    <h3 class="panel-title">历史记录</h3>
						  </div>
						  <div class="panel-body">
							   
							   <table class="table table-hover table-bordered table-condensed" >
								  <thead>
								  	<tr>
								  		<td>历史记录</td>
								  		<td>聊天记录</td>
								  		<td>功能按钮</td>
								  	</tr>
								  </thead>
								  <tbody id="oldTbody" >
								  	<tr>
								  		<td>用户名</td>
								  		<td>
									  		<button type="button" onclick="old(userId)" class="btn btn-default" data-toggle="modal" data-target="#myModal2">
									  		点击查看
											</button>
								  		</td>
								  		<td>
								  			<button onclick="change('')" type="button" class="btn btn-default " data-toggle="modal" data-target="#myModal">
											发起聊天
											</button>
								  		</td>
								  	</tr>
								  </tbody>
								</table>
							   
						  </div>
						</div>
						
						
					



					</div>
				</div>
			</div>
			<div class="col-sm-8">
				
				<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">客服信息</h3>
				  </div>
				  <div class="panel-body">
				    <br>
				    
				    <table class="table table-bordered table-hover">
				    	<thead>
				    		<tr>
				    		<td rowspan="3" style="text-align:center"><img src="<%=users.getHead() %>" width="150px" height="150px" alt="头像" class="img-rounded"></td>
				    		<td>用户名</td><td><%=users.getName() %></td>
				    		</tr>
				    		<tr>
				    		<td>用户权限</td><td><%=users.getRole() %></td>
				    		</tr>
				    		<tr>
				    			<td>用户ID</td><td><%=users.getUserId() %></td>
				    		</tr>
				    	</thead>
				    	<tbody>
				    	</tbody>
					</table>
				    
				  </div>
				</div>
				
				
				
			</div>
		</div>
		
		
		
		
		<!-- Modal -->
		<div class="modal fade  bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeLabel" ><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">聊天中</h4>
		      </div>
		      <div class="modal-body">
		        <div class="panel panel-default">
				  <div class="panel-body" id="content" style="height:280px;overflow-y:scroll;">
				    <p>聊天内容</p>
				  </div>
				</div>
				<div class="input-group">
					 <input type="text" class="form-control" placeholder="说点什么..." id="banana">
					 <span class="input-group-btn">
					     <button class="btn btn-default" type="button" id="go" >Go!</button>
					 </span>
				</div>
		      </div>
		      
		    </div>
		  </div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
	
	
	
<input id="apple" name="apple" type="hidden" value="">
</body>
</html>
