<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim jid,cid
jid=request.QueryString("jid")
cid=request.cookies("01387job")("cid")
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where cid='"&cid&"'" ,conn,1,1
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from [01387joblist] where jid='"&jid&"'" ,conn,1,1
if rs1("cid")<>cid then
response.redirect("login.asp")
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网-企业招聘管理</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。该网站整合了澳门雇主,劳工人才,澳门法规,劳工新闻等信息。并与澳门有资质的劳务公司合作,联盟国内各大职业学校,技恔,高校等人才机构。提供劳务咨询,劳务培训,劳务输出等一条龙服务" >
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT language=javascript src="inc/fajobs.js"></SCRIPT>
<body>
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
        <!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
        <table class='win_update_table' border='0' cellpadding='0' cellspacing='1'>
         <form name="form1" method="post" action="editjob_save.asp" onSubmit="return Juge(this)">
            <tr>
              <td colspan='4' class='win_update_table_top'>发布招聘职位</td>
            </tr>
            <tr>
              <td class='win_update_table_td2
2'>职位类别：</td>
              <td colspan="3"><select name="maincatelog" class="input" id="maincatelog" onChange="javascript:selectjob(this, document.form1.subcatelog)" >
                                  <option value="0" >请选择</option>
                                  <option value="1" <%if rs1("maincatelog")=1 then%>selected<%end if%>>饮食/餐厅/厨房</option>
                                  <option value="2" <%if rs1("maincatelog")=2 then%>selected<%end if%>>商店/超市/商场</option>
                                  <option value="3" <%if rs1("maincatelog")=3 then%>selected<%end if%>>博彩/酒店/旅游/服务</option>
                                  <option value="4" <%if rs1("maincatelog")=4 then%>selected<%end if%>>运输业/飞机场/物流</option>
                                  <option value="5" <%if rs1("maincatelog")=5 then%>selected<%end if%>>资讯科技/电脑/通讯</option>
                                  <option value="6" <%if rs1("maincatelog")=6 then%>selected<%end if%>>广告/媒体/出版/设计</option>
                                  <option value="7" <%if rs1("maincatelog")=7 then%>selected<%end if%>>水/电/气/空调/电梯</option>
                                  <option value="8" <%if rs1("maincatelog")=8 then%>selected<%end if%>>汽车维修/汽车美容</option>
                                  <option value="9" <%if rs1("maincatelog")=9 then%>selected<%end if%>>建筑/装修/杂工</option>
                                  <option value="10" <%if rs1("maincatelog")=10 then%>selected<%end if%>>保姆/家政/保安</option>
                                  <option value="11" <%if rs1("maincatelog")=11 then%>selected<%end if%>>理发/美容/按摩</option>
                                  <option value="12" <%if rs1("maincatelog")=12 then%>selected<%end if%>>演艺/模特/娱乐业</option>
                                  <option value="13" <%if rs1("maincatelog")=13 then%>selected<%end if%>>会展/公关/推广</option>
                                  <option value="14" <%if rs1("maincatelog")=14 then%>selected<%end if%>>工厂/制造业</option>
                                  <option value="15" <%if rs1("maincatelog")=15 then%>selected<%end if%>>园林/公园维护</option>
                                  <option value="16" <%if rs1("maincatelog")=16 then%>selected<%end if%>>进出口/贸易</option>
                                  <option value="17" <%if rs1("maincatelog")=17 then%>selected<%end if%>>外语/翻译/传译</option>
                                  <option value="18" <%if rs1("maincatelog")=18 then%>selected<%end if%>>金融/拍卖/保险</option>
                                  <option value="19" <%if rs1("maincatelog")=19 then%>selected<%end if%>>教育/培训</option>
                                  <option value="20" <%if rs1("maincatelog")=20 then%>selected<%end if%>>健美/护理/医疗</option>
                                  <option value="21" <%if rs1("maincatelog")=21 then%>selected<%end if%>>咨询/中介/法律</option>
                                  <option value="22" <%if rs1("maincatelog")=22 then%>selected<%end if%>>综合文职/行政</option>
                                  <option value="23" <%if rs1("maincatelog")=23 then%>selected<%end if%>>高级/综合管理</option>
                                  <option value="24" <%if rs1("maincatelog")=24 then%>selected<%end if%>>其它技术工种</option>
                                </select> <SELECT name="subcatelog" class="input" id="subcatelog">
                                  <option value="<%=rs1("subcatelog")%>"><%=rs1("subcatelog")%></option>
                                </SELECT> <font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>招聘职位：</td>
              <td><input name="jobname" class="input" value="<%=rs1("jobname")%>" style="font-size: 12px" size="30" maxlength="60"> <font color="#FF0000">*</font></td>
              <td  class="win_update_table_td2">招聘人数：</td>
              <td><input class="input" maxlength="5" size="6" value="<%=rs1("neednum")%>" name="neednum"> 
                人 <font color="#FF0000">*</font></td>
           </tr>
            <tr>
              <td class='win_update_table_td2
