<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*,util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
Users users=(Users)session.getAttribute("user");
if(users==null){
	response.sendRedirect("/pinkish_red/index.jsp");
	return;
}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>客服聊天室</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="/pinkish_red/style/bootstrap.min.css">
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="/pinkish_red/js/jquery-1.9.1.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="/pinkish_red/js/bootstrap.min.js"></script>
<script type="text/javascript">
var timers;
var idToBe;
var myId=<%=users.getUserId() %>;
var page=1;
function old(fromId){
	page=1;
	idToBe=fromId;
	getOldNotesList();
}
function oldMessage(userId){
	old(userId);
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
function getOldNotesList(){
	$.get(
		"/pinkish_red/NoteList",
		{"page":page,"userId":idToBe,"readSign":0},
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
				$("#oldContent").scrollTop("10000");
			}else{
				alert("没有更多内容");
				page=page-1;
			}
		}
	);
}
function startChat(userId){
	clearInterval(timers);
	idToBe=userId;
	getNotes();
	timers=setInterval(getNotes,3000);
}

function sendNote(userId,str){
	var userIds=idToBe;
	$.post(
		"/pinkish_red/NoteAdd",
		{"userId":userIds,"content":str},
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
	var userId=idToBe;
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


$(document).ready(function(){
	$("#closeLabel").click(function(){
		clearInterval(timers);
	});
	
	
	$("#go").click(function(){
		var notes=$("#banana").val();
		var userId=idToBe;
		
		sendNote(userId,notes);
		
		if(notes!=null&&notes!=""){
		var str="<p class='bg-success text-danger'>"+notes+"</P>";
			$("#content").append(str);
			$("#banana").val("");
			$("#content").scrollTop("10000");
			if($("#content").scrollTop()>200){
				$('p:first').remove();
			}
		}	
	});
	
	$("#userNameSearch").click(function(){
		var userName=$("#userName").val();
		if(userName==null||userName.trim()==""){
			alert("输入想要查找的用户名");
			return;
		}
		
		$.get("UserSearch",{name:userName},function(date){
			date=$.parseJSON(date);
			if(date.success){
				$("#searchBody").empty();
				date.list.forEach(function(item){
					var stee="<tr><td>"+item.userId+"</td><td>"+item.name+"</td><td><button  class='btn btn-info' data-toggle='modal' data-target='#myModal' onclick='startChat("+item.userId+")' >聊天</button></td></tr>";
					$("#searchBody").append(stee);
				})
			}else{
				alert("没有找到");
			}
		
		});
		
		
		
	});
});


</script>
  </head>
  <body>
    <div class="container">
    	<div class="row">
    		<div class="col-sm-9">
    		<br>
    			<h3 align="center">客服</h3>
    			<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>客服ID</th>
							<th>客服名称</th>
							<th>聊天</th>
							<th>历史记录</th>
						</tr>
					</thead>
					<tbody>	
						<tr>
							<td>4</td>
							<td>service01</td>
							<td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" onclick="startChat('4')">聊天</button></td>
							<td><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal2" onclick="oldMessage('4')">历史记录</button></td>
						</tr>
						<tr>
							<td>16</td>
							<td>service02</td>
							<td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"  onclick="startChat('16')">聊天</button></td>
							<td><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal2"  onclick="oldMessage('16')">历史记录</button></td>
						</tr>
						<tr>
							<td>17</td>
							<td>service03</td>
							<td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"  onclick="startChat('17')">聊天</button></td>
							<td><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal2"  onclick="oldMessage('17')">历史记录</button></td>
						</tr>
						<tr>
							<td>18</td>
							<td>service04</td>
							<td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"  onclick="startChat('18')">聊天</button></td>
							<td><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal2"  onclick="oldMessage('18')">历史记录</button></td>
						</tr>
					
					</tbody>
				</table>
				
				
				
				
				
				<br><br><br><br>
				<%
				NoteDao noteDao = new NoteDaoImpl();
				List list = noteDao.findFromList(users);
				Collections.reverse(list);
				
				
				%>
				<h3 align="center">历史记录</h3>
				<table class="table table-hover table-bordered">
					<thead>
					
						<tr>
							<th>用户ID</th>
							<th>用户名</th>
							<th>聊天</th>
							<th>历史记录</th>
						</tr>
					</thead>
					<tbody>	
					<%
					if(!list.isEmpty()){
						for(Object o:list){
							Users u=(Users)o;
					%>
						<tr>
							<td><%=u.getUserId() %></td>
							<td><%=u.getName() %></td>
							<td>
								<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"  onclick="startChat('<%=u.getUserId() %>')">聊天</button>
							</td>
							<td>
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal2"  onclick="oldMessage('<%=u.getUserId() %>')">历史记录</button>
							</td>
						</tr>		
					<%		
						}
					}
					 %>
					 
					
					</tbody>
				</table>
				
				
				
				<br><br><br><br>
				<h3 align="center">陌生人</h3>
				<form class="form-inline">
				  <div class="form-group">
				    <label class="sr-only" for="exampleInputEmail3">用户名</label>
				    <input type="text" id="userName" class="form-control" id="exampleInputEmail3" placeholder="用户名">
				  </div>
				  <button type="button" id="userNameSearch" class="btn btn-success">搜索用户</button>
				</form>
    			<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>用户ID</th>
							<th>用户名</th>
							<th>聊天</th>
						</tr>
					</thead>
					<tbody id="searchBody">	
					</tbody>
				</table>
				
    		
    		</div>
    		<div class="col-sm-3">
    		<br>
    			<%
    				List unreadCount=noteDao.unreadCount(users);
    				
    			 %>
				<h3 align="center">未读消息</h3>
    			<table class="table table-hover table-bordered">
					<thead>
						
						<tr>
							<th>用户名</th>
							<th>未读消息</th>
						</tr>
						
						
					</thead>
					<tbody>
					<%
					if(!unreadCount.isEmpty()){ 
						for(Object obj:unreadCount){
						Note n=(Note)obj;
					%>
						<tr>
							<th><%=n.getFromName() %></th>
							<th><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"  onclick="startChat('<%=n.getFromId() %>')">聊天<span class='badge'><%=n.getToId() %></span></button></th>
						</tr>
					<%}} %>	
					</tbody>
				</table>
				
				
    			
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
    
    
    
  </body>
</html>
