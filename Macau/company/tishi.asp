<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网-企业招聘管理</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;"><!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<table width="82%" height="69" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" style="padding:5px;margin-left:25px;margin-top:15px;" >
  <tr>
          <td bgcolor="#FFFFFF" style="line-height:170%; background:#F2F2F2"><p>· 
              貴公司目前為<font color="#FF0000">免費會員</font>狀態，免費會員可以:<br />
              1. 發佈企業資訊，勞工招聘資訊。<br />
              2. 可以收到勞工投遞的簡歷。<br />
              3. 可以查看收到簡歷的聯繫方式。</p>
            <p>· 但部分招聘功能的使用有所限制，如：只能流覽人才庫裏部分簡歷資料，不能線上管理投遞的簡歷資訊,等等。<br />
              · 若想享受更多、更便捷的服務？ 
              <%Call RsName(rsy,"select * from [01387Feedback] where cid='"&request.cookies("01387job")("cid")&"' order by id desc",1,1)
				%>
              <a href="CompanyReg.asp"><font color="#FF0000"><u>可馬上升級為正式會員>>></u></font></a></p>
            <p>客服熱線：400-6756-269  <br />
              QQ：601652392<br />
              MSN：macau-69@hotmail.com<br />
              郵 箱：service@macau69.com<br />
            </p>
            </a></td>
  </tr>
</table></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
