<!--#include file="../conn.asp"-->  
 
<%
'set rs=server.createobject("adodb.recordset")
'rs.open "select * from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<link href="../css/01387.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT language=javascript src="inc/fajobs.js"></SCRIPT>
<body>
<div align="center"> <strong> <font color="#0000FF"> <span class="news10">
  <%
set rs2=server.createobject("adodb.recordset")
rs2.open "select  companyname from [01387company] where cid='"&request.cookies("01387job")("cid")&"'  " ,conn,1,1
%>
  发布的是 <%=rs2("companyname")%> 公司的职位 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Quick_reg.asp">###登记新公司####</a></span></font></strong></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="55" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
      
    </td>
    <td width="730" valign="top" style="BORDER-left: #9DB3C5 1px solid;"> 
        <table class='win_update_table' border='0' cellpadding='0' cellspacing='1'>
         <form name="form1" method="post" action="quick_jobsave.asp" onSubmit="return Juge(this)">
            <tr>
              
            <td colspan='4' class='win_update_table_top'>发布招聘职位<strong><font color="#0000FF"><span class="news10"> 
              cid 是 
              <%  response.Write(request.cookies("01387job")("cid") )   %>
              <%
rs2.close
set rs2=nothing
conn.close
set conn=nothing
%>
              </span></font></strong></td>
            </tr>
            <tr>
              
            <td class='win_update_table_td2
2'>职位类别： </td>
              <td colspan="3"><select name="maincatelog" class="input" id="maincatelog" onChange="javascript:selectjob(this, document.form1.subcatelog)" >
                                  <option value="0" selected >请选择</option>
                                  <option value="1" >饮食/餐厅/厨房</option>
                                  <option value="2" >商店/超市/商场</option>
                                  <option value="3" >博彩/酒店/旅游/服务</option>
                                  <option value="4" >运输业/飞机场/物流</option>
                                  <option value="5" >资讯科技/电脑/通讯</option>
                                  <option value="6" >广告/媒体/出版/设计</option>
                                  <option value="7" >水/电/气/空调/电梯</option>
                                  <option value="8" >汽车维修/汽车美容</option>
                                  <option value="9" >建筑/装修/杂工</option>
                                  <option value="10" >保姆/家政/保安</option>
                                  <option value="11" >理发/美容/按摩</option>
                                  <option value="12" >演艺/模特/娱乐业</option>
                                  <option value="13" >会展/公关/推广</option>
                                  <option value="14" >工厂/制造业</option>
                                  <option value="15" >园林/公园维护</option>
                                  <option value="16" >进出口/贸易</option>
                                  <option value="17" >外语/翻译/传译</option>
                                  <option value="18" >金融/拍卖/保险</option>
                                  <option value="19" >教育/培训</option>
                                  <option value="20" >健美/护理/医疗</option>
                                  <option value="21" >咨询/中介/法律</option>
                                  <option value="22" >综合文职/行政</option>
                                  <option value="23" >高级/综合管理</option>
                                  <option value="24" >其它技术工种</option>
                                </select> <SELECT name="subcatelog" class="input" id="subcatelog">
              </SELECT>
              <font color="#FF0000">* </font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>招聘职位：</td>
              <td><input name="jobname" class="input" style="font-size: 12px" value="" size="30" maxlength="60"> <font color="#FF0000">*</font></td>
              <td  class="win_update_table_td2">招聘人数：</td>
              <td><input class="input" maxlength="5" size="6" name="neednum"> 
                人 <font color="#FF0000">*</font></td>
           </tr>
            <tr>
              <td class='win_update_table_td2
