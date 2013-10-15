<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select uname,regtime from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-个人求职管理</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="win2_update_table">
          <tr>
            <td height="22" class="win2_update_table_top"><span class="win3_update_table_top">职位搜索</span></td>
          </tr>
          <form action="personsearch_OK.asp" method="post" name="form1" id="form1">
            <tr>
              <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#ffffff" bordercolordark="#FF6633">
                  <tr>
                    <td width="113" height="25" align="right" class="win2_update_table_td4">公司名称：</td>
                    <td width="385" bgcolor="#FFFFFF">&nbsp;
                        <input name="Companyname" id="Companyname" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体" size="35" 
maxlength="20" />
                    </td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">单位性质：</td>
                    <td width="385" bgcolor="#FFFFFF">&nbsp;
                        <select name="Properity"  id="Properity" >
                          <option value="" selected="selected">不限</option>
                          <option value="1">国有企业</option>
                          <option value="2">外资企业</option>
                          <option value="3" >合资企业</option>
                          <option value="4" >私营企业</option>
                          <option value="5">民营企业</option>
                          <option value="6">股份制企业</option>
                          <option value="7" >集体企业</option>
                          <option value="8">集体事业</option>
                          <option value="9">乡镇企业</option>
                          <option value="10">行政机关</option>
                          <option value="11">社会团体</option>
                          <option value="12" >事业单位</option>
                          <option value="13" >跨国公司(集团)</option>
                        </select>
                    </td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">职位名称：</td>
                    <td bgcolor="#FFFFFF">&nbsp;
                        <input id="Jobname" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体" maxlength="20" 
name="Jobname" />
                        <font color="#FF0000">*</font></td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">所学专业：</td>
                    <td bgcolor="#FFFFFF">&nbsp;
                        <input id="Spec1" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体" maxlength="20" 
name="Spec1" /></td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">薪水：<br />
                    </td>
                    <td width="385" bgcolor="#FFFFFF">&nbsp;
                        <input name="Salary" type="text" id="Salary" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体" maxlength="20" /></td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">选择工作岗位类型：</td>
                    <td width="385" bgcolor="#FFFFFF">&nbsp;
                        <select id="list2" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体" 
name="list2">
                          <option value="" selected="selected" >不限</option>
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
                      </select></td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">要求性别：</td>
                    <td width="385" bgcolor="#FFFFFF">&nbsp;
                        <select style="FONT-SIZE: 12px; FONT-FAMILY: 宋体" 
size="1" name="sex">
                          <option value="" selected="selected">不限 </option>
                          <option value="1">男 </option>
                          <option 
value="2">女</option>
                        </select>
                    </td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">要求学历：</td>
                    <td width="385" bgcolor="#FFFFFF">&nbsp;
                        <select name="Degree" 
size="1" id="Degree" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体">
                          <option value="0" >高中以下</option>
                          <option value="1" selected="selected" >高中</option>
                          <option value="2" >职高</option>
                          <option value="3" >中专</option>
                          <option value="4" >大专</option>
                          <option value="5" >本科</option>
                          <option value="6" >硕士</option>
                          <option value="7" >博士</option>
                          <option value="" selected="selected">不限</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">招聘类别：</td>
                    <td bgcolor="#FFFFFF">&nbsp;
                        <select 
name="Jobtype" size="1" id="Jobtype" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体">
                          <option value="1">全职</option>
                          <option value="0">兼职</option>
                          <option 
value="" selected="selected">不限</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">工作经验：</td>
                    <td bgcolor="#FFFFFF">&nbsp;
                        <input 
onkeypress="if (event.keyCode &lt; 48 || event.keyCode &gt; 57) event.returnValue = false;" 
id="Doneyear" style="FONT-SIZE: 12px; IME-MODE: disabled; FONT-FAMILY: 宋体" 
maxlength="2" size="3" name="Doneyear" />
                      年 </td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">选择发布时间：</td>
                    <td bgcolor="#FFFFFF">&nbsp;
                        <select name="publisttime" size="1" id="publisttime" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体">
                          <option value="7">一周内</option>
                          <option value="15">半个月内</option>
                          <option 
value="30">一个月内</option>
                          <option value="60">二个月内</option>
                          <option 
value="90">三个月内</option>
                          <option value="180">半年内</option>
                          <option value="" selected="selected">不限</option>
                      </select></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td height="30" colspan="2" align="middle"><div align="center">
                        <input type="submit" name="Submit" value="职位搜索" />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="reset" name="Submit" value="重置" />
                    </div></td>
                  </tr>
                </table></td>
            </tr>
          </form>
    </table></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
Call CloseRs()
Call CloseConn()
%>
