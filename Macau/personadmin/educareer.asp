<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-个人求职管理--澳门劳工/澳门劳务/劳工招聘</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<script language=javascript>
function Juge(theForm)
{
  edu_career=theForm.edu_career.value;
  if (edu_career == "")
  {
    alert("培训与教育经历!");
    theForm.edu_career.focus();
    return (false);
  }
  if (edu_career.length>1000)
  {
  alert("培训与教育经历不能超过1000字！");
  theForm.edu_career.focus();
  return (false);
  }
 }
</script>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table border="0" cellpadding="0" cellspacing="0" class="win2_update_table">
  <tr>
    <td height="22" class="win2_update_table_top">教育培训</td>
  </tr><form name="form1" method="post" action="educareer_save.asp" onSubmit="return Juge(this)">
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr >
          <td width="104" height="32" class="win2_update_table_td"><div align="right">最高学历：</div></td>
          <td><select name="degree" class="input" id="degree">
            <option value="0" <%if rs("degree")=0 then%>selected<%end if%>>高中以下</option>
            <option value="1" <%if rs("degree")=1 then%>selected<%end if%>>高中</option>
            <option value="2" <%if rs("degree")=2 then%>selected<%end if%>>职高</option>
            <option value="3" <%if rs("degree")=3 then%>selected<%end if%>>中专</option>
            <option value="4" <%if rs("degree")=4 then%>selected<%end if%>>大专</option>
            <option value="5" <%if rs("degree")=5 then%>selected<%end if%>>本科</option>
            <option value="6" <%if rs("degree")=6 then%>selected<%end if%>>硕士</option>
            <option value="7" <%if rs("degree")=7 then%>selected<%end if%>>博士</option>
          </select></td>
          <td class="win2_update_table_td"><div align="right">毕业院校：</div></td>
          <td><input name="college" type="text" class="input" id="college" value="<%=rs("college")%>" size="26">
          </td>
        </tr>
        <tr>
          <td height="32" class="win2_update_table_td"><div align="right">主修专业：</div></td>
          <td><input name="spec1" type="text" class="input" id="spec1" value="<%=rs("spec1")%>" size="26">
          </td>
          <td class="win2_update_table_td"><div align="right">第二专业：</div></td>
          <td><input name="spec2" type="text" class="input" id="spec2" value="<%=rs("spec2")%>" size="26"></td>
        </tr>
        <tr bgcolor="#FFFAF0">
          <td height="32" class="win2_update_table_td"><div align="right">计算机水平：</div></td>
          <td><select name="com_level" class="input">
            <option value="计算机能力一般" <%if rs("com_level")="计算机能力一般" then%>selected<%end if%>>计算机能力一般</option>
            <option value="办公类软件熟练" <%if rs("com_level")="办公类软件熟练" then%>selected<%end if%>>办公类软件熟练</option>
            <option value="熟练使用财务软件" <%if rs("com_level")="熟练使用财务软件" then%>selected<%end if%>>熟练使用财务软件</option>
            <option value="熟练收发邮件和排版" <%if rs("com_level")="熟练收发邮件和排版" then%>selected<%end if%>>熟练收发邮件和排版</option>
            <option value="软件|网络|办公|硬件" <%if rs("com_level")="软件|网络|办公|硬件" then%>selected<%end if%>>熟悉计算机网络</option>
            <option value="精通电脑软件" <%if rs("com_level")="精通电脑软件" then%>selected<%end if%>>精通电脑软件</option>
            <option value="精通电脑硬件" <%if rs("com_level")="精通电脑硬件" then%>selected<%end if%>>精通电脑硬件</option>
            <option value="精通软件硬件" <%if rs("com_level")="精通软件硬件" then%>selected<%end if%>>精通软件硬件</option>
            <option value="计算机编程单机" <%if rs("com_level")="计算机编程单机" then%>selected<%end if%>>计算机编程单机</option>
            <option value="初步INTERNET编程" <%if rs("com_level")="初步INTERNET编程" then%>selected<%end if%>>初步INTERNET编程</option>
            <option value="精通INTERNET编程" <%if rs("com_level")="精通INTERNET编程" then%>selected<%end if%>>精通INTERNET编程</option>
            <option value="无实际的应用能力" <%if rs("com_level")="无实际的应用能力" then%>selected<%end if%>>无实际的应用能力</option>
          </select></td>
          <td class="win2_update_table_td"><div align="right">政治面貌：</div></td>
          <td><select name="zzmm" class="input" id="zzmm">
            <option value="群众" <%if rs("zzmm")="群众" then%>selected<%end if%>>群众</option>
            <option value="中共党员" <%if rs("zzmm")="中共党员" then%>selected<%end if%>>中共党员</option>
            <option value="共青团员" <%if rs("zzmm")="共青团员" then%>selected<%end if%>>共青团员</option>
            <option value="民主党派" <%if rs("zzmm")="民主党派" then%>selected<%end if%>>民主党派</option>
            <option value="其它" <%if rs("zzmm")="其它" then%>selected<%end if%>>其它</option>
          </select></td>
        </tr>
        <tr>
          <td height="32" class="win2_update_table_td"><div align="right">第一外语：</div></td>
          <td width="186"><input name="l_type1" type="text" class="input" value="<%=rs("l_type1")%>" size="26"></td>
          <td width="107" class="win2_update_table_td"><div align="right">粤语水平：</div></td>
          <td width="191"><select name="l_level1" class="input" id="l_level1">
            <option value="初级" <%if rs("l_level1")="初级" then%>selected<%end if%>>初级</option>
            <option value="一般" <%if rs("l_level1")="一般" then%>selected<%end if%>>一般</option>
            <option value="良好" <%if rs("l_level1")="良好" then%>selected<%end if%>>良好</option>
            <option value="熟练" <%if rs("l_level1")="熟练" then%>selected<%end if%>>熟练</option>
          </select></td>
        </tr>
        <tr bgcolor="#FFFAF0">
          <td height="32" class="win2_update_table_td"><div align="right">第二外语：</div></td>
          <td><input name="l_type2" type="text" class="input" id="l_type2" value="<%=rs("l_type2")%>" size="26"></td>
          <td class="win2_update_table_td"><div align="right">英语水平：</div></td>
          <td><select name="l_level2" class="input" id="l_level2">
            <option value="初级" <%if rs("l_level2")="初级" then%>selected<%end if%>>初级</option>
            <option value="一般" <%if rs("l_level2")="一般" then%>selected<%end if%>>一般</option>
            <option value="良好" <%if rs("l_level2")="良好" then%>selected<%end if%>>良好</option>
            <option value="熟练" <%if rs("l_level2")="熟练" then%>selected<%end if%>>熟练</option>
          </select></td>
        </tr>
        <tr>
          <td height="32" class="win2_update_table_td"><div align="right">所获证书：</div></td>
          <td colspan="3"><input name="certificate" type="text" class="input" id="certificate" value="<%=rs("certificate")%>" size="44">
            (会计证、律师证、某某设计师认证等)</td>
        </tr>
        <tr>
          <td height="150" bgcolor="#FFFAF0" class="win2_update_table_td"><div align="right">培训与教育经历：</div></td>
          <td colspan="3" bgcolor="#FFFAF0"> 
          年　　月 至 年月　 　　学校／培训机构名称　　　专业／科目名称　　　获得何种证书
                          <br />
          <textarea name="edu_career" cols="70" rows="7" class="input" id="edu_career"><%if rs("edu_career")<>"" then response.Write(replace(replace(rs("edu_career"),"&nbsp;",chr(32)),"<br>",chr(13)))%>
</textarea>
            <font color="#FF0000"> *</font>(1000字以内)</td></tr>
      </table>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" align="center"><button accesskey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> 确认发送</button>
          </td>
        </tr>
      </table>
    </td>
  </tr></form>
</table></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
