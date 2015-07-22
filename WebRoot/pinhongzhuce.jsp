<%@ page language="java" import="java.util.*,java.text.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pinhongzhuce.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
	    <style type="text/css">
<!--
td{ background-repeat:no-repeat}
.ww{color:#FF0000; size:16}
.STYLE20 {
	color: #FF0000;
	size: 16;
	font-size: x-large;
	font-weight: bold;
}
.STYLE21 {
	color: #FF0000;

	font-size: 14;
	font-weight: bold;
}
-->
    </style>
	<script>
function cheZong(){
if(cheName() && cheBox() && queren() && Email() && nian()){
   return true;
}
  return false;
}
function cheName(){
var name=document.getElementById("name").value;
if(name.length==0){
alert("用户名不能为空");
document.getElementById("name").focus();
return false;
}else if(name.length<6){
alert("用户名长度为6-12个字符");
return false;
}else if(name.length>12){
alert("用户名长度为6-12个字符");
return false;
}

	   for(var i=0;i<name.length;i++){
	    var names=name.charAt(i);
		if((!(names>='0'&&names<='9'))&&(!(names>='a'&&names<='z'))&&(names!='_')){
		alert("用户名只能包含字母,数字和下划线");
		document.getElementById("name").focus();
		document.getElementById("name").select();
		return false;
		}
		}
return true;
}
function cheBox(){
var box=document.getElementById("box").value;

if(box.length==0){
alert("密码不能为空");
return false;
}else if(box.length<6){
alert("密码长度为6-12个字符");
return false;
}else if(box.length>12){
alert("密码长度为6-12个字符");
return false;
}
 return true;
}
function queren(){
var box=document.getElementById("box").value;
var queren=document.getElementById("queren").value;
if(box!=queren){
alert("确认密码与密码不匹配");
return false;
}
return true;
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
<form action="dozhuce.jsp" onsubmit="return cheZong()" method="post">
<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#0099FF" bgcolor="#00CCFF" class="qq">
  <tr>
    <td height="30" align="center" valign="middle"><span class="STYLE20">品红网免费注册</span></td>
  </tr>
  <tr>
    <td height="30" align="center">&nbsp;用户名：
      <input type="text" id="name" name="name"/></td>
  </tr>
  <tr>
    <td height="30" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码:
      <input type="password" id="box" name="pass"/></td>
  </tr>
  <tr>
    <td height="30" align="center">确认密码:
      <input type="password" id="queren" name="pass1"/></td>
  </tr>
  <tr>
    <td align="center" class="STYLE21">
    请选择头像
    </td>
  </tr>
  <tr>
    <td align="center"><img src="img/1.jpeg" width="50" height="50"  ><input name="touxiang" type="radio" value="1.jpeg">
    <img src="img/2.jpeg" width="50" height="50" ><input name="touxiang" type="radio" value="2.jpeg">
    <img src="img/3.jpeg" width="50" height="50" ><input name="touxiang" type="radio" value="3.jpeg">
    <img src="img/4.jpeg" width="50" height="50" ><input name="touxiang" type="radio" value="4.jpeg">
    </td>
  </tr>
  <tr>
    <td align="center">
    <img src="img/5.jpeg" width="50" height="50" ><input name="touxiang" type="radio" value="5.jpeg">
    <img src="img/6.jpeg" width="50" height="50" ><input name="touxiang" type="radio" value="6.jpeg">
    <img src="img/7.jpeg" width="50" height="50" ><input name="touxiang" type="radio" value="7.jpeg">
    <img src="img/8.jpeg" width="50" height="50" ><input name="touxiang" type="radio" value="8.jpeg">
	</td>
  </tr>
  
  <tr>
    <td align="center"><input name="登录" type="submit" value="同意以下协议条款并提交"/></td>
  </tr>
  <tr>
    <td align="center"><textarea name="" cols="60" rows="6">
	1.乙方愿意成为甲方员工,将其智慧贡献给甲方事业,受雇于甲方不违反其任何约定或法定义务,并具备完全民事行为能力,能够订立本合同。

2.甲方已告知乙方工作内容、工作条件、工作地点、职业危害、安全生产状况、、规章制度以及乙方要求了解的其他情况。

3.乙方知晓其工作内容、工作条件、工作地点、职业危害、安全生产状况、劳动报酬、规章制度、录用条件、岗位要求以及其他相关的情况。

4.乙方保证其向甲方提供的与应聘有关的材料信息的真实性、合法性,并保证其执照、证件或资格在受雇期间的维持。

二、工作内容及工作地点:

甲方因工作需要,在合法的前提下有权对乙方工作岗位和工作地点,进行适当调整,乙方应当服从。

1.甲方根据工作需要,可以临时(期限不超过3个月)调整乙方的工作岗位,乙方应当服从,双方无需重新签订新的劳动合同。

2.甲方根据乙方的工作业绩等各方面的能力和表现,经考核乙方不胜任原工作岗位的,甲方可以调整乙方的工作岗位,乙方应当服从,否则,甲方可根据《劳动合同法》及甲方规章制度依法视乙方为旷工,直至解除劳动合同。调整工作岗位后,工资待遇亦根据岗位实际作相应调整。

三、工作时间

双方约定实行计时工作制的,如甲方根据工作需要要求乙方加班的,甲方将安排乙方补休或按国家规定支付加班费用;乙方自行加班的,根据甲方管理制度和具体工作安排,乙方属完成正常工作任务,甲方不再作加班处理。
	</textarea></td>
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
