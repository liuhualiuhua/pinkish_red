<%@ page language="java" import="java.util.*,java.awt.image.*,java.awt.*,javax.imageio.*" pageEncoding="GBK" contentType="image/jpeg"%>
<!-- 记得contentType="image/jpeg" -->
<%!

Color getRandColor(int start,int end,long seed)
{
	if(start>255)
	{
		start=255;
	}
	Random random=new Random(seed);
	int r=start+random.nextInt(end+1-start);
	int g=start+random.nextInt(end+1-start);
	int b=start+random.nextInt(end+1-start);
	return new Color(r,g,b);
}
 %>
<%
int width=60;
int height=20;
String[] str={"1","a","A","B","C","2","I","8","U","y"};
BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
//这就算是有纸了，需要知道宽度高度
Graphics g=image.getGraphics();
//这就算有笔了



g.setColor(getRandColor(230,250,System.currentTimeMillis()));
//这就算把笔蘸上颜色了
g.fillRect(0,0,width,height);
//填充底色
Random random=new Random(System.currentTimeMillis());
//画干扰线
g.setColor(getRandColor(160,200,System.currentTimeMillis()));
for(int i=0;i<50;i++)
{
	g.drawLine(random.nextInt(6),random.nextInt(15),
	random.nextInt(6)+random.nextInt(56),random.nextInt(7)+random.nextInt(17));
}


String check=new String();

g.setFont(new Font("Times new Roman",Font.PLAIN,18));
for(int i=0;i<4;i++)
{
	g.setColor(getRandColor(20,110,System.currentTimeMillis()+i*1000));
	//String ran=String.valueOf(random.nextInt(10));
	int temp=random.nextInt(10);
	String ran=str[temp];
	check+=ran;
	g.drawString(ran,6+i*13,16);//分别往上写数字
}
session.setAttribute("check",check);
//System.out.println(session.getAttribute("check"));

g.dispose();
//使图像生效
//response.setCharacterEncoding("GBK");
//request.setCharacterEncoding("GBK");
ImageIO.write(image,"JPEG",response.getOutputStream());
//将图像输出，三个参数分别为纸，格式，服务器相应的输出流

out.clear();
out=pageContext.pushBody();
//加上这两句，tomcat就没有异常信息


%>