'>学<span class="win_update_table_td2"> &nbsp;&nbsp;</span>历：</td>
              <td><select name="degree" class="input" id="degree">
                                        <option value="0" <%if rs1("degree")=0 then%>selected<%end if%>>高中以下</option>
                                        <option value="1" <%if rs1("degree")=1 then%>selected<%end if%>>高中</option>
                                        <option value="2" <%if rs1("degree")=2 then%>selected<%end if%>>职高</option>
                                        <option value="3" <%if rs1("degree")=3 then%>selected<%end if%>>中专</option>
                                        <option value="4" <%if rs1("degree")=4 then%>selected<%end if%>>大专</option>
                                        <option value="5" <%if rs1("degree")=5 then%>selected<%end if%>>本科</option>
                                        <option value="6" <%if rs1("degree")=6 then%>selected<%end if%>>硕士</option>
                                        <option value="7" <%if rs1("degree")=7 then%>selected<%end if%>>博士</option>
                                      </select>
                                      及以上</td>
              <td class="win_update_table_td2">工作经验：</td>
              <td><select name="doneyear" class="input" id="doneyear">
                                        <option value="0" <%if rs1("doneyear")=0 then%>selected<%end if%>>应届毕业生</option>
                                        <option value="1" <%if rs1("doneyear")=1 then%>selected<%end if%>>1年</option>
                                        <option value="2" <%if rs1("doneyear")=2 then%>selected<%end if%>>2年</option>
                                        <option value="3" <%if rs1("doneyear")=3 then%>selected<%end if%>>3年</option>
                                        <option value="4" <%if rs1("doneyear")=4 then%>selected<%end if%>>4年</option>
                                        <option value="5" <%if rs1("doneyear")=5 then%>selected<%end if%>>5年</option>
                                        <option value="6" <%if rs1("doneyear")=6 then%>selected<%end if%>>6年</option>
                                        <option value="7" <%if rs1("doneyear")=7 then%>selected<%end if%>>7年</option>
                                        <option value="8" <%if rs1("doneyear")=8 then%>selected<%end if%>>8年</option>
                                        <option value="9" <%if rs1("doneyear")=9 then%>selected<%end if%>>9年</option>
                                        <option value="10" <%if rs1("doneyear")=10 then%>selected<%end if%>>10年</option>
                                      </select>
                                      及以上</td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>性<span class="win_update_table_td2"> &nbsp;&nbsp;</span>别：</td>
              <td><select name="sex" size="1" class="input">
                                        <option value="3" <%if rs1("sex")=3 then%>selected<%end if%>>不限</option>
                                        <option value="1" <%if rs1("sex")=1 then%>selected<%end if%>>男</option>
                                        <option value="2" <%if rs1("sex")=2 then%>selected<%end if%>>女</option>
                                      </select></td>
              <td class="win_update_table_td2">年 &nbsp;&nbsp; 龄：</td>
              <td><font color="#000000">
                <input name="needage" class="input"  value="<%=rs1("needage")%>" id="needage" size="10" />
              </font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2'>工作类型：</td>
              <td><select name="jobtype" size="1" class="input" id="jobtype">
                <option value="1" <%if rs1("jobtype")=1 then%>selected<%end if%>>全职</option>
                <option value="2" <%if rs1("jobtype")=2 then%>selected<%end if%>>兼职</option>
                                                                      </select></td>
              <td class="win_update_table_td2">工作地区：</td>
              <td><font color="#000000">
                <input name="jobcity" class="input" id="jobcity" value="<%=rs1("jobcity")%>" size="10" />
              如:澳门，氹仔</font><font color="#FF0000"> *</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>薪资待遇：</td>
              <td><input class="input" maxlength="5" size="6" name="Salary" value="<%=rs1("salary")%>">
                                <span class="p11">元/月</span> 默认&quot;0&quot;表示工资面议</td>
              <td class="win_update_table_td2">联系方法：</td>
              <td><input name="fangfa" type="radio" onClick="MM_showHideLayers('tip1','','show');MM_showHideLayers('tip2','','hide');MM_showHideLayers('tip3','','hide')" value="1" 
		<%if rs1("fangfa")=1 then%>checked="checked"<%end if%>	   />
