<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call RsName(rs,"select situation,mytype,width,height,img,url,show,id,adsitu from [01387AdvLogo] where situation=1 order by id desc",1,1)
Call RsName(rs1,"select situation,mytype,width,height,img,url,show,id,adsitu from [01387AdvLogo] where situation=2 order by id desc",1,1)
Call RsName(rs2,"select situation,mytype,width,height,img,url,show,id from [01387AdvLogo] where situation=3 order by id desc",1,1)
Call RsName(rs3,"select situation,mytype,width,height,img,url,show,id,picname from [01387AdvLogo] where situation=4 order by id desc",1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.1 {
	font-size: 12px;
	border: 1px solid #0066CC;
}
-->
</style>
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<script language="JavaScript">
function confirmdel(id){
  if (confirm("确定要删除吗?")) 
  window.location.href="Adver_Del.asp?id="+id+""
} 
</script>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
<form name="form1" method="post" action="Adver_Add.asp">
  <tr> 
    <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">新增 
          网站首页广告</font></strong></div></td>
  </tr>
  <tr bgcolor="#f1f3f5"> 
    <td width="31%" height="26"><div align="right">广告位置：</div></td>
    <td width="69%"><input type="radio" name="situation" value="1">
        顶部广告 
        <input type="radio" name="situation" value="2">
        中间横幅广告 
        <input type="radio" name="situation" value="3">
        右侧名企招聘
        <input type="radio" name="situation" value="4">
        职位列表上方</td>
  </tr>
  <tr bgcolor="#f1f3f5"> 
    <td height="26" colspan="2"><div align="center">
          <input name="Submit" type="submit" style="width=130;height=30;font-size=12px" value="下 一 步">
      </div></td>
  </tr></form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr> 
    <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">网站首页广告</font></strong></div></td>
  </tr>
  <tr bgcolor="#D5DBEE"> 
    <td height="26" bgcolor="#D5DBEE"><div align="right">顶部广告：</div></td>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="12">
        <%do while not rs.eof%>
        <tr> 
          <td height="70"> <%if rs(1)=1 then%><a href="<%=rs(5)%>&id=<%=rs(7)%>" target="_blank"><img src="../ad/<%=rs(4)%>" width="468" height="60" border="0"></a>&nbsp;&nbsp;<%if rs(8)=1 then response.Write("<首页顶部>") else response.write("<内页顶部>")%>
            <%else%> <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="468" height="60">
              <param name="movie" value="../ad/<%=rs(4)%>">
              <param name="quality" value="high">
              <embed src="../ad/<%=rs(4)%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="468" height="60"></embed></object>&nbsp;&nbsp;<%if rs(8)=1 then response.Write("<首页顶部>") else response.write("<内页顶部>")%>
            <%end if%> </td>
          <td width="11%"><div align="right">
              <%if rs(6)=false then%>
              <a href="Adver_Open.asp?action=open&id=<%=rs(7)%>"><font color="#339900"><strong>开启</strong></font></a>
              <%else%>
              <a href="Adver_Open.asp?action=close&id=<%=rs(7)%>"><strong><font color="#FF0000">关闭</font></strong></a>
              <%end if%>
            </div></td>
          <td width="6%"><div align="right"><a href='javascript:confirmdel(<%=rs(7)%>)'><font color="#FF0000"><strong>删除</strong></font></a></div></td>
        </tr>
        <%rs.movenext
	      loop%>
      </table></td>
  </tr>
  <tr bgcolor="#f1f3f5"> 
    <td height="26" bgcolor="#f1f3f5"><div align="right">中间横幅广告：</div></td>
    <td> <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="12">
        <%do while not rs1.eof%>
        <tr> 
          <td height="87"> <%if rs1(1)=1 then%> <a href="<%=rs1(5)%>&id=<%=rs1(7)%>" target="_blank"><img src="../ad/<%=rs1(4)%>" width="622" height="74" border="0"></a>&nbsp;&nbsp;
		  <%select case rs1(8)
		  case 1
		  response.Write("<横幅上方>")
		  case 2
		  response.write("<横幅中间>")
		  case 3
		  response.write("<横幅下方>")
		  end select%> 
            <%else%><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="622" height="74">
              <param name="movie" value="../ad/<%=rs1(4)%>">
              <param name="quality" value="high">
              <embed src="../ad/<%=rs1(4)%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="622" height="74"></embed></object> 
            <%select case rs1(8)
		  case 1
		  response.Write("<横幅上方>")
		  case 2
		  response.write("<横幅中间>")
		  case 3
		  response.write("<横幅下方>")
		  end select%>
			<%end if%></td>
          <td width="11%"><div align="right">
              <%if rs1(6)=false then%>
              <a href="Adver_Open.asp?action=open&id=<%=rs1(7)%>"><font color="#339900"><strong>开启</strong></font></a>
              <%else%>
              <a href="Adver_Open.asp?action=close&id=<%=rs1(7)%>"><strong><font color="#FF0000">关闭</font></strong></a>
              <%end if%>
            </div></td>
          <td width="6%"><div align="right"><a href='javascript:confirmdel(<%=rs1(7)%>)'><font color="#FF0000"><strong>删除</strong></font></a></div></td>
        </tr>
        <%rs1.movenext
	loop%>
      </table></td>
  </tr><tr bgcolor="#D5DBEE">
  <td width="12%" height="26"><div align="right">右侧名企招聘：</div></td><td width="88%">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <%
		  i=1
		  do while not rs2.eof%>
      <td><table width="25%" border="0" align="center" cellpadding="0" cellspacing="0" class="12">
          <tr> 
            <td height="50" colspan="2"><div align="center"> 
                <%if rs2(1)=1 then%>
                <a href="<%=rs2(5)%>&id=<%=rs2(7)%>" target="_blank"><img src="../ad/<%=rs2(4)%>" width="150" height="40" border="0"></a> 
                <%else%>
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="150" height="40">
                  <param name="movie" value="../ad/<%=rs2(4)%>">
                  <param name="quality" value="high">
                  <embed src="../ad/<%=rs2(4)%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="150" height="40"></embed></object>
                <%end if%>
              </div></td>
          </tr>
          <tr> 
            <td height="26"><div align="center">
                <%if rs2(6)=false then%>
                <a href="Adver_Open.asp?action=open&id=<%=rs2(7)%>"><font color="#339900"><strong>开启</strong></font></a>
                <%else%>
                <a href="Adver_Open.asp?action=close&id=<%=rs2(7)%>"><strong><font color="#FF0000">关闭</font></strong></a>
                <%end if%>
              </div></td>
            <td><div align="center"><a href='javascript:confirmdel(<%=rs2(7)%>)'><font color="#FF0000"><strong>删除</strong></font></a></div></td>
          </tr>
        </table>
        <%if i mod 4=0 then%></tr><tr>
      <%end if%></td>
    <%
			i=i+1
			rs2.movenext
			loop%></tr>
  </table></td></tr>
  <tr bgcolor="#f1f3f5"> 
    <td height="26"><div align="right">招聘列表上方：</div></td>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
		<%do while not rs3.eof%>
          <td>
		  <table width="166" border="0" align="center" cellpadding="0" cellspacing="0" class="1">
              <tr> 
                <td height="124" bgcolor="#FFFFFF"><div align="center"><a href="<%=rs3(5)%>&id=<%=rs3(7)%>" target="_blank"><img src="../ad/<%=rs3(4)%>" width="163" height="113" border="0"></a></div></td>
              </tr>
              <tr> 
                <td height="26" bgcolor="#FFFAF7"><div align="center"><%=rs3(8)%></div></td>
              </tr>
              <tr> 
                <td height="26" bgcolor="#F0F8FF"><div align="center">
                    <%if rs3(6)=false then%>
                    <a href="Adver_Open.asp?action=open&id=<%=rs3(7)%>"><font color="#339900"><strong>开启</strong></font></a> 
                    <%else%>
                    <a href="Adver_Open.asp?action=close&id=<%=rs3(7)%>"><strong><font color="#FF0000">关闭</font></strong></a> 
                    <%end if%>&nbsp;&nbsp;<a href='javascript:confirmdel(<%=rs3(7)%>)'><font color="#FF0000"><strong>删除</strong></font></a>
                  </div></td>
              </tr>
            </table>
			</td>
		<%rs3.movenext
		loop%>	
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call footer()
call CloseRs()
rs1.close
set rs1=nothing
rs2.close
set rs2=nothing
rs3.close
set rs3=nothing
call CloseConn()
%>
</body>
</html>