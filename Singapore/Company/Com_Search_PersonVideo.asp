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

SQL = "Select I.Perid,I.RealName,I.Sex,I.Edus,I.Age,I.LastSchool,I.Speciality,I.ResumeMode,I.WorkWill1,B.LastUpdate_Time,i.Photourl,i.ResumeKeep From pH_Person_Base As B,pH_Person_Info As I  Where B.Perid=I.Perid And Len(I.RealName)>0 And (I.ResumeKeep=0 or (i.ResumeKeep=2 And i.Perid Not in (Select Perid From [pH_Person_Keeps] Where Perid=i.Perid And Comid='"&Companyid&"'))) And B.Flag=1 And Nc_Video=1 And DateDiff(d,Video_Date,GetDate())>=0 And DateDiff(d,Video_EndDate,GetDate())<=0 Order By B.LastUpdate_Time Desc"

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
<title><%= Cls_WebName %> - ��Ƶ����</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Header/Company_PersonVideo.asp" --></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td align="center">
<table width="950" border="0" cellspacing="0" cellpadding="4">
        <tr> 
          <td width="50%" height="25">��<Font color="#FF0000"><%= RCount %></Font>�� ��<Font color="#FF0000"><%= PCount %></Font>ҳ | ��ǰ��<Font color="#FF0000"><%= PageNo %></Font>ҳ</td>
          <td width="50%" align="right">
		  <% 
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1"">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&""">��ҳ</a>&nbsp;"    
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "��ҳ&nbsp;" 
		  End if
		   %>
           <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:40px;">
		    <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
		    <% Next %>
           </select>
            <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&""">βҳ</a>"   
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "βҳ" 
		  End if
		   %>

		  
		  </td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="2" cellspacing="1">
        <tr align="center" bgcolor="#4273B2"> 
          <td width="11%" height="25" bgcolor="#4273B2"><strong><font color="#FFFFFF">�� 
            ��</font></strong></td>
          <td width="6%" height="25" bgcolor="#4273B2"><strong><font color="#FFFFFF">�Ա�</font></strong></td>
          <td width="7%"><strong><font color="#FFFFFF">ѧ��</font></strong></td>
          <td width="20%" height="25"><strong><font color="#FFFFFF">��ҵѧУ</font></strong></td>
          <td width="20%" height="25" bgcolor="#4273B2"><strong><font color="#FFFFFF">��ѧרҵ</font></strong></td>
          <td width="20%" height="25" bgcolor="#4273B2"><strong><font color="#FFFFFF">��ְ����</font></strong></td>
          <td height="25"><strong><font color="#FFFFFF">��������</font></strong></td>
          <td width="5%"><strong><font color="#FFFFFF">����</font></strong></td>
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
          <td height="25" align="center"><a href="../Person/Per_VideoView.asp?Perid=<%= Perid %>" target="_blank"><img src="../Images/video2.gif" width="14" height="16" border="0"></a></td>
        </tr>
        <% 
 Rs.Movenext
Next
 %>
      </table>
      <table width="950" border="0" cellspacing="0" cellpadding="4">
        <tr> 
          <td width="50%" height="25">��<Font color="#FF0000"><%= RCount %></Font>�� ��<Font color="#FF0000"><%= PCount %></Font>ҳ | ��ǰ��<Font color="#FF0000"><%= PageNo %></Font>ҳ</td>
          <td width="50%" align="right">
		  <% 
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1"">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&""">��ҳ</a>&nbsp;"    
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "��ҳ&nbsp;" 
		  End if
		   %>
           <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:40px;">
		    <% For i = 1 to PCount %>
                <option value="?PageNo=<%= i %>" <% If i = PageNo Then Response.write "Selected"%>><%=i%></option>
		    <% Next %>
           </select>
            <% 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&""">βҳ</a>"   
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "βҳ" 
		  End if
		   %>

		  
		  </td>
        </tr>
      </table>
</td>
  </tr>
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
