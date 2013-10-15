<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->

<% 
Dim SQL,Rs
Dim JobClass,Area,PublishDate,Key,KeyClass
Dim JobId,Comid,JobName,Work_Area,Work_City,Edus,Deal,LastUpdate_Time

If IsArray(Session("Company")) Then
 Companyid = Session("Company")(2)
End if

'//获取参数
JobClass        = Replace_Text(Request("slt_subcategory")) '意向职位类别
AreaWill        = Replace_Text(Request("slt_workplacecity")) '意向工作地区
Industry	    = Replace_Text(Request("Industry"))
Edus            = Replace_Text(Request("Edus"))
Works           = Replace_Text(Request("Works"))
Sex             = Replace_Text(Request("Sex"))
MinAge          = Replace_Text(Request("Min_Age"))
MaxAge          = Replace_Text(Request("Max_Age"))
PublishDate     = Replace_Text(Request("PublishDate"))
Key             = Replace_Text(Request("Key"))
Work 		    = Replace(AreaWill,"-","")

'Response.write AreaWill
'Response.End()

'//组织查询参数
SQL = "Select I.Perid,I.RealName,I.Sex,I.Edus,I.LastSchool,I.Speciality,I.WorkWill1,B.LastUpdate_Time,i.Photourl,i.ResumeKeep From pH_Person_Base As B,pH_Person_Info As I  Where B.Perid=I.Perid And Len(I.RealName)>0 And (I.ResumeKeep=0 or (i.ResumeKeep=2 And i.Perid Not in (Select Perid From [pH_Person_Keeps] Where Perid=i.Perid And Comid='"&Companyid&"'))) And B.Flag=1 And (I.WorkWill1 Like '%"&Key&"%' or I.WorkWill2 Like '%"&Key&"%' or I.WorkWill3 Like '%"&Key&"%' or I.RealName Like '%"&Key&"%')"

'//职位类别
If JobClass <> "0-0" Then
 SQL = SQL&" And (I.WorkWillClass1 Like '%"&JobClass&"%' or I.WorkWillClass2 Like '%"&JobClass&"%' or I.WorkWillClass3 Like '%"&JobClass&"%')"
End if

'//意向工作地区
If AreaWill <> "不限-不限" Then
 SQL = SQL&" And (I.AreaWill1 Like '%"&Work&"%' or I.AreaWill2 Like '%"&Work&"%' or I.AreaWill3 Like '%"&Work&"%')"
End if
'行业类别
If Industry <> "0" Then
 SQL = SQL& " And i.Industry="&Industry
End if
'//学历
If Edus <> "0" Then
 SQL = SQL&" And I.Edus>="&Cstr(Edus)
End if
'//工作经验
If Works <> "0" Then
 SQL = SQL&" And I.Works>="&Cstr(Works)
End if
'//性别
If Sex <> "2" Then
 SQL = SQL&" And I.Sex="&Cstr(Sex)
End if
'//年龄
If MinAge <> "0" And MaxAge <> "0" Then
 SQL = SQL&" And I.Age<="&Cstr(MinAge)&" And I.Age>="&Cstr(MaxAge)
Elseif MinAge <> "0" And MaxAge = "0" Then
 SQL = SQL&" And I.Age<="&Cstr(MinAge)
Elseif MinAge = "0" And MaxAge <> "0" Then
 SQL = SQL&" And I.Age>="&Cstr(MaxAge)
End if
'更新日期
If PublishDate <> "0" Then
 SQL = SQL& " And DateDiff(d,B.LastUpdate_Time,Getdate())<"&PublishDate
End if

'//设置排序的方式
SQL = SQL&" Order By B.LastUpdate_Time Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open SQL,Conn,1,1
Rs.Pagesize = 20
Psize       = Rs.PageSize
PCount      = Rs.PageCount
RCount      = Rs.RecordCount

PageNo = Cint(Request.QueryString("PageNo"))
If PageNo < 1 Then
 PageNo = 1
Elseif PageNo > PCount Then
 PageNo = PCount
End if
If Not Rs.Eof Then Rs.AbsolutePage = PageNo

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/Company_Basicinfo.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> - 简历搜索 - 快速搜索</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<SCRIPT language=JavaScript>
<!--
function showoperatealert(id)
{
		if (id==2)
        {

		{
		  	thisForm.target='_blank';
			thisForm.action="../Person/Resume/Resume_List.asp";
			thisForm.submit();
		}
		}
}

function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'chkall' )
       e.checked = form.chkall.checked;
    }
  }
//-->

</SCRIPT>

</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Header/Company_Search.asp" --></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <form name=thisForm action="" method=POST>
 
 <tr>
    <td align="center">
