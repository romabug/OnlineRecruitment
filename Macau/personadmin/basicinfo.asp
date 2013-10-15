<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-个人求职管理--澳门劳工/澳门劳务/劳工招聘</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--#include file="top.asp"-->
<SCRIPT language=javascript src="inc/basicinfo.js"></SCRIPT>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="win2_update_table">
  <tr>
    <td height="22" class="win2_update_table_top">个人资料管理</td>
  </tr><form name="form1" method="post" action="basicinfo_save.asp" onSubmit="return Juge(this)">
  <tr>
    <td style="padding-top:5px;">
   
      <table width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr >
          <td height="22" colspan="4"   ><strong>&nbsp;个人资料</strong></td>
        </tr>
        <tr >
          <td width="15%" height="30" class="win2_update_table_td"><div align="right">姓名：</div></td>
          <td><input name="uname" type="text" class="input" id="uname" value="<%=rs("uname")%>" size="26">
                <font color="#FF0000">*</font></td>
          <td class="win2_update_table_td"><div align="right">性别：</div></td>
          <td><input name="sex" type="radio" value="1" <%if rs("sex")=true then%>checked<%end if%>>
            男
            <input type="radio" name="sex" value="0" <%if rs("sex")=false then%>checked<%end if%>>
            女</td>
        </tr>
        <tr>
          <td height="30" class="win2_update_table_td"><div align="right">出生日期：</div></td>
          <td width="37%"><input name="u_year" type="text" class="input" id="u_year" value="<%=rs("u_year")%>" size="4" maxlength="4">
            年
            <select name="u_month" class="input">
                  <option value="0" >选择</option>
                  <option value="1" <%if rs("u_month")=1 then%>selected<%end if%>>01</option>
                  <option value="2" <%if rs("u_month")=2 then%>selected<%end if%>>02</option>
                  <option value="3" <%if rs("u_month")=3 then%>selected<%end if%>>03</option>
                  <option value="4" <%if rs("u_month")=4 then%>selected<%end if%>>04</option>
                  <option value="5" <%if rs("u_month")=5 then%>selected<%end if%>>05</option>
                  <option value="6" <%if rs("u_month")=6 then%>selected<%end if%>>06</option>
                  <option value="7" <%if rs("u_month")=7 then%>selected<%end if%>>07</option>
                  <option value="8" <%if rs("u_month")=8 then%>selected<%end if%>>08</option>
                  <option value="9" <%if rs("u_month")=9 then%>selected<%end if%>>09</option>
                  <option value="10" <%if rs("u_month")=10 then%>selected<%end if%>>10</option>
                  <option value="11" <%if rs("u_month")=10 then%>selected<%end if%>>11</option>
                  <option value="12" <%if rs("u_month")=12 then%>selected<%end if%>>12</option>
                </select>
            月
            <select name="u_day" class="input">
              <option value="0" >选择</option>
              <option value="1" <%if rs("u_day")=1 then%>selected<%end if%>>01</option>
              <option value="2" <%if rs("u_day")=2 then%>selected<%end if%>>02</option>
              <option value="3" <%if rs("u_day")=3 then%>selected<%end if%>>03</option>
              <option value="4" <%if rs("u_day")=4 then%>selected<%end if%>>04</option>
              <option value="5" <%if rs("u_day")=5 then%>selected<%end if%>>05</option>
              <option value="6" <%if rs("u_day")=6 then%>selected<%end if%>>06</option>
              <option value="7" <%if rs("u_day")=7 then%>selected<%end if%>>07</option>
              <option value="8" <%if rs("u_day")=8 then%>selected<%end if%>>08</option>
              <option value="9" <%if rs("u_day")=9 then%>selected<%end if%>>09</option>
              <option value="10" <%if rs("u_day")=10 then%>selected<%end if%>>10</option>
              <option value="11" <%if rs("u_day")=11 then%>selected<%end if%>>11</option>
              <option value="12" <%if rs("u_day")=12 then%>selected<%end if%>>12</option>
              <option value="13" <%if rs("u_day")=13 then%>selected<%end if%>>13</option>
              <option value="14" <%if rs("u_day")=14 then%>selected<%end if%>>14</option>
              <option value="15" <%if rs("u_day")=15 then%>selected<%end if%>>15</option>
              <option value="16" <%if rs("u_day")=16 then%>selected<%end if%>>16</option>
              <option value="17" <%if rs("u_day")=17 then%>selected<%end if%>>17</option>
              <option value="18" <%if rs("u_day")=18 then%>selected<%end if%>>18</option>
              <option value="19" <%if rs("u_day")=19 then%>selected<%end if%>>19</option>
              <option value="20" <%if rs("u_day")=20 then%>selected<%end if%>>20</option>
              <option value="21" <%if rs("u_day")=21 then%>selected<%end if%>>21</option>
              <option value="22" <%if rs("u_day")=22 then%>selected<%end if%>>22</option>
              <option value="23" <%if rs("u_day")=23 then%>selected<%end if%>>23</option>
              <option value="24" <%if rs("u_day")=24 then%>selected<%end if%>>24</option>
              <option value="25" <%if rs("u_day")=25 then%>selected<%end if%>>25</option>
              <option value="26" <%if rs("u_day")=26 then%>selected<%end if%>>26</option>
              <option value="27" <%if rs("u_day")=27 then%>selected<%end if%>>27</option>
              <option value="28" <%if rs("u_day")=28 then%>selected<%end if%>>28</option>
              <option value="29" <%if rs("u_day")=29 then%>selected<%end if%>>29</option>
              <option value="30" <%if rs("u_day")=30 then%>selected<%end if%>>30</option>
              <option value="31" <%if rs("u_day")=31 then%>selected<%end if%>>31</option>
            </select>
            日<font color="#FF0000">*</font></td>
          <td width="13%" class="win2_update_table_td"><div align="right">民族：</div></td>
          <td width="35%"><select name="nation" class="input" id="nation">
            <option value="汉族" <%if rs("nation")="汉族" then%>selected<%end if%>>汉族</option>
            <option value="回族" <%if rs("nation")="回族" then%>selected<%end if%>>回族</option>
            <option value="蒙古族" <%if rs("nation")="蒙古族" then%>selected<%end if%>>蒙古族</option>
            <option value="满族" <%if rs("nation")="满族" then%>selected<%end if%>>满族</option>
            <option value="壮族" <%if rs("nation")="壮族" then%>selected<%end if%>>壮族</option>
            <option value="维吾尔族" <%if rs("nation")="维吾尔族" then%>selected<%end if%>>维吾尔族</option>
            <option value="藏族" <%if rs("nation")="藏族" then%>selected<%end if%>>藏族</option>
            <option value="朝鲜族" <%if rs("nation")="朝鲜族" then%>selected<%end if%>>朝鲜族</option>
            <option value="其它" <%if rs("nation")="其它" then%>selected<%end if%>>其它</option>
          </select></td>
        </tr>
        <tr >
          <td height="30" class="win2_update_table_td"><div align="right">证件类型：</div></td>
          <td><select name="cardtype" class="input">
            <option VALUE="身份证" <%if rs("cardtype")="身份证" then%>selected<%end if%>>身份证</option>
            <option VALUE="驾证" <%if rs("cardtype")="驾证" then%>selected<%end if%>>驾证</option>
            <option VALUE="军官证" <%if rs("cardtype")="军官证" then%>selected<%end if%>>军官证</option>
            <option VALUE="护照" <%if rs("cardtype")="护照" then%>selected<%end if%>>护照</option>
            <option VALUE="其它" <%if rs("cardtype")="其它" then%>selected<%end if%>>其它</option>
          </select></td>
          <td class="win2_update_table_td"><div align="right">证件号码：</div></td>
          <td><input name="cardno" type="text" class="input" value="<%=rs("cardno")%>" size="26">
                <font color="#FF0000">*</font></td>
        </tr>
        <tr>
          <td height="30" class="win2_update_table_td"><div align="right">婚姻状况：</div></td>
          <td><input name="marry" type="radio" value="1" <%if rs("marry")="1" then%>checked<%end if%>>
            未婚
            <input name="marry" type="radio" value="2" <%if rs("marry")="2" then%>checked<%end if%>>
            已婚
            <input name="marry" type="radio" value="3" <%if rs("marry")="3" then%>checked<%end if%>>
            离异
            <input name="marry" type="radio" value="4" <%if rs("marry")="4" then%>checked<%end if%>>
            保密</td>
          <td class="win2_update_table_td"><div align="right">身高：</div></td>
                  <td><font color="#FF0000"> 
                    <input name="height" type="text" class="input" value="<%=rs("height")%>" size="6">
                    </font>厘米(1.7米=170厘米 )<font color="#FF0000"> *</font></td>
        </tr>
        <tr>
          <td height="30" class="win2_update_table_td"><div align="right">籍贯：</div></td>
          <td colspan="3"><div align="left"> <font color="#000000">
            <select name="province" class="input" id="province" onChange="javascript:selectcitys(this, document.form1.citys)" >
              <option value="0">请选择</option>
              <option value="1" <%if rs("province")=1 then%>selected<%end if%>>北京</option>
              <option value="2" <%if rs("province")=2 then%>selected<%end if%>>天津</option>
              <option value="3" <%if rs("province")=3 then%>selected<%end if%>>上海</option>
              <option value="4" <%if rs("province")=4 then%>selected<%end if%>>重庆</option>
              <option value="5" <%if rs("province")=5 then%>selected<%end if%>>浙江</option>
              <option value="6" <%if rs("province")=6 then%>selected<%end if%>>广东</option>
              <option value="7" <%if rs("province")=7 then%>selected<%end if%>>江苏</option>
              <option value="8" <%if rs("province")=8 then%>selected<%end if%>>福建</option>
              <option value="9" <%if rs("province")=9 then%>selected<%end if%>>湖南</option>
              <option value="10" <%if rs("province")=10 then%>selected<%end if%>>湖北</option>
              <option value="11" <%if rs("province")=11 then%>selected<%end if%>>山东</option>
              <option value="12" <%if rs("province")=12 then%>selected<%end if%>>辽宁</option>
              <option value="13" <%if rs("province")=13 then%>selected<%end if%>>吉林</option>
              <option value="14" <%if rs("province")=14 then%>selected<%end if%>>云南</option>
              <option value="15" <%if rs("province")=15 then%>selected<%end if%>>四川</option>
              <option value="16" <%if rs("province")=16 then%>selected<%end if%>>安徽</option>
              <option value="17" <%if rs("province")=17 then%>selected<%end if%>>江西</option>
              <option value="18" <%if rs("province")=18 then%>selected<%end if%>>黑龙江</option>
              <option value="19" <%if rs("province")=19 then%>selected<%end if%>>河北</option>
              <option value="20" <%if rs("province")=20 then%>selected<%end if%>>陕西</option>
              <option value="21" <%if rs("province")=21 then%>selected<%end if%>>海南</option>
              <option value="22" <%if rs("province")=22 then%>selected<%end if%>>河南</option>
              <option value="23" <%if rs("province")=23 then%>selected<%end if%>>山西</option>
              <option value="24" <%if rs("province")=24 then%>selected<%end if%>>内蒙古</option>
              <option value="25" <%if rs("province")=25 then%>selected<%end if%>>广西</option>
              <option value="26" <%if rs("province")=26 then%>selected<%end if%>>贵州</option>
              <option value="27" <%if rs("province")=27 then%>selected<%end if%>>宁夏</option>
              <option value="28" <%if rs("province")=28 then%>selected<%end if%>>青海</option>
              <option value="29" <%if rs("province")=29 then%>selected<%end if%>>新疆</option>
              <option value="30" <%if rs("province")=30 then%>selected<%end if%>>西藏</option>
              <option value="31" <%if rs("province")=31 then%>selected<%end if%>>甘肃</option>
              <option value="32" <%if rs("province")=32 then%>selected<%end if%>>台湾</option>
              <option value="33" <%if rs("province")=33 then%>selected<%end if%>>香港</option>
              <option value="34" <%if rs("province")=34 then%>selected<%end if%>>澳门</option>
              <option value="35" <%if rs("province")=35 then%>selected<%end if%>>国外</option>
              <option value="36" <%if rs("province")=36 then%>selected<%end if%>>其他</option>
            </select>
            </font><font color="#FF0000"> </font><font color="#000000"><font color="#FF0000">
              <SELECT name="citys" class="input" id="select">
                <option value="<%=rs("citys")%>"><%=rs("citys")%></option>
              </SELECT>
            </font></font><font color="#FF0000"> </font></div></td>
        </tr>
      </table>
      <table width="98%" border="0" cellpadding="0" cellspacing="0">
        <tr >
          <td height="26" colspan="4" ><strong>&nbsp;联系方式</strong></td>
        </tr>
        <tr >
          <td width="15%" height="26" class="win2_update_table_td"><div align="right">电话：</div></td>
          <td width="40%"><input name="tel" type="text" class="input" value="<%=rs("tel")%>" size="20" maxlength="30">
                <font color="#FF0000">*</font></td>
          <td width="11%" class="win2_update_table_td"><div align="right">手机：</div></td>
          <td width="34%"><input name="mobile" type="text" class="input" value="<%=rs("mobile")%>" size="20" maxlength="30"></td>
        </tr>
        <tr>
          <td height="26" class="win2_update_table_td"><div align="right">聊天号码：</div></td>
          <td><input name="chatno" type="text" class="input" value="<%=rs("chatno")%>" size="20" maxlength="30">
            (QQ、ICQ、MSN等)</td>
          <td class="win2_update_table_td"><div align="right">主页、QQ相册、BLOG：</div></td>
          <td><input name="selfweb" type="text" class="input" value="<%=rs("selfweb")%>" size="25" maxlength="40"></td>
        </tr>
        <tr >
          <td height="26" class="win2_update_table_td"><div align="right">住址：</div></td>
          <td><input name="address" type="text" class="input" value="<%=rs("address")%>" size="25">
                <font color="#FF0000">*</font></td>
          <td class="win2_update_table_td"><div align="right">邮编：</div></td>
          <td><input name="zipcode" type="text" class="input" value="<%=rs("zipcode")%>" size="10" maxlength="6"></td>
        </tr>
      </table>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="60" align="center"><button accesskey="K" type="submit" onclick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> 确认发送</button>
          </td>
        </tr>
      </table>
    
    </td>
  </tr></form>
</table>
<br /></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%call closeconn()%>
