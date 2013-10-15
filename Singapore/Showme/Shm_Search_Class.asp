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
JobClass           = Replace_Text(Request("Param"))

'//组织查询参数
SQL = "Select I.Perid,I.RealName,I.Sex,I.Edus,I.Age,I.LastSchool,I.Speciality,I.ResumeMode,I.WorkWill1,B.LastUpdate_Time,i.Photourl,i.ResumeKeep,B.Nc_Best_Ads From pH_Person_Base As B,pH_Person_Info As I  Where B.Perid=I.Perid And Len(I.RealName)>0 And (I.ResumeKeep=0 or (i.ResumeKeep=2 And i.Perid Not in (Select Perid From [pH_Person_Keeps] Where Perid=i.Perid And Comid='"&Companyid&"'))) And B.Flag=1 And B.Nc_Best_Flag=1 And DateDiff(d,Nc_Best_Date,Getdate())>=0 And DateDiff(d,Nc_Best_EndDate,Getdate())<=0"

'//职位类别
If JobClass <> "" Then
 SQL = SQL&" And (I.WorkWillClass1 Like '%"&JobClass&"%' or I.WorkWillClass2 Like '%"&JobClass&"%' or I.WorkWillClass3 Like '%"&JobClass&"%')"
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
<title><%= Cls_WebName %> -- 人才自荐分类搜索</title>
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
    <td><!--#include file="../Header/Company_Showme.asp" --></td>
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
		   Response.write "<a href=""?PageNo=1&Param="&JobClass&""">首页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&Param="&JobClass&""">上页</a>&nbsp;"    
		  Else
		   Response.write "首页&nbsp;"
		   Response.write "上页&nbsp;" 
		  End if
		   %>
           <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:40px;">
		    <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>&Param=<%= JobClass %>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
		    <% Next %>
           </select>
            <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&Param="&JobClass&""">下页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&Param="&JobClass&""">尾页</a>"   
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
            <td width="7%"><font color="#FFFFFF"><strong>学历</strong></font></td>
            <td width="24%" height="25" bgcolor="#4273B2"><font color="#FFFFFF"><strong>求职意向</strong></font></td>
            <td width="34%" height="25"><font color="#FFFFFF"><strong>自荐广告词&nbsp;</strong></font></td>
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
 Age = Rs("Age")
 LastSchool = Rs("LastSchool")
 Speciality = Rs("Speciality")
 ResumeMode = Rs("ResumeMode")
 WorkWill1 = Rs("WorkWill1")
 LastUpdate_Time = FormatDateTime(Rs("LastUpdate_Time"),2)
 Photourl = Rs("Photourl")
 Best_Ads = Left(Rs("Nc_Best_Ads"),20)
 Img_str = ""
 If Photourl <> "" Then Img_Str = "<img src=../Images/img.gif width=13 height=13 align=absmiddle>"

 %>
          <tr <% If i mod 2 = 0 Then %>bgcolor="#f1f1f1" <% End if %>> 
            <td height="25" align="center"><a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a> <%= Img_str %></td>
            <td height="25" align="center"><%= Cls_Sex(Sex) %></td>
            <td height="25" align="center"><%= Cls_Edus(Edus) %></td>
            <td height="25" align="left"><%= WorkWill1 %></td>
            <td height="25" align="left"><%= Best_Ads %></td>
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
            <td width="60%" align="right"> 
              <% 
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&Param="&JobClass&""">首页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&Param="&JobClass&""">上页</a>&nbsp;"    
		  Else
		   Response.write "首页&nbsp;"
		   Response.write "上页&nbsp;" 
		  End if
		   %>
           <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:40px;">
		    <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>&Param=<%= JobClass %>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
		    <% Next %>
           </select>
            <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&Param="&JobClass&""">下页</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&Param="&JobClass&""">尾页</a>"   
		  Else
		   Response.write "下页&nbsp;"
		   Response.write "尾页" 
		  End if
		   %>
              <input type="button" name="Submit2" value=" 查看简历 " onClick=javascript:showoperatealert(2)> 
              <input onClick=CheckAll(this.form) type=checkbox value=on name=chkall>
              选中所有简历
		  
		  </td>
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