电话联系
  <input onClick="MM_showHideLayers('tip1','','hide');MM_showHideLayers('tip2','','show');MM_showHideLayers('tip3','','hide')" type="radio" value="2" name="fangfa" <%if rs1("fangfa")=2 then%>checked="checked"<%end if%> />
通过网络<br />
<input onClick="MM_showHideLayers('tip1','','hide');MM_showHideLayers('tip2','','hide');MM_showHideLayers('tip3','','show')" type="radio" value="3" name="fangfa" <%if rs1("fangfa")=3 then%>checked="checked"<%end if%> />
单位面试<font color="#FF0000"> *</font>
<DIV id=tip1 style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; Z-INDEX: 1; FILTER: Alpha(Opacity=90,); LEFT: 810px; VISIBILITY: hidden; OVERFLOW:auto;POSITION: absolute; TOP: 350px; layer-background-color: #006666; font-line: 150%;WIDTH: 176px;  height:200px;"> 
  <TABLE width="96%" height="157" border=1 align="center">
    <TBODY>
  <TR>
        <TD height="151" bgColor=#e8e8e8>
		<table width="100%" height="61" align=center cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td height="18" style="line-height:140%;" >&nbsp;你发布的招聘信息选择了电话联系：<br>
                <b class="p11">优点：</b><br>
                应聘人员可以直接与相关负责人联系，使该招聘职位第一时间得到回复！<br>
                <b class="p11">建议：</b><br>
                急聘职位或招聘负责人不懂上网的请选择该项</td>
            </tr>
          </tbody>
        </table></TD>
</TR></TBODY></TABLE></DIV>
<DIV id=tip2 
style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; FONT-SIZE: 9pt; Z-INDEX: 2; FILTER: Alpha(Opacity=90,); LEFT: 810px; VISIBILITY: hidden; OVERFLOW: auto; BORDER-LEFT: #000000 1px; WIDTH: 176px; BORDER-BOTTOM: #000000 1px; POSITION: absolute; TOP: 350px; layer-background-color: #006666; font-line: 150%; height: 250px;"> 
  <TABLE width="100%" border=1 align="center">
    <TBODY>
      <TR> 
        <TD bgColor=#e8e8e8> <TABLE width="100%" align=center>
            <TBODY>
              <TR> 
                <TD style="line-height:140%;" >你发布的招聘信息选择了网络联系：<br>
                  <b class="p11">优点：</b><br>
                  应聘人员可以通过电子邮件或网站留言应聘的形式应聘你发布的职位，可通过邮件过滤部分不符合条件的应聘人员！<br><b class="p11">建议：</b><br>
                  非急聘职位或招聘负责人比较熟悉上网的请选择该项 </TD>
              </TR>
            </TBODY>
          </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
