<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim myyear,mymonth,begindate,enddate
myyear=request("myyear")
mymonth=request("mymonth")
begindate=myyear&"-"&mymonth&"-1"
'判断每月天数
select case mymonth
case 1,3,5,7,8,10,12
enddate=myyear&"-"&mymonth&"-31"
case 4,6,8,9,11
enddate=myyear&"-"&mymonth&"-30"
case 2 '平年闰年计数稍后再补上
enddate=myyear&"-"&mymonth&"-28"
end select
'判断天数结束
'Set rs=conn.execute("select Count(id) from [01387IpCount] where visittime between '"&begindate&"' and '"&enddate&"' group by visittime")
Set rs=conn.execute("select fromwhere,visittime from [01387ipcount] where visittime between '"&begindate&"' and '"&enddate&"'")
'i=1
dim a,b,c,d,e,f
a=0 '输入网址
b=0 '3721
c=0 '其他
d=0 '百度关键字
e=0 '邮件推广
'f=0 'Google
do while not rs.eof
if rs(0)="self" then
  a=a+1
else
 if instr(rs(0),"3721")>1 then
  b=b+1
else
 if instr(rs(0),"baidu")>1 then
 d=d+1
else
 if instr(rs(0),"mail")>1 then
 e=e+1
'else
' if instr(rs(0),"google")>1 then
' f=f+1
 else
  c=c+1