'>学<span class="win_update_table_td2"> &nbsp;&nbsp;</span>历：</td>
              
            <td> <select name="degree" class="input" id="degree">
                <option value="0" >高中以下</option>
                <option value="1" >高中</option>
                <option value="2" >职高</option>
                <option value="3" selected="selected" >中专</option>
                <option value="4" >大专</option>
                <option value="5" >本科</option>
                <option value="6" >硕士</option>
                <option value="7" >博士</option>
              </select>
              或以上</td>
              <td class="win_update_table_td2">工作经验：</td>
              <td><select name="doneyear" class="input" id="doneyear">
                                        <option value="0">应届毕业生</option>
                                        <script language="javascript">
										for(var i=1;i<=10;i++)
										{
										document.write("<option value="+i+">"+i+"年</option>");
										}
										</script>
                                      </select>
              或以上</td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>性<span class="win_update_table_td2"> &nbsp;&nbsp;</span>别：</td>
              <td><select name="sex" size="1" class="input">
                                        <option selected value="3">不限</option>
                                        <option value="1" >男</option>
                                        <option value="2" >女</option>
                                      </select></td>
              <td class="win_update_table_td2">年 &nbsp;&nbsp; 龄：</td>
              <td><font color="#000000">
                <input name="needage" class="input" id="needage" value="不限" size="10" />
              </font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2'>工作类型：</td>
              <td><select name="jobtype" size="1" class="input" id="jobtype">
                <option value="1">全职</option>
                <option value="2">兼职</option>
                                                                      </select></td>
              <td class="win_update_table_td2">工作地区：</td>
              <td><font color="#000000">
                <input name="jobcity" class="input" id="jobcity" value="澳门" size="10" />
              如:澳门，氹仔</font><font color="#FF0000"> *</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>薪资待遇：</td>
              <td><input class="input" value="0" maxlength="5" size="6" name="Salary">
                                <span class="p11">元/月</span> 默认&quot;0&quot;表示工资面议</td>
              <td class="win_update_table_td2">联系方法：</td>
              <td><input onClick="MM_showHideLayers('tip1','','show');MM_showHideLayers('tip2','','hide');MM_showHideLayers('tip3','','hide')" type="radio" value="1" name="fangfa" />
电话联系
  <input onClick="MM_showHideLayers('tip1','','hide');MM_showHideLayers('tip2','','show');MM_showHideLayers('tip3','','hide')" type="radio" value="2" name="fangfa" />
通过网络<br />
<input name="fangfa" type="radio" onClick="MM_showHideLayers('tip1','','hide');MM_showHideLayers('tip2','','hide');MM_showHideLayers('tip3','','show')" value="3" checked="checked" />
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
                <option value="0">面议协商</option>
                <option value="1">提供住房</option>
                <option value="2">自行解决</option>
                            </select>
              </td>
              <td class="win_update_table_td2">截止招聘日期：</td>
              <td><select size="1" name="zpyear" style="font-size:9pt">
                    <option value="">年</option>
					   <option value="2008" >2008</option>
                    <option value="2009" selected="selected">2009</option>
					 <option value="2010">2010</option>
					  <option value="2011">2011</option>
                      <option value="2012">2012</option>
                </select>
                  <select size="1" name="zpmonth" style="font-size:9pt" onChange="javascript:dateselect()">
                    <option value="" selected>月</option>
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                  </select>

                  <select size="1" name="zpday"  style="font-size:9pt">
                    <option value="" selected>日</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10" >10</option>
                    <option value="11" >11</option>
                    <option value="12" >12</option>
                    <option value="13" >13</option>
                    <option value="14" >14</option>
                    <option value="15" >15</option>
                    <option value="16" >16</option>
                    <option value="17" >17</option>
                    <option value="18" >18</option>
                    <option value="19" >19</option>
                    <option value="20" >20</option>
                    <option value="21" >21</option>
                    <option value="22" >22</option>
                    <option value="23" >23</option>
                    <option value="24" >24</option>
                    <option value="25" >25</option>
                    <option value="26" >26</option>
                    <option value="27" >27</option>
                    <option value="28" >28</option>
                    <option value="29" >29</option>
                    <option value="30" >30</option>
                    <option value="31" >31</option>
                  </select>
              <font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>具体要求：</td>
              <td colspan="3"><textarea class="input" id="textarea" name="demand" rows="10" cols="76" style="font-size: 12px">


若有意向，请先电话联系。</textarea>
              <br />
              <font color="#333333">（言简意赅地阐述职位具体要求。<font color="#FF3300" class="p11">1000字以内</font>）</font><font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>面试须知：</td>
              <td colspan="3"><textarea  name="interview" cols="76" rows="3" class="input" id="interview" style="font-size: 12px"></textarea>
              <br />
              <font color="#666666"><font color="#333333">（例如：面试时请带好身份证原件、学历、学位证书原件，一寸相片3张。<font color="#FF3300" class="p11">500以内</font>）</font></font></td>
            </tr>
            <tr>
              <td height="40" colspan="4" align="center" ><button accesskey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> 
              继续发布职位</button></td>
            </tr>
          </form>
        </table>
      <br /></td>
  </tr>
</table>

</body>
</html>
<%
'rs.close
'set rs=nothing
'conn.close
'set conn=nothing
%>