</DIV>
<DIV id=tip3 
style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; FONT-SIZE: 9pt; Z-INDEX: 3; FILTER: Alpha(Opacity=90,); LEFT: 810px; VISIBILITY: hidden; OVERFLOW: auto; BORDER-LEFT: #000000 1px; WIDTH: 173px; BORDER-BOTTOM: #000000 1px; POSITION: absolute; TOP: 350px; layer-background-color: #006666; font-line: 150%; height: 179px;"> 
  <TABLE width="100%" border=1 align="center">
    <TBODY>
      <TR> 
        <TD bgColor=#e8e8e8> <TABLE width="100%" height="68" align=center>
            <TBODY>
              <TR> 
                <TD style="line-height:140%;" >你发布的招聘信息选择了单位联系：<br><b class="p11">优点：</b><br>应聘人员可以直接到公司面试！<br><b class="p11">建议：</b><br>
                  急聘职位或招聘单位上网不方便的企业请选择该项 </TD>
              </TR>
            </TBODY>
          </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
</DIV></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>住房要求：</td>
              <td><select name="zhufang" size="1" id="select5">
                <option value="0" <%if rs1("zhufang")=0 then%>selected<%end if%>>面议协商</option>
                <option value="1" <%if rs1("zhufang")=1 then%>selected<%end if%>>提供住房</option>
                <option value="2" <%if rs1("zhufang")=3 then%>selected<%end if%>>自行解决</option>
                            </select>              </td>
              <td class="win_update_table_td2">截止招聘日期：</td>
              <td><%ye=year(rs1("overtime"))
			    Mo=Month(rs1("overtime"))
				da=day(rs1("overtime"))
			  %>
			  <select size="1" name="zpyear" style="font-size:9pt">
                    <option value="" >年</option>
					 <option value="2006" <%if ye="2006" then response.write "selected" end if%>>2006</option>
                    <option value="2007" <%if ye="2007" then response.write "selected" end if%>>2007</option>
                    <option value="2008" <%if ye="2008" then response.write "selected" end if%>>2008</option>
                </select>
                  <select size="1" name="zpmonth" style="font-size:9pt" onChange="javascript:dateselect()">
                    <option value="" >月</option>
                    <option value="1"  <%if mo="1" then response.write "selected" end if%>>01</option>
                    <option value="2"  <%if mo="2" then response.write "selected" end if%>>02</option>
                    <option value="3"  <%if mo="3" then response.write "selected" end if%>>03</option>
                    <option value="4"  <%if mo="4" then response.write "selected" end if%>>04</option>
                    <option value="5"  <%if mo="5" then response.write "selected" end if%>>05</option>
                    <option value="6"  <%if mo="6" then response.write "selected" end if%>>06</option>
                    <option value="7"  <%if mo="7" then response.write "selected" end if%>>07</option>
                    <option value="8"  <%if mo="8" then response.write "selected" end if%>>08</option>
                    <option value="9"  <%if mo="9" then response.write "selected" end if%>>09</option>
                    <option value="10" <%if mo="10" then response.write "selected" end if%>>10</option>
                    <option value="11" <%if mo="11" then response.write "selected" end if%>>11</option>
                    <option value="12" <%if mo="12" then response.write "selected" end if%>>12</option>
                  </select>

                  <select size="1" name="zpday"  style="font-size:9pt">
                    <option value="" selected>日</option>
                    <option value="1" <%if da="1" then response.write "selected" end if%>>1</option>
                    <option value="2" <%if da="2" then response.write "selected" end if%>>2</option>
                    <option value="3" <%if da="3" then response.write "selected" end if%>>3</option>
                    <option value="4" <%if da="4" then response.write "selected" end if%>>4</option>
                    <option value="5" <%if da="5" then response.write "selected" end if%>>5</option>
                    <option value="6" <%if da="6" then response.write "selected" end if%>>6</option>
                    <option value="7" <%if da="7" then response.write "selected" end if%>>7</option>
                    <option value="8" <%if da="8" then response.write "selected" end if%>>8</option>
                    <option value="9" <%if da="9" then response.write "selected" end if%>>9</option>
                    <option value="10" <%if da="10" then response.write "selected" end if%>>10</option>
                    <option value="11" <%if da="14" then response.write "selected" end if%>>11</option>
                    <option value="12" <%if da="12" then response.write "selected" end if%>>12</option>
                    <option value="13" <%if da="13" then response.write "selected" end if%>>13</option>
                    <option value="14" <%if da="14" then response.write "selected" end if%>>14</option>
                    <option value="15" <%if da="15" then response.write "selected" end if%>>15</option>
                    <option value="16" <%if da="16" then response.write "selected" end if%>>16</option>
                    <option value="17" <%if da="17" then response.write "selected" end if%>>17</option>
                    <option value="18" <%if da="18" then response.write "selected" end if%>>18</option>
                    <option value="19" <%if da="29" then response.write "selected" end if%>>19</option>
                    <option value="20" <%if da="20" then response.write "selected" end if%>>20</option>
                    <option value="21" <%if da="21" then response.write "selected" end if%>>21</option>
                    <option value="22" <%if da="22" then response.write "selected" end if%>>22</option>
                    <option value="23" <%if da="23" then response.write "selected" end if%>>23</option>
                    <option value="24" <%if da="24" then response.write "selected" end if%>>24</option>
                    <option value="25" <%if da="25" then response.write "selected" end if%>>25</option>
                    <option value="26" <%if da="26" then response.write "selected" end if%>>26</option>
                    <option value="27" <%if da="27" then response.write "selected" end if%>>27</option>
                    <option value="28" <%if da="28" then response.write "selected" end if%>>28</option>
                    <option value="29" <%if da="29" then response.write "selected" end if%>>29</option>
                    <option value="30" <%if da="30" then response.write "selected" end if%>>30</option>
                    <option value="31" <%if da="31" then response.write "selected" end if%>>31</option>
                  </select>
              <font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2'>具体要求：</td>
              <td colspan="3"> <textarea class="input" id="textarea" name="demand" rows="10" cols="76" style="font-size: 12px"><%=replace(replace(rs1("demand"),"&nbsp;",chr(32)),"<br>",chr(13))%></textarea> 
              <br />
              <font color="#333333">（言简意赅地阐述职位具体要求。<font color="#FF3300" class="p11">1000字以内</font>）</font><font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>面试须知：</td>
              <td colspan="3"><textarea  name="interview" cols="76" rows="3" class="input" id="interview" style="font-size: 12px"><% if rs1("interview")<>"" then response.Write(replace(replace(rs1("interview"),"&nbsp;",chr(32)),"<br>",chr(13)))%></textarea>
              <br />
              <font color="#666666"><font color="#333333">（例如：面试时请带好身份证原件、学历、学位证书原件，一寸相片3张。<font color="#FF3300" class="p11">500以内</font>）</font></font></td>
            </tr>
            <tr>
              <td height="25" align="center" class='win_update_table_td2'>当前状态：</td>
              <td height="19" colspan="3" ><input name="canshow" type="radio" value="ok" <%if rs1("canshow")="ok" then response.Write "checked=""checked""" end if%> />
                <strong><font color=#009900>开放</font></strong>
                  <input name="canshow" type="radio" value="no" <%if rs1("canshow")="no" then response.Write "checked=""checked""" end if%>  />
                  <strong><font color=#4088BA>关闭</font></strong></td>
            </tr>
            <tr>
              <td height="20" colspan="4" align="center" >&nbsp;<input name="jid" type="hidden" id="jid" value="<%=jid%>" />
              <button accesskey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> 确认修改 </button></td>
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