'end if
end if
end if
end if
end if
'i=i+1
rs.movenext
loop
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<!--[if !mso]>
<style>
v\:*         { behavior: url(#default#VML) }
o\:*         { behavior: url(#default#VML) }
.shape       { behavior: url(#default#VML) }
</style>
<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<style>
TD { FONT-SIZE: 9pt}
</style>
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<!--#include file="IpTop.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<script language=javascript>
function table3(total,table_x,table_y,all_width,all_height,table_type)
{
 //参数含义(传递的数组，横坐标，纵坐标，图表的宽度，图表的高度,图表的类型)
 //纯ASP代码生成图表函数3——饼图
 //作者：龚鸣(Passwordgm) QQ:25968152 MSN:passwordgm@sina.com Email:passwordgm@sina.com
 //本人非常愿意和ASP,VML,FLASH的爱好者在HTTP://topclouds.126.com进行交流和探讨
 //版本1.0 最后修改日期 2003-8-11
 //非常感谢您使用这个函数，请您使用和转载时保留版权信息，这是对作者工作的最好的尊重。

//***************************************************************************************
//修改说明：
//    本代码经原作者同意，由 awaysrain（绝对零度）修改为javascript。
//    最后修改日期 2003-9-22，测试环境为IE 6.0.2500.1106
//    因本人水平有限，修改中难免有错误，请大家及时指正。  
//***************************************************************************************

 var tmdColor1 = new Array();
 
 tmdColor1[0] = "#d1ffd1";
 tmdColor1[1] = "#ffbbbb";
 tmdColor1[2] = "#ffe3bb";
 tmdColor1[3] = "#cff4f3";
 tmdColor1[4] = "#d9d9e5";
 tmdColor1[5] = "#ffc7ab";
 tmdColor1[6] = "#ecffb7";
 
 var tmdColor2 = new Array();
 
 tmdColor2[0] = "#00ff00";
 tmdColor2[1] = "#ff0000";
 tmdColor2[2] = "#ff9900";
 tmdColor2[3] = "#33cccc";
 tmdColor2[4] = "#666699";
 tmdColor2[5] = "#993300";
 tmdColor2[6] = "#99cc00";
 
 var tb_color = new Array(tmdColor1,tmdColor2);
 var tb_height = 30;
 var total_no = total[0].length;
 var totalpie = 0;
 for(var i=0;i<total_no;i++)
 {
  totalpie += total[1][i];
 }
 var PreAngle = 0;
 for(var i=0;i<total_no;i++)
 { 
  document.write("<v:shape id='_x0000_s1025' alt='' style='position:absolute;left:" + table_x + "px;top:" + table_y + "px;width:" + all_width + "px;height:" + all_height + "px;z-index:1' coordsize='1500,1400' o:spt='100' adj='0,,0' path='m750,700ae750,700,750,700," + parseInt(23592960*PreAngle) + "," + parseInt(23592960*total[1][i]/totalpie) + "xe' fillcolor='" + tb_color[0][i] + "' strokecolor='#FFFFFF'><v:fill color2='" + tb_color[1][i] + "' rotate='t' focus='100%' type='gradient'/><v:stroke joinstyle='round'/><v:formulas/><v:path o:connecttype='segments'/></v:shape>");
  PreAngle += total[1][i] / totalpie;
 }
 
 if(table_type=="A")
 {
  document.write("<v:rect id='_x0000_s1025' style='position:absolute;left:" + (table_x + all_width + 20) + "px;top:" + (table_y + 20) + "px;width:100px;height:" + (total_no * tb_height + 20) + "px;z-index:1'/>");
  for(var i=0;i<total_no;i++)
  {   
   document.write("<v:shape id='_x0000_s1025' type='#_x0000_t202' alt='' style='position:absolute;left:" + (table_x + all_width + 25) + "px;top:" + (table_y+30+(i)*tb_height) + "px;width:60px;height:" + tb_height + "px;z-index:1'>");
   document.write("<v:textbox inset='0px,0px,0px,0px'><table cellspacing='3' cellpadding='0' width='100%' height='100%'><tr><td align='left'>" + total[0][i] + "</td></tr></table></v:textbox></v:shape>");
   document.write("<v:rect id='_x0000_s1040' alt='' style='position:absolute;left:" + (table_x + all_width + 80) + "px;top:" + (table_y + 30 + (i)*tb_height+3) + "px;width:30px;height:20px;z-index:1' fillcolor='" + tb_color[0][i] + "'><v:fill color2='" + tb_color[1][i] + "' rotate='t' focus='100%' type='gradient'/></v:rect>");
   //显示比例数
   //document.write("<v:shape id='_x0000_s1025' type='#_x0000_t202' alt='' style='position:absolute;left:" + (table_x+all_width+110) + "px;top:" + (table_y+30+(i)*tb_height) + "px;width:60px;height:" + tb_height + "px;z-index:1'>");
   //document.write("<v:textbox inset='0px,0px,0px,0px'><table cellspacing='3' cellpadding='0' width='100%' height='100%'><tr><td align='left'>" + Math.round(parseFloat(total[1][i]*100/totalpie)*100)/100 + "%</td></tr></table></v:textbox></v:shape>");
  }
 }
 
 if(table_type == "B")
 {
  var pie = 3.14159265358979;
  var TempPie = 0;
  for(var i=0;i<total_no;i++)
  {
   var TempAngle = pie * 2 * (total[1][i] / (totalpie * 2) + TempPie);
   var x1 = table_x + all_width/2 + Math.cos(TempAngle) * all_width * 3/8;
   var y1 = table_y + all_height/2 - Math.sin(TempAngle) * all_height * 3/8;
   var x2 = table_x + all_width/2 + Math.cos(TempAngle) * all_width * 3/4;
   var y2 = table_y + all_height/2 - Math.sin(TempAngle) * all_height * 3/4;
 
   if(x2>table_x + all_width/2)
   {
    x3 = x2 + 20;
    x4 = x3;
   }
   else
   {
    x3 = x2 - 20;
    x4 = x3 - 100;
   }
   document.write("<v:oval id='_x0000_s1027' style='position:absolute;left:" + (x1 - 2) + "px;top:" + (y1 - 2) + "px;width:4px;height:4px; z-index:2' fillcolor='#111111' strokecolor='#111111'/>");
   document.write("<v:line id='_x0000_s1025' alt='' style='position:absolute;left:0;text-align:left;top:0;z-index:1' from='" + x1 + "px," + y1 + "px' to='" + x2 + "px," + y2 + "px' coordsize='21600,21600' strokecolor='#111111' strokeweight='1px'></v:line>");
   document.write("<v:line id='_x0000_s1025' alt='' style='position:absolute;left:0;text-align:left;top:0;z-index:1' from='" + x2 + "px," + y2 + "px' to='" + x3 + "px," + y2 + "px' coordsize='21600,21600' strokecolor='#111111' strokeweight='1px'></v:line>");
   document.write("<v:shape id='_x0000_s1025' type='#_x0000_t202' alt='' style='position:absolute;left:" + x4 + "px;top:" + (y2 - 10) + "px;width:100px;height:20px;z-index:1'>");
   document.write("<v:textbox inset='0px,0px,0px,0px'><table cellspacing='3' cellpadding='0' width='100%' height='100%'><tr><td align='left'>" + total[0][i] + " " + Math.round(parseFloat(total[1][i] * 100/ totalpie)*100)/100 + "%</td></tr></table></v:textbox></v:shape>")
   TempPie += total[1][i]/totalpie;  
  }
 }
}
</script>
<script language=javascript>

//=============调用方法=====================

var dataArray = new Array()
dataArray[0]=<%=a%>
dataArray[1]=<%=b%>
dataArray[2]=<%=c%>
dataArray[3]=<%=d%>
dataArray[4]=<%=e%>
//dataArray[5]=<%=f%>
var nameArray = new Array()
nameArray[0]="输入网址"
nameArray[1]="<font face='Verdana, Arial, Helvetica, sans-serif'>3721</font>"
nameArray[2]="其他"
nameArray[3]="百度搜索"
nameArray[4]="邮件推广"
//nameArray[5]="Google搜索"
var total= new Array(nameArray,dataArray)

//table3(total,200,40,250,250,"A");
table3(total,260,280,250,250,"B");
</script>
</body>
</html>
