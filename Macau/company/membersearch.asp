<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select companyname,regtime from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"' order by id desc" ,conn,1,1
set rs1=server.createobject("adodb.recordset")
rs1.open "select uid,degree,birthday,sex,doneyear,subcatelog2,lastlogin,uname from [01387member] where resumestatus='open' and jobtype=2 order by lastlogin desc,id desc" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网-企业招聘管理</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。该网站整合了澳门雇主,劳工人才,澳门法规,劳工新闻等信息。并与澳门有资质的劳务公司合作,联盟国内各大职业学校,技恔,高校等人才机构。提供劳务咨询,劳务培训,劳务输出等一条龙服务" >
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<!--#include file="inc/page20.inc"-->
<script language=jscript>
function CheckOthers(form)
{
    for (var i=0;i<form.elements.length;i++)
    {
        var e = form.elements[i];
            if (e.checked==false)
            {
                e.checked = true;
            }
            else
            {
                e.checked = false;
            }
    }
}

function CheckAll(form)
{
    for (var i=0;i<form.elements.length;i++)
    {
        var e = form.elements[i];
            e.checked = true;
    }
}
function doSubmit(form1,btnClicked)
{
	if (btnClicked.name=="btnShow")
		{form1.action="jianli.asp";form1.submit();}
	else
		{form1.action="Favoadd.asp";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
        <!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<br />
<table border="0" cellpadding="0" cellspacing="1" class='win_update_table'>
  <tr>
    <td class='win_update_table_top' colspan="2">模糊搜索</td>
  </tr>
 <form action="member_search_ok.asp" method="post"  name="form1" id="form1">
        <tr>
          <td height="30" align="right" bgcolor="#FBF8F4"  class='win_update_table_td'>关键字：</td>
          <td height="30"  bgcolor="#FFFFFF" >&nbsp;
                <input id="Keywords" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体" maxlength="20" 
name="Keywords" />&nbsp;
                <input type="submit" name="Submit2222" value=" 模糊搜索 " /></td>
          </tr>
      </form>
</table>
<table border="0" cellpadding="0" cellspacing="1" class='win_update_table'>
  <tr>
    <td colSpan=2  class='win_update_table_top'>高级搜索引擎</td>
  </tr>
<form  name="form1" action=member_search_ok.asp method=post>
            <TR>
              <TD width="23%" align=right class='win_update_table_td'>工作岗位类型：</TD>
              <TD align="left" bgcolor="#FFFFFF">&nbsp;
                  <select id=MainCateLog style="FONT-SIZE: 12px; FONT-FAMILY: 宋体" name=MainCateLog>
                    <option value="" selected >不限</option>
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
              </select></TD>
            </TR>
            <TR>
              <TD align=right class='win_update_table_td'>欲求职位名称：</TD>
              <TD height="20" align="left" bgcolor="#FFFFFF">&nbsp;
                  <input id=Jobname style="FONT-SIZE: 12px; FONT-FAMILY: 宋体" maxlength=20 
name=Jobname>
                (保留空为不限)</TD>
            </TR>
            <TR>
              <TD align=right class='win_update_table_td'>工作经验：</TD>
              <TD height="20" align="left" bgcolor="#FFFFFF">&nbsp;
                  <input 
onKeyPress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;" 
id=Doneyear style="FONT-SIZE: 12px; IME-MODE: disabled; FONT-FAMILY: 宋体" 
maxlength=2 size=3 name=Doneyear>
                年 (保留空为不限) </TD>
            </TR>
            <TR>
              <TD height=22 align=right bgcolor="#FBF8F4" class='win_update_table_td'> 要求薪水：<BR>
              </TD>
              <TD width=77% height="20" align="left" bgcolor="#FFFFFF">&nbsp;
                  <select name="salary" id="select2">
                    <option value="0" selected >面议</option>
                    <option value="1" >3000以下</option>
                    <option value="2" >3000-4000</option>
                    <option value="3" >4000-5000</option>
                    <option value="4" >5000-7000</option>
                    <option value="5" >7000以上</option>

                </select></TD>
            </TR>
            <TR>
              <TD height=30 align=right class='win_update_table_td'><span class="style2">性别：</span></TD>
              <TD width=77% height=20 align="left" bgcolor="#FFFFFF">&nbsp;
                  <SELECT name=sex size=1 id="select3" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体">
                    <OPTION value="" selected>不限</OPTION>
                    <OPTION value="1">男</OPTION>
                    <OPTION value="0">女</OPTION>
                </SELECT>
              </TD>
            </TR>
            <TR>
              <TD height=30 align=right class='win_update_table_td'><span class="style2">学历：</span></TD>
              <TD width=77% height=20 align="left" bgcolor="#FFFFFF">&nbsp;
                  <SELECT name=Degree 
size=1 id="select4" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体">
                    <option value="0" >高中以下</option>
                    <option value="1" >高中</option>
                    <option value="2" >职高</option>
                    <option value="3" >中专</option>
                    <option value="4" >大专</option>
                    <option value="5" >本科</option>
                    <option value="6" >硕士</option>
                    <option value="7" >博士</option>
                    <OPTION value="" selected>不限</OPTION>
                </SELECT></TD>
            </TR>
            <TR>
              <TD align=right class='win_update_table_td'><span class="style2">身高：</span></TD>
              <TD height=20 align="left" bgcolor="#FFFFFF">&nbsp;
                  <input name="height1" type="text" id="height1" style="FONT-SIZE: 12px; FONT-FAMILY:宋体" size=5 maxlength="3">
                CM&nbsp;至
                <input name="height2" type="text" id="height2" style="FONT-SIZE: 12px; FONT-FAMILY:宋体" size=5 maxlength="3">
                CM (保留空为不限)</TD>
            </TR>
            <TR>
              <TD align=right class='win_update_table_td'><span class="style2">年龄：</span></TD>
              <TD align="left" bgcolor="#FFFFFF">&nbsp;
                  <input name="Birthday1" type="text" id="Birthday1" style="FONT-SIZE: 12px; FONT-FAMILY:宋体" size=5 maxlength="2">
                岁&nbsp;至
                <input name="Birthday2" type="text" id="Birthday2" style="FONT-SIZE: 12px; FONT-FAMILY:宋体" size=5 maxlength="2">
              岁 (保留空为不限)</TD>
            </TR>
            <TR>
              <TD align=right class='win_update_table_td'><span class="style2"> 全职/兼职：</span></TD>
              <TD height=20 align="left" bgcolor="#FFFFFF">&nbsp;
                  <SELECT name=Jobtype 
size=1 id="select9" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体">
                    <OPTION value="" selected>都可以 
                    <OPTION value="1">全职 
                    <OPTION 
value="2">兼职</OPTION>
                </SELECT>
              </TD>
            </TR>
            <TR>
              <TD align=right class='win_update_table_td'><span class="style2">婚姻状况：</span></TD>
              <TD align="left" bgcolor="#FFFFFF">&nbsp;
                  <SELECT name=Marry size=1 id="select10" style="FONT-SIZE: 12px; FONT-FAMILY: 宋体">
                    <OPTION value=已婚>已婚</OPTION>
                    <OPTION value=未婚>未婚</OPTION>
                    <OPTION value=其它>其它</OPTION>
                    <OPTION value="" selected>不限 </OPTION>
                </SELECT></TD>
            </TR>
            <TR bgcolor="#FFFFFF">
              <TD height=36 colSpan=2 align=middle><div align="center">
                  <input type="submit" name="Submit22" value=" 人才搜索 ">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" name="Submit22" value="重置">
              </div></TD>
            </TR>
        </FORM>
</table>
</td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
>
</body>
</html>
<%
rs.close
set rs=nothing
rs1.close
set rs1=nothing
conn.close
set conn=nothing
%>
