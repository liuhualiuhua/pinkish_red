<%@ page language="java" import="java.util.*,java.text.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pinhongdenglu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>

<style>
table{line-height:60px}
a:link{text-decoration:none}

.name{border:1px solid #ff0000;}
.names{border:1px solid #0000ff;}
.qq{color:#FF0000; size:16}
.STYLE21 {color: #FF0000; size: 16; font-size: large; }
.STYLE23 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE25 {font-size: x-large}
</style>
<script>
function reloadcode(){ 
document.getElementById('safecode').src = 'image.jsp?' + Math.random();
}
function cheKo(){
document.getElementById("name").value="";
document.getElementById("name").style.color="black";

}
function cheYZ(){
document.getElementById("yan").value="";
document.getElementById("yan").style.color="black";
}

function cheName(){
var name=document.getElementById("name").value;
var abbs=document.getElementById("abbs").value;
var yan=document.getElementById("yan").value;
if(name.length==0){
alert("用户名不能为空");
document.getElementById("name").focus();
return false;
  }else if(abbs.length==0){
  alert("密码不能为空");
  document.getElementById("abbs").focus();
  return false;
}else if(abbs.length<6){
	    alert("密码应大于6");
		document.getElementById("abbs").select();
		return false;
}else if(yan.length==0){
	alert("验证码不能为空");
	document.getElementById("yan").focus();
	 return false;	 
	 }else{	 
  document.forms.submit();
 }
}


</script>
  </head>
<body>
    <!--scroll-head-->
    <div class="scroll-head"></div>
    <!--top-->
    <div class="top-wrapper">
        <div class="top-info">
            <div class="top-left">
                <div data-toggle="arrowdown" id="arrow1" class="user-name">
                    <a href="#">用户信息</a>
                    <span class="down-icon"></span>
                </div>
                <div data-toggle="arrowdown" id="arrow2" class="msg-info">
                    <i class="fa fa-envelope fa-gray"></i>
                    <a href="#">消息</a>
                    <span class="down-icon"></span>
                </div>
                <a class="a-float-left" href="#">手机品红</a>
                
                <!--hidden-box-->
                <div data-toggle="hidden-box" id="nav-box1" class="user-box">
                    <img class="my-head" src="img/user-head.jpg" />
                    <div class="my-grow">
                        <h1><a href="#">账号管理</a>&nbsp;|&nbsp;<a href="#">退出</a></h1>
                       
                      <h2><a href="#">查看我会员特权</a></h2>
                            <a href="#">我的成长</a>
                       
                    </div>
                    <p style="height: 10px; clear: both;">&nbsp;</p>
                    <div class="my-card">
                        <div class="cards-info">
                            <ul>
                                <li><img src="img/icon.png" /></li>
                                <li><img src="img/icon.png" /></li>
                            </ul>
                        </div>
                        <div class="toggle-box">
                            <div class="toggle">
                                 <i style="vertical-align: top" class="fa fa-angle-left arrow-left"></i>
                                 <i style="vertical-align: top" class="fa fa-angle-right arrow-right"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div data-toggle="hidden-box" id="nav-box2" class="msg-box">
                    <h1>未读新消息<a href="#" class="fa fa-pencil-square-o pencil"></a></h1>
                    <div class="read-info">
                        <h2><span class="orange">&nbsp;&nbsp;|</span>&nbsp;你的书架&nbsp;<span style="font-weight: lighter">收到了<span class="orange">1</span>本书</span><span class="fa fa-times close-msg"></span></h2>
                        <img src="img/book-1.png" />
                        <div style="float: right">
                            <p>
                                全中国最穷的小伙子发财日记<br/>
                                掏彩票公共账<br/>
                               
                            </p>
                            <h3><a href="#">去看看</a></h3>
                        </div>
                    </div>
                    <div class="msg-setting">
                        <a href="#" class="fa fa-cog"></a>
                        <a href="#" class="fa fa-pencil-square-o"></a>
                        <a style="margin-left: 70px" href="#">买家消&nbsp;|&nbsp;</a>
                        <a href="#">卖家消息</a>
                    </div>
                </div>
            </div>
            <!--top-right-->
            <div class="top-right">
                <div data-toggle="arrowdown" id="arrow3" class="user-name">
                    <a href="#">我的品红</a>
                    <span class="down-icon"></span>
                </div>
                <div data-toggle="arrowdown" id="arrow4" class="user-name">
                    <i class="fa fa-shopping-cart fa-orange"></i>
                    <a href="#">购物车</a>
                    <span class="down-icon"></span>
                </div>
                <div data-toggle="arrowdown" id="arrow5" class="user-name">
                    <i class="fa fa-star fa-gray"></i>
                    <a href="#">收藏夹</a>
                    <span class="down-icon"></span>
                </div>
                <a class="a-float-left" href="#">商品分类</a>
                <span class="vertical-line">|</span>
                <div data-toggle="arrowdown" id="arrow6" class="user-name">
                    <a href="#">卖家中心</a>
                    <span class="down-icon"></span>
                </div>
                <a class="a-float-left" href="#">客户联系</a>
                <div data-toggle="arrowdown" id="arrow7" class="user-name">
                    <i class="fa fa-list-ul fa-orange"></i>
                    <a href="#">网站导航</a>
                    <span class="down-icon"></span>
                </div>
				
</div>


<br><br><br><br><br><br><br><br>
<form action="dodenglu.jsp" method="post" name="forms">
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="84" align="center"><h3 class="STYLE21"><span class="STYLE25">&nbsp;&nbsp;<strong>品红用户登陆</strong></span></h3></td>
  </tr>
  <tr>
  <td height="60" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名：
    <input  type="text" id="name" onmouseover="this.className='name'" onmouseout="this.className='names'" value="请输入用户名" name="name" onfocus="cheKo()" style="color:#CCCCCC" />
    <a href="#" onMouseOver="this.style.fontSize='15px'" onMouseOut="this.style.fontSize='14px'" >忘记用户名>></a></td>
  </tr>
  <tr>
    <td height="60" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户密码：
      <input type="text" id="abbs" onmouseover="this.className='name'" name="pass" onmouseout="this.className='names'" /><a href="#"  onMouseOver="this.style.fontSize='15px'" onMouseOut="this.style.fontSize='14px'">&nbsp;忘记密码>>&nbsp;&nbsp;</a></td>
  </tr>
  <tr>
  <td height="60" align="center" class="id">&nbsp;验证码：
    <input type="text" name="names" id="yan" onmouseover="this.className='name'" onmouseout="this.className='names'" style="color:#CCCCCC" onfocus="cheYZ()" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br> <a href="javascript:reloadcode();"><img src="image.jsp" id="safecode"  border="0"/></a> 
   <a href="javascript:reloadcode();" >看不清，请换一张</a></td>
  </tr> 
  
  <tr>
    <td height="59" align="center">
    <img src="img/00033.gif"  onclick="cheName()"/>	</td>
  </tr>
</table>
</form>

    <!--footer-->
	<br><br><br>
    <div class="footer">
        <div class="footer-right">
            <div class="footer-nav">
                <a href="#">阿里巴巴集团</a>|
                <a href="#">阿里巴巴国际站</a>|
                <a href="#">阿里巴巴中国站</a>|
                <a href="#">全球速卖通</a>|
                <a href="#">淘宝网</a>|
                <a href="#">天猫</a>|
                <a href="#">聚划算</a>|
                <a href="#">一淘</a>|
                <a href="#">阿里妈妈</a>|
                <a href="#">阿里云计算</a>|
                <a href="#">云OS</a>|
                <a href="#">万网</a>|
                <a href="#">支付宝</a>|
                <a href="#">来往</a>
            </div>
            <div class="about-tao">
                <a href="#">关于品红</a>
                <a href="#">合作伙伴</a>
                <a href="#">营销中心</a>
                <a href="#">廉正举报</a>
                <a href="#">联系客服</a>
                <a href="#">开放平台</a>
                <a href="#">诚征英才</a>
                <a href="#">联系我们</a>
                <a href="#">网站地图</a>
                <a href="#">法律声明</a>
                <span class="gary-text">&copy; 2014 Taobao.com 版权所有</span>
            </div>
            <p class="gary-text"><span>网络文化经营许可证：文网文[2010]040号</span>|<span>增值电信业务经营许可证：浙B2-20080224-1</span>|<span>信息网络传播视听节目许可证：1109364号</span></p>
            <div class="some-info">
                <img src="img/some.png" />
            </div>
        </div>
    
    </div>

    <!--backtoTop1-->
    <!--兼容所有现代浏览器同时包括 ie6/7/8/9 （ie6会有一点点抖动）-->


</body>
</html>
