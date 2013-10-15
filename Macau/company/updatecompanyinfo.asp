<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网-企业招聘管理</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="inc/updatecompanyinfo.js"></script>
<script language="JavaScript">
function writeTrade()
{
	with(document)
	{
		write("<option value='1' <%if rs("trade")=1 then%>selected<%end if%>>互联网、电子商务</option>");
		write("<option value='2' <%if rs("trade")=2 then%>selected<%end if%>>计算机业（软件、数据库、系统集成）</option>");
		write("<option value='3' <%if rs("trade")=3 then%>selected<%end if%>>计算机业（硬件、网络设备）</option>");
		write("<option value='4' <%if rs("trade")=4 then%>selected<%end if%>>电子、微电子技术</option>");
		write("<option value='5' <%if rs("trade")=5 then%>selected<%end if%>>通讯、电信业</option>");
		write("<option value='6' <%if rs("trade")=6 then%>selected<%end if%>>家电业</option>");
		write("<option value='7' <%if rs("trade")=7 then%>selected<%end if%>>批发零售(百货、超市、购物中心、专卖店…)</option>");
		write("<option value='8' <%if rs("trade")=8 then%>selected<%end if%>>贸易、商务、进出口</option>");
		write("<option value='9' <%if rs("trade")=9 then%>selected<%end if%>>电气</option>");
		write("<option value='10' <%if rs("trade")=10 then%>selected<%end if%>>电力、能源、矿产业</option>");
		write("<option value='11' <%if rs("trade")=11 then%>selected<%end if%>>石油、化工业</option>");
		write("<option value='12' <%if rs("trade")=12 then%>selected<%end if%>>生物工程、制药、环保</option>");
		write("<option value='13' <%if rs("trade")=13 then%>selected<%end if%>>机械制造、机电设备、重工业</option>");
		write("<option value='14' <%if rs("trade")=14 then%>selected<%end if%>>汽车、摩托车</option>");
		write("<option value='15' <%if rs("trade")=15 then%>selected<%end if%>>仪器仪表、电工设备</option>");
		write("<option value='16' <%if rs("trade")=16 then%>selected<%end if%>>广告、公关、设计</option>");
		write("<option value='17' <%if rs("trade")=17 then%>selected<%end if%>>艺术、文化传播、媒体、影视制作、新闻出版</option>");
		write("<option value='18' <%if rs("trade")=18 then%>selected<%end if%>>快速消费品（食品、饮料、粮油、化妆品、烟酒…）</option>");
		write("<option value='19' <%if rs("trade")=19 then%>selected<%end if%>>纺织品业（服饰、鞋类、家纺用品、皮具…）</option>");
		write("<option value='20' <%if rs("trade")=20 then%>selected<%end if%>>咨询业（顾问、会计师、审计师、法律）</option>");
		write("<option value='21' <%if rs("trade")=21 then%>selected<%end if%>>金融业（投资、保险、证券、银行、基金）</option>");
		write("<option value='22' <%if rs("trade")=22 then%>selected<%end if%>>建筑、房地产、物业管理、装潢</option>");
		write("<option value='23' <%if rs("trade")=23 then%>selected<%end if%>>运输、物流、快递</option>");
		write("<option value='24' <%if rs("trade")=24 then%>selected<%end if%>>旅游业、餐饮、娱乐、酒店</option>");
		write("<option value='25' <%if rs("trade")=25 then%>selected<%end if%>>办公设备、文化体育休闲用品、家居用品</option>");
		write("<option value='26' <%if rs("trade")=26 then%>selected<%end if%>>印刷、包装、造纸</option>");
		write("<option value='27' <%if rs("trade")=27 then%>selected<%end if%>>生产、制造、加工</option>");
		write("<option value='28' <%if rs("trade")=28 then%>selected<%end if%>>教育、培训、科研院所</option>");
		write("<option value='29' <%if rs("trade")=29 then%>selected<%end if%>>医疗、保健、卫生服务</option>");
		write("<option value='30' <%if rs("trade")=30 then%>selected<%end if%>>人才交流、中介</option>");
		write("<option value='31' <%if rs("trade")=31 then%>selected<%end if%>>协会、社团、政府公用事业、社区服务</option>");
		write("<option value='32' <%if rs("trade")=32 then%>selected<%end if%>>农、林、牧、副、渔业</option>");
		write("<option value='33' <%if rs("trade")=33 then%>selected<%end if%>>法律</option>");					//新增
		write("<option value='34' <%if rs("trade")=34 then%>selected<%end if%>>其他</option>");
	}	
}
function writeNature()
{
	with(document)
	{
		write("<option value='1' <%if rs("properity")=1 then%>selected<%end if%>>国有企业</option>");
		write("<option value='2' <%if rs("properity")=2 then%>selected<%end if%>>外资企业</option>");
		write("<option value='3' <%if rs("properity")=3 then%>selected<%end if%>>合资企业</option>");
		write("<option value='4' <%if rs("properity")=4 then%>selected<%end if%>>私营企业</option>");
		write("<option value='5' <%if rs("properity")=5 then%>selected<%end if%>>民营企业</option>");
		write("<option value='6' <%if rs("properity")=6 then%>selected<%end if%>>股份制企业</option>");
		write("<option value='7' <%if rs("properity")=7 then%>selected<%end if%>>集体企业</option>");
		write("<option value='8' <%if rs("properity")=8 then%>selected<%end if%>>集体事业</option>");
		write("<option value='9' <%if rs("properity")=9 then%>selected<%end if%>>乡镇企业</option>");
		write("<option value='10' <%if rs("properity")=10 then%>selected<%end if%>>行政机关</option>");
		write("<option value='11' <%if rs("properity")=11 then%>selected<%end if%>>社会团体</option>");
		write("<option value='12' <%if rs("properity")=12 then%>selected<%end if%>>事业单位</option>");
		write("<option value='13' <%if rs("properity")=13 then%>selected<%end if%>>跨国公司(集团)</option>");
		write("<option value='14' <%if rs("properity")=14 then%>selected<%end if%>>其他</option>");
	}	
}
</script>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
        <!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
        <table class='win_update_table' border='0' cellpadding='0' cellspacing='1'>
          <form action="updatecompanyinfo_save.asp" method="post" name="form1" id="form1" onSubmit="return Juge(this)">
            <tr>
              <td colspan='2' class='win_update_table_top'>基本资料修改</td>
            </tr>
            <tr>
              <td width="32%" class='win_update_table_td'>公司名称：</td>
              <td width="68%"><strong><%=rs("companyname")%> </strong><font color="#624B35">(要修改请<a href="../help"><font color="#FF3300">联系我们</font></a>)</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>营业执照：</td>
              <td><input name="licence" type="text" class="input" id="licence" value="<%=rs("licence")%>" size="38" maxlength="80" /></td>
            </tr>
            <tr>
              <td class='win_update_table_td'><span style="FONT-SIZE: 12px; FONT-FAMILY: 宋体">所属行业：</span></td>
              <td><select name="trade" size="1" class="input" id="trade" style="width: 240px; font-size: 12px; font-family: 宋体">
                  <script language="JavaScript" type="text/javascript">writeTrade()</script>
                </select>
                  <font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>公司性质：</td>
              <td><select name="properity" class="input" id="properity">
                  <script language="JavaScript" type="text/javascript">writeNature()</script>
                </select>
                  <font color="#FF0000"> *</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>成立日期：</td>
              <td><input name="u_year" type="text" class="input" id="u_year" value="<%=rs("u_year")%>" size="5" />
                年
                <select name="u_month" class="input">
                  <option value="" >选择</option>
                  <option value="1" <%if rs("u_month")=1 then%>selected<%end if%>>01</option>
                  <option value="2" <%if rs("u_month")=2 then%>selected<%end if%> >02</option>
                  <option value="3" <%if rs("u_month")=3 then%>selected<%end if%> >03</option>
                  <option value="4" <%if rs("u_month")=4 then%>selected<%end if%> >04</option>
                  <option value="5" <%if rs("u_month")=5 then%>selected<%end if%> >05</option>
                  <option value="6" <%if rs("u_month")=6 then%>selected<%end if%> >06</option>
                  <option value="7" <%if rs("u_month")=7 then%>selected<%end if%> >07</option>
                  <option value="8" <%if rs("u_month")=8 then%>selected<%end if%> >08</option>
                  <option value="9" <%if rs("u_month")=9 then%>selected<%end if%> >09</option>
                  <option value="10" <%if rs("u_month")=10 then%>selected<%end if%> >10</option>
                  <option value="11" <%if rs("u_month")=11 then%>selected<%end if%> >11</option>
                  <option value="12" <%if rs("u_month")=12 then%>selected<%end if%> >12</option>
                </select>
                月
                <select name="u_day" class="input">
                  <option value="" >选择</option>
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
                日<font color="#FF0000"> *</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>注册资金：</td>
              <td><input name="fund" type="text" class="input" id="fund" value="<%=rs("fund")%>" size="10" />
                万元<font color="#FF0000"> *</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>员工人数：</td>
              <td><input type="radio" value="少于50人" name="employee" <%if rs("employee")="少于50人" then%>checked<%end if%> />
                少于<b>50</b>人
                <input type="radio" value="50-200人" name="employee" <%if rs("employee")="50-200人" then%>checked<%end if%> />
                <b>50-200</b>人
                <input type="radio" value="200-500人" name="employee" <%if rs("employee")="200-500人" then%>checked<%end if%> />
                <b>200-500</b>人
                <input type="radio" value="500-1000人" name="employee" <%if rs("employee")="500-1000人" then%>checked<%end if%> />
                <b>500-1000</b>人
                <input type="radio" value="1000人以上" name="employee" <%if rs("employee")="1000人以上" then%>checked<%end if%> />
                <b>1000</b>人以上 <font color="#FF0000">*</font><font color="#624B35">&nbsp;</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>法人代表：</td>
              <td><input name="legal" type="text" class="input" id="legal" value="<%=rs("legal")%>" size="30" maxlength="80" />
                  <font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td'>公司简介：</td>
              <td><br />
                <textarea name="intro" cols="70" rows="11" class="input" id="intro"><%=replace(replace(rs("intro"),"&nbsp;",chr(32)),"<br>",chr(13))%></textarea>
                <font color="#FF0000">*</font>( 最大字符数5000,请尽可能详细填写资料，以确保贵公司资料顺利通过本网审核！)</td>
            </tr>
            <tr>
              <td height="40" colspan="2" align="center" ><button accesskey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> 确认修改 </button></td>
            </tr>
          </form>
        </table>
      <br /></td>
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