<table width="950" border="0" cellspacing="0" cellpadding="4">
        <tr> 
          <td width="50%" height="25">共<Font color="#FF0000"><%= RCount %></Font>条 分<Font color="#FF0000"><%= PCount %></Font>页 | 当前第<Font color="#FF0000"><%= PageNo %></Font>页</td>
          <td width="50%" align="right">
		  <% 
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&slt_subcategory="&JobClass&"&slt_workplacecity="&AreaWill&"&Edus="&Edus&"&Works="&Works&"&Sex="&Sex&"&Min_Age="&MinAge&"&Max_Age="&MaxAge&"&Industry="&Industry&"&PublishDate="&PublishDate&"&Key="&Key&""">首页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&slt_subcategory="&JobClass&"&slt_workplacecity="&AreaWill&"&Edus="&Edus&"&Works="&Works&"&Sex="&Sex&"&Min_Age="&MinAge&"&Max_Age="&MaxAge&"&Industry="&Industry&"&PublishDate="&PublishDate&"&Key="&Key&""">上页</a>&nbsp;"    
		  Else
		   Response.write "首页&nbsp;"
		   Response.write "上页&nbsp;" 
		  End if
		   %>
           <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:40px;">
		    <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>&slt_subcategory=<%= WorkWillClass %>&slt_workplacecity=<%= AreaWill %>&Edus=<%= Edus %>&Works=<%= Works %>&Sex=<%= Sex %>&Min_Age=<%= MinAge %>&Max_Age=<%= MaxAge %>&Industry=<%= Industry %>&PublishDate=<%= PublishDate %>&Key=<%= Key %>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
		    <% Next %>
           </select>
            <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&slt_subcategory="&JobClass&"&slt_workplacecity="&AreaWill&"&Edus="&Edus&"&Works="&Works&"&Sex="&Sex&"&Min_Age="&MinAge&"&Max_Age="&MaxAge&"&Industry="&Industry&"&PublishDate="&PublishDate&"&Key="&Key&""">下页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&slt_subcategory="&JobClass&"&slt_workplacecity="&AreaWill&"&Edus="&Edus&"&Works="&Works&"&Sex="&Sex&"&Min_Age="&MinAge&"&Max_Age="&MaxAge&"&Industry="&Industry&"&PublishDate="&PublishDate&"&Key="&Key&""">尾页</a>"   
		  Else
		   Response.write "下页&nbsp;"
		   Response.write "尾页" 
		  End if
		   %>

		  
		  </td>
        </tr>
      </table>
        <table width="950" border="0" align="center" cellpadding="2" cellspacing="1">
          <tr align="center" bgcolor="#4273B2"> 
            <td width="11%" height="25" bgcolor="#4273B2"><font color="#FFFFFF"><strong>姓 
              名</strong></font></td>
            <td width="6%" height="25" bgcolor="#4273B2"><font color="#FFFFFF"><strong>性别</strong></font></td>
            <td width="7%" bgcolor="#4273B2"><font color="#FFFFFF"><strong>学历</strong></font></td>
            <td width="20%" height="25"><font color="#FFFFFF"><strong>毕业学校</strong></font></td>
            <td width="20%" height="25" bgcolor="#4273B2"><font color="#FFFFFF"><strong>所学专业</strong></font></td>
            <td width="20%" height="25" bgcolor="#4273B2"><font color="#FFFFFF"><strong>求职意向</strong></font></td>
            <td height="25"><font color="#FFFFFF"><strong>发布日期</strong></font></td>
            <td width="5%"><font color="#FFFFFF"><strong>选择</strong></font></td>
          </tr>
<% 
For i = 1 to Psize
 If Rs.Eof Then Exit For
 Perid = Rs("Perid")
 ResumeKeep = Rs("ResumeKeep")
 RealName = Rs("RealName")
 Sex = Rs("Sex")
 Edus = Rs("Edus")
 LastSchool = Rs("LastSchool")
 Speciality = Rs("Speciality")
 WorkWill1 = "--"
 If Rs("WorkWill1") <> "" Then WorkWill1 =  Rs("WorkWill1")
 LastUpdate_Time = FormatDateTime(Rs("LastUpdate_Time"),2)
 Photourl = Rs("Photourl")
 
 Img_str = ""
 If Photourl <> "" Then Img_Str = "<img src=../Images/img.gif width=13 height=13 align=absmiddle>"
 %>
          <tr <% if i mod 2 = 0 Then %>bgcolor="#f1f1f1"<% End if %>> 
            <td height="25" align="center"><a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a> <%= Img_str %></td>
            <td height="25" align="center"><%= Cls_Sex(Sex) %></td>
            <td height="25" align="center"><%= Cls_Edus(Edus) %></td>
            <td height="25" align="left"><%= LastSchool %></td>
            <td height="25" align="left"><%= Speciality %></td>
            <td height="25" align="left"><%= WorkWill1 %></td>
            <td height="25" align="center"><%= LastUpdate_Time %></td>
            <td height="25" align="center"><input type=checkbox value="<%=Perid%>" name=perid></td>
          </tr>
          <% 
 Rs.Movenext 
Next
 %>
        </table>
      <table width="950" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="40%" height="25">共<Font color="#FF0000"><%= RCount %></Font>条 分<Font color="#FF0000"><%= PCount %></Font>页 | 当前第<Font color="#FF0000"><%= PageNo %></Font>页</td>
            <td width="60%" align="right"> <% 
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&Param="&Param&""">首页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&Param="&Param&""">上页</a>&nbsp;"    
		  Else
		   Response.write "首页&nbsp;"
		   Response.write "上页&nbsp;" 
		  End if
		   %> <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:40px;">
                <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>&Param=<%= Param %>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
                <% Next %>
              </select> <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&Param="&Param&""">下页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&Param="&Param&""">尾页</a>"   
		  Else
		   Response.write "下页&nbsp;"
		   Response.write "尾页" 
		  End if
		   %>
            </td>
          </tr>
          <tr>
            <td height="25"><input onClick=CheckAll(this.form) type=checkbox value=on name=chkall>
              全选</td>
            <td align="right"><input type="button" name="Submit2" value=" 查看简历 " onClick=javascript:showoperatealert(2)></td>
          </tr>
        </table>
</td>
  </tr>
</form>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td>
      <!--#include file="../Include/Footer.asp" -->
    </td>
  </tr>
</table>

</body>
</html>
<% 
Rs.Close
Set Rs = Nothing
Call CloseDB
 %>
