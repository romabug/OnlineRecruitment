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
Set rs=conn.execute("select visittime,sum(mycount) from [01387Newpagecount] where visittime between '"&begindate&"' and '"&enddate&"' group by visittime")
dim ip(31)
for m=1 to 31
ip(m)=0
next
'i=1
do while not rs.eof
ip(right(rs(0),len(rs(0))-instrrev(rs(0),"-")))=rs(1)'日期值
'response.Write(rs(0)&"&nbsp;"&ip(right(rs(0),len(rs(0))-instrrev(rs(0),"-")))&"<br>") 
'response.Write(right(rs(0),len(rs(0))-instrrev(rs(0),"-")))
'i=i+1
rs.movenext
loop
%>
<script language=javascript>
function table2(total,table_x,table_y,all_width,all_height,line_no)
{
var line_color = "#69f";
var left_width = 70;
var total_no = total[1].length
var temp1,temp2,temp3
temp1 = 0;
for(var i=1;i<total_no;i++)
{
 for(var j=1;j<=line_no;j++)
 {
  if(temp1<total[j][i])
   temp1 = total[j][i];
 }
}
temp1 = parseInt(temp1);
if(temp1>9)
{
 temp2 = temp1.toString().substr(1,1);
 if(temp2>4)
 {
  temp3 = (parseInt(temp1/(Math.pow(10,(temp1.toString().length-1))))+1)*Math.pow(10,(temp1.toString().length-1));
 }
 else
 {
  temp3 = (parseInt(temp1/(Math.pow(10,(temp1.toString().length-1))))+0.5)*Math.pow(10,(temp1.toString().length-1))
 }
}
else
{
 if(temp1>4)
 {
  temp3 = 100; 
 }
 else
 {
  temp3 = 50;
 }
}
temp4 = temp3;
document.write("<v:rect id='_x0000_s1027' alt='' style='position:absolute;left:" + (table_x + left_width) + "px;top:" + table_y + "px;width:" + all_width + "px;height:" + all_height + "px;z-index:-1' fillcolor='#9cf' stroked='f'><v:fill rotate='t' angle='-45' focus='100%' type='gradient'/></v:rect>");
for(var i=0;i<all_height;i += all_height/5)
{
 document.write("<v:line id='_x0000_s1027' alt='' style='position:absolute;left:0;text-align:left;top:0;flip:y;z-index:-1' from='" + (table_x + left_width + length) + "px," + (table_y + all_height - length - i) + "px' to='" + (table_x + all_width + left_width) + "px," + (table_y + all_height - length - i) + "px' strokecolor='" + line_color + "'/>");
 document.write("<v:line id='_x0000_s1027' alt='' style='position:absolute;left:0;text-align:left;top:0;flip:y;z-index:-1' from='" + (table_x + (left_width - 15)) + "px," + (table_y + i) + "px' to='" + (table_x + left_width) + "px," + (table_y + i) + "px'/>");
 document.write("<v:shape id='_x0000_s1025' type='#_x0000_t202' alt='' style='position:absolute;left:" + table_x + "px;top:" + (table_y + i) + "px;width:" + left_width + "px;height:18px;z-index:1'>");
 document.write("<v:textbox inset='0px,0px,0px,0px'><table cellspacing='3' cellpadding='0' width='100%' height='100%'><tr><td align='right'>" + temp4 + "</td></tr></table></v:textbox></v:shape>");
 temp4 = temp4 - temp3/5;
}
document.write("<v:line id='_x0000_s1027' alt='' style='position:absolute;left:0;text-align:left;top:0;flip:y;z-index:-1' from='" + (table_x + left_width) + "px," + (table_y + all_height) + "px' to='" + (table_x + all_width + left_width) + "px," + (table_y + all_height) + "px'/>");
document.write("<v:line id='_x0000_s1027' alt='' style='position:absolute;left:0;text-align:left;top:0;flip:y;z-index:-1' from='" + (table_x + left_width) + "px," + table_y + "px' to='" + (table_x + left_width) + "px," + (table_y + all_height) + "px'/>");
var tmpStr = ""
for(i=1;i<=line_no;i++)
{
 var re  = /,/g;
 tmpStr += ",[\"" + total[i][0].replace(re,"\",\"") + "\"]"
}
tmpStr = tmpStr.substr(1,tmpStr.length-1)
var line_code = eval("new Array(" + tmpStr + ")")
for(var j=1;j<=line_no;j++)
{
 for(var i=1;i<total_no-1;i++)
 {
  var x1 = table_x + left_width + all_width * (i - 1)/(total_no-1)
  var y1 = table_y + (temp3 - total[j][i]) * (all_height/temp3)
  var x2 = table_x + left_width + all_width * i/(total_no-1)
  var y2 = table_y + (temp3 - total[j][i+1]) * (all_height/temp3)
  
  document.write("<v:line id='_x0000_s1025' alt='' style='position:absolute;left:0;text-align:left;top:0;z-index:1' from='" + x1 + "px," + y1 + "px' to='" + x2 + "px," + y2 + "px' coordsize='21600,21600' strokecolor='" + line_code[j-1][0] + "' strokeweight='" + line_code[j-1][1] + "'>");
  switch (parseInt(line_code[j-1][2]))
  {
   case 1:
    break;
   case 2:
    document.write("<v:stroke dashstyle='1 1'/>");
    break;
   case 3:
    document.write("<v:stroke dashstyle='dash'/>");
    break;
   case 4:
    document.write("<v:stroke dashstyle='dashDot'/>");
    break;
   case 5:
    document.write("<v:stroke dashstyle='longDash'/>");
    break;
   case 6:
    document.write("<v:stroke dashstyle='longDashDot'/>");
    break;
   case 7:
    document.write("<v:stroke dashstyle='longDashDotDot'/>");
    break;
  }
  
  document.write("</v:line>");
  
  switch (parseInt(line_code[j-1][3]))
  {
   case 1:
    break;
   case 2:
    document.write("<v:rect id='_x0000_s1027' style='position:absolute;left:" + (x1 - 2) + "px;top:" + (y1 - 2) + "px;width:4px;height:4px; z-index:2' fillcolor='" + line_code[j-1][0] + "' strokecolor='" + line_code[j-1][0] + "'/>");
    break;
   case 3:
    document.write("<v:oval id='_x0000_s1026' style='position:absolute;left:" + (x1 - 2) + "px;top:" + (y1 - 2) + "px;width:4px;height:4px;z-index:1' fillcolor='" + line_code[j-1][0] + "' strokecolor='" + line_code[j-1][0] + "'/>");
    break;
  } 
  
 }
  switch (parseInt(line_code[j-1][3]))
  {
   case 1:
    break;
   case 2:
    document.write("<v:rect id='_x0000_s1027' style='position:absolute;left:" + (x2 - 2) + "px;top:" + (y2 - 2) + "px;width:4px;height:4px; z-index:2' fillcolor='" + line_code[j-1][0] + "' strokecolor='" + line_code[j-1][0] + "'/>");
    break;
   case 3:
    document.write("<v:oval id='_x0000_s1026' style='position:absolute;left:" + (x2 - 2) + "px;top:" + (y2 - 2) + "px;width:4px;height:4px;z-index:1' fillcolor='" + line_code[j-1][0] + "' strokecolor='" + line_code[j-1][0] + "'/>");
    break;
  }
}
 
for(var i=0;i<total_no-1;i++)
{
 document.write("<v:line id='_x0000_s1027' alt='' style='position:absolute;left:0;text-align:left;top:0;flip:y;z-index:-1' from='" + (table_x + left_width + all_width * (i)/(total_no-1)) + "px," + (table_y + all_height) + "px' to='" + (table_x + left_width + all_width * (i)/(total_no-1)) + "px," + (table_y + all_height + 15) + "px'/>");
 document.write("<v:shape id='_x0000_s1025' type='#_x0000_t202' alt='' style='position:absolute;left:" + (table_x + left_width + all_width * (i)/(total_no-1)) + "px;top:" + (table_y + all_height) + "px;width:" + (all_width/(total_no-1)) + "px;height:18px;z-index:1'>");
 document.write("<v:textbox inset='0px,0px,0px,0px'><table cellspacing='3' cellpadding='0' width='100%' height='100%'><tr><td align='left'>" + total[0][i] + "</td></tr></table></v:textbox></v:shape>");
}
var tb_height = 30
document.write("<v:rect id='_x0000_s1025' style='position:absolute;left:" + (table_x + all_width + 20) + "px;top:" + table_y + "-1px;width:100px;height:" + (line_no * tb_height + 20) + "px;z-index:1'/>");
for(var i=0;i<line_no;i++)
{
 document.write("<v:shape id='_x0000_s1025' type='#_x0000_t202' alt='' style='position:absolute;left:" + (table_x + all_width + 25) + "px;top:175px;width:80px;height:" + tb_height + "px;z-index:1'>");
 document.write("<v:textbox inset='0px,0px,0px,0px'><table cellspacing='3' cellpadding='0' width='100%' height='100%'><tr><td align='left'>" + line_code[i][4] + "</td></tr></table></v:textbox></v:shape>");
 document.write("<v:rect id='_x0000_s1040' alt='' style='position:absolute;left:" + (table_x + all_width + 80) + "px;top:180px;width:30px;height:20px;z-index:1' fillcolor='" + line_code[i][0] + "'><v:fill color2='" + line_code[i][0] + "' rotate='t' focus='100%' type='gradient'/></v:rect>");
}
}
</script>
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
<body bgcolor="#CAD7F7" leftmargin=0 topmargin=0 scroll=AUTO>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<!--#include file="PageCountTop.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<script language=javascript>
var nameArray = new Array();
nameArray[0]="1"
nameArray[1]="2"
nameArray[2]="3"
nameArray[3]="4"
nameArray[4]="5"
nameArray[5]="6"
nameArray[6]="7"
nameArray[7]="8"
nameArray[8]="9"
nameArray[9]="10"
nameArray[10]="11"
nameArray[11]="12"
nameArray[12]="13"
nameArray[13]="14"
nameArray[14]="15"
nameArray[15]="16"
nameArray[16]="17"
nameArray[17]="18"
nameArray[18]="19"
nameArray[19]="20"
nameArray[20]="21"
nameArray[21]="22"
nameArray[22]="23"
nameArray[23]="24"
nameArray[24]="25"
nameArray[25]="26"
nameArray[26]="27"
nameArray[27]="28"
nameArray[28]="29"
nameArray[29]="30"
nameArray[30]="31"
var dataArray2 = new Array()
dataArray2[0]="#ff0000,1,1,3,页面流量"
<%for j=1 to 27%>
dataArray2[<%=j%>]=<%=ip(j)%>
<%next%>
<%
select case mymonth
case 1,3,5,7,8,10,12
%>
<%for j=28 to 31%>
dataArray2[<%=j%>]=<%=ip(j)%>
<%next%>
<%
case 4,6,8,9,11
%>
<%for j=28 to 30%>
dataArray2[<%=j%>]=<%=ip(j)%>
<%next%>
<%
case 2
%>
dataArray2[28]=<%=ip(28)%>
<%end select%>
var total = new Array(nameArray,dataArray2)
table2(total,0,214,700,300,1);
</script>
</body>
</html>
