<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<%
Call Remote()
if session("username")="" or session("uid")="" or session("pwd1")="" then
response.Redirect("reg_first.asp")
response.End()
end if
%><%'=session("username")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人免费注册会员</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/01387.css" rel="stylesheet" type="text/css" />
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body>
<SCRIPT language=javascript src="inc/job.js"></SCRIPT>
<!--#include file="../inc/top_1.asp"-->


<table width="776" height="117" border="0" align="center">
  <tr> 
    <td width="35%" height="5"><div align="center"><font color="#00468D" size="2"><strong> 
        </strong></font></div></td>
    <td width="26%" height="2"><div align="center"><strong></strong></div></td>
    <td><div align="center"><font size="2"><strong></strong></font></div></td>
  </tr>
  <tr> 
    <td height="86" colspan="3"><div align="left">
        <table width="100%" border="0">
          <tr>
            <td width="3%">&nbsp;</td>
            <td width="97%"><table width="100%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
                <tr> 
                  <td align="left" bgcolor="#FFFFFF"><p><font color="#CCCCCC">&nbsp;&nbsp;&nbsp;第1步：填写帐号信息(已完成)</font> 
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#CCCCCC"><strong><font color="#003399">第2步:填写劳工简历</font></strong> 
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第3步:注册成功，登陆系统投递简历</font></p>
                    <p>·<font color="#FF0000">以下表格需在20分钟内填写完整并提交，若担心填写时间太长而提交失败</font>，可凭用户名密码<a href="http://www.macau69.cn/personadmin/login.asp"><font color="#003399">登陆个人简历管理平台</font></a>，逐步完善简历。<br />
                      ·以下标志"<strong><font color="#FF0000">*</font></strong>"的为必填项目 
                      <br />
                      ·不允许用繁体中文填写<br />
                    </p></td>
                </tr>
              </table></td>
          </tr>
        </table>
      </div></td>
  </tr>
</table>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
<form name="form1" method="post" action="reg_second_go_save.asp" onSubmit="return Juge(this)">
  <tr> 
    <td width="786" height="30">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
            <td height="26" align="left" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;基本信息 
              </strong></td>
        </tr>
      </table> 
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr bgcolor="#fbfbfb"> 
            <td width="15%" height="30"><div align="right">姓名：</div></td>
            <td><input name="uname" type="text" class="input" id="uname" size="26"> 
            <font color="#FF0000">*</font></td>
            <td><div align="right">性别：</div></td>
            <td><input name="sex" type="radio" value="1" checked>
              男 
              <input type="radio" name="sex" value="0">
              女</td>
          </tr>
          <tr> 
            <td height="30"><div align="right">出生日期：</div></td>
            <td width="39%"><select name="u_year" class="input">
                <option value="" >选择</option>
                <option value="1940" >1940</option>
                <option value="1941" >1941</option>
                <option value="1942" >1942</option>
                <option value="1943" >1943</option>
                <option value="1944" >1944</option>
                <option value="1945" >1945</option>
                <option value="1946" >1946</option>
                <option value="1947" >1947</option>
                <option value="1948" >1948</option>
                <option value="1949" >1949</option>
                <option value="1950" >1950</option>
                <option value="1951" >1951</option>
                <option value="1952" >1952</option>
                <option value="1953" >1953</option>
                <option value="1954" >1954</option>
                <option value="1955" >1955</option>
                <option value="1956" >1956</option>
                <option value="1957" >1957</option>
                <option value="1958" >1958</option>
                <option value="1959" >1959</option>
                <option value="1960" >1960</option>
                <option value="1961" >1961</option>
                <option value="1962" >1962</option>
                <option value="1963" >1963</option>
                <option value="1964" >1964</option>
                <option value="1965" >1965</option>
                <option value="1966" >1966</option>
                <option value="1967" >1967</option>
                <option value="1968" >1968</option>
                <option value="1969" >1969</option>
                <option value="1970" >1970</option>
                <option value="1971" >1971</option>
                <option value="1972" >1972</option>
                <option value="1973" >1973</option>
                <option value="1974" >1974</option>
                <option value="1975" >1975</option>
                <option value="1976" >1976</option>
                <option value="1977" >1977</option>
                <option value="1978" >1978</option>
                <option value="1979" >1979</option>
                <option value="1980" >1980</option>
                <option value="1981" >1981</option>
                <option value="1982" >1982</option>
                <option value="1983" >1983</option>
                <option value="1984" >1984</option>
                <option value="1985" >1985</option>
                <option value="1986" >1986</option>
                <option value="1987" >1987</option>
                <option value="1988" >1988</option>
                <option value="1989" >1989</option>
                <option value="1990" >1990</option>
                <option value="1991" >1991</option>
                <option value="1992" >1992</option>
                <option value="1993" >1993</option>
                <option value="1994" >1994</option>
                <option value="1995" >1995</option>
                <option value="1996" >1996</option>
                <option value="1997" >1997</option>
                <option value="1998" >1998</option>
                <option value="1999" >1999</option>
                <option value="2000" >2000</option>
              </select>
              年 
              <select name="u_month" class="input">
                <option value="" >选择</option>
                <option value="1" >01</option>
                <option value="2" >02</option>
                <option value="3" >03</option>
                <option value="4" >04</option>
                <option value="5" >05</option>
                <option value="6" >06</option>
                <option value="7" >07</option>
                <option value="8" >08</option>
                <option value="9" >09</option>
                <option value="10" >10</option>
                <option value="11" >11</option>
                <option value="12" >12</option>
              </select>
              月 
              <select name="u_day" class="input">
                <option value="" >选择</option>
                <option value="1" >01</option>
                <option value="2" >02</option>
                <option value="3" >03</option>
                <option value="4" >04</option>
                <option value="5" >05</option>
                <option value="6" >06</option>
                <option value="7" >07</option>
                <option value="8" >08</option>
                <option value="9" >09</option>
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
              日<font color="#FF0000">*</font></td>
            <td width="11%"><div align="right">民族：</div></td>
            <td width="35%"><select name="nation" class="input" id="nation">
                <option value="汉族">汉族</option>
                <option value="回族">回族</option>
                <option value="蒙古族">蒙古族</option>
                <option value="满族">满族</option>
                <option value="壮族">壮族</option>
                <option value="维吾尔族">维吾尔族</option>
                <option value="藏族">藏族</option>
                <option value="朝鲜族">朝鲜族</option>
                <option value="其它">其它</option>
              </select></td>
          </tr>
          <tr bgcolor="#fbfbfb"> 
            <td height="30"><div align="right">证件类型：</div></td>
            <td><select name="cardtype" class="input">
                <option VALUE="身份证" >身份证</option>
                <option VALUE="驾证" >驾证</option>
                <option VALUE="军官证" >军官证</option>
                <option VALUE="护照" >护照</option>
                <option VALUE="其它" >其它</option>
              </select></td>
            <td><div align="right">证件号码：</div></td>
            <td> <input name="cardno" type="text" class="input" size="26">
              <font color="#FF0000">*</font></td>
          </tr>
          <tr> 
            <td height="30"><div align="right">婚姻状况：</div></td>
            <td><input name="marry" type="radio" value="1" checked>
              未婚 
              <input name="marry" type="radio" value="2">
              已婚 
              <input name="marry" type="radio" value="3">
              离异 
              <input name="marry" type="radio" value="4">
              保密</td>
            <td><div align="right">身高：</div></td>
            <td> <font color="#FF0000"> 
              <input name="height" type="text" class="input" size="6">
              </font>厘米(1.7米 = 170 厘米)<font color="#FF0000"> *</font></td>
          </tr>
          <tr bgcolor="#fbfbfb"> 
            <td height="30"><div align="right">籍贯：</div></td>
            <td colspan="3"> <div align="left">
                <select name="province" class="input" id="province" onChange="javascript:selectcitys(this, document.form1.citys)" >
                  <option value="" selected >请选择</option>
                  <option value="1" >北京</option>
                  <option value="2" >天津</option> 
                  <option value="3" >上海</option> 
                  <option value="4" >重庆</option> 
                  <option value="5" >浙江</option>  
                  <option value="6" >广东</option>
                  <option value="7" >江苏</option>  
                  <option value="8" >福建</option>
                  <option value="9" >湖南</option> 
                  <option value="10" >湖北</option>  
                  <option value="11" >山东</option>
                  <option value="12" >辽宁</option>  
                  <option value="13" >吉林</option> 
                  <option value="14" >云南</option>  
                  <option value="15" >四川</option>
                  <option value="16" >安徽</option>  
                  <option value="17" >江西</option>
                  <option value="18" >黑龙江</option>  
                  <option value="19" >河北</option>
                  <option value="20" >陕西</option> 
                  <option value="21" >海南</option>
                  <option value="22" >河南</option> 
                  <option value="23" >山西</option>
                  <option value="24" >内蒙古</option>
                  <option value="25" >广西</option> 
                  <option value="26" >贵州</option>  
                  <option value="27" >宁夏</option>
                  <option value="28" >青海</option>  
                  <option value="29" >新疆</option>
                  <option value="30" >西藏</option>  
                  <option value="31" >甘肃</option>
                  <option value="32" >台湾</option>  
                  <option value="33" >香港</option>
                  <option value="34" >澳门</option> 
                  <option value="35" >国外</option>
                  <option value="36">其他</option>
                </select>
                ( 省、直辖市、自治区)<font color="#FF0000"> 
                <SELECT name="citys" class="input" id="citys">
                </SELECT>
                </font>(市、区、县)</div></td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="26" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;教育背景</strong></td>
        </tr>
      </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr bgcolor="#fbfbfb"> 
          <td width="16%" height="26"><div align="right">最高学历：</div></td>
          <td><select name="degree" class="input" id="degree">
		        <option value="0" >高中以下</option>
                <option value="1" selected >高中</option>
                <option value="2" >职高</option>
                <option value="3" >中专</option>
                <option value="4" >大专</option>
                <option value="5" >本科</option>
                <option value="6" >硕士</option>
                <option value="7" >博士</option>
              </select></td>
          <td><div align="right">毕业院校：</div></td>
          <td><input name="college" type="text" class="input" id="college" size="26">
            </td>
        </tr>
        <tr> 
          <td height="26"><div align="right">主修专业：</div></td>
          <td><input name="spec1" type="text" class="input" id="spec1" size="26">
            </td>
          <td><div align="right">第二专业：</div></td>
          <td><input name="spec2" type="text" class="input" id="spec2" size="26"></td>
        </tr>
        <tr bgcolor="#fbfbfb"> 
          <td height="26"><div align="right">计算机水平：</div></td>
          <td><select name="com_level" class="input">
                            <option value="计算机能力一般" >计算机能力一般</option>
                            <option value="办公类软件熟练" >办公类软件熟练</option>
                            <option value="熟练使用财务软件" >熟练使用财务软件</option>
                            <option value="熟练收发邮件和排版" >熟练收发邮件和排版</option>
                            <option value="软件|网络|办公|硬件" >熟悉计算机网络</option>
                            <option value="精通电脑软件" selected>精通电脑软件</option>
                            <option value="精通电脑硬件" >精通电脑硬件</option>
                            <option value="精通软件硬件" >精通软件硬件</option>
                            <option value="计算机编程单机" >计算机编程单机</option>
                            <option value="初步INTERNET编程" >初步INTERNET编程</option>
                            <option value="精通INTERNET编程" >精通INTERNET编程</option>
                            <option value="无实际的应用能力" >无实际的应用能力</option>
                          </select></td>
          <td><div align="right">政治面貌：</div></td>
          <td><select name="zzmm" class="input" id="zzmm">
                <option value="群众" >群众</option>
                <option value="中共党员" >中共党员</option>
                <option value="共青团员" >共青团员</option>
                <option value="民主党派" >民主党派</option>
                <option value="其它" >其它</option>
              </select></td>
        </tr>
        <tr> 
          <td height="26"><div align="right">第一外语：</div></td>
          <td width="34%"><input name="l_type1" type="text" class="input" size="26"></td>
          <td width="15%"><div align="right">粤语水平：</div></td>
          <td width="35%"><select name="l_level1" class="input" id="l_level1">
                            <option value="初级" >初级</option>
                            <option value="一般" selected>一般</option>
                            <option value="良好" >良好</option>
                            <option value="熟练" >熟练</option>
                          </select></td>
        </tr>
        <tr bgcolor="#fbfbfb"> 
          <td height="26"><div align="right">第二外语：</div></td>
          <td><input name="l_type2" type="text" class="input" id="l_type2" size="26"></td>
          <td><div align="right">英语水平：</div></td>
          <td><select name="l_level2" class="input" id="l_level2">
                <option value="初级" >初级</option>
                <option value="一般" selected>一般</option>
                <option value="良好" >良好</option>
                <option value="熟练" >熟练</option>
              </select></td>
        </tr>
        <tr> 
          <td height="26"><div align="right">所获证书：</div></td>
          <td colspan="3"><input name="certificate" type="text" class="input" id="certificate" size="55">
              (如：IT认证、教师证、会计证、等等)</td>
        </tr>
        <tr bgcolor="#fbfbfb"> 
          <td height="26"><div align="right">培训、教育经历介绍：</div></td>
          <td colspan="3"><textarea name="edu_career" cols="66" rows="5" class="input" id="edu_career">(例如：X年X月—X年X月    某学校/培训机构名称     专业/科目名称　 获得某证书） </textarea>
              <font color="#FF0000">*</font>（1000字以内）</td>
        </tr>
      </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="26" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;求职意向</strong></td>
        </tr>
      </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr bgcolor="#fbfbfb"> 
            <td width="15%" height="26"><div align="right">应聘的行业(一)：</div></td>
            <td width="35%"><select name="maincatelog" class="input" id="maincatelog" onChange="javascript:selectjob(this, document.form1.subcatelog)" >
                <option value="" selected >请选择</option>
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
              </select> <font color="#FF0000">*</font></td>
            <td width="15%"><div align="right">具体职位(一)：</div></td>
            <td width="35%"><SELECT name="subcatelog" class="input" id="subcatelog">
              </SELECT> <font color="#FF0000">*</font></td>
          </tr>
          <tr> 
            <td height="26"><div align="right">应聘的行业(二)：</div></td>
            <td><select name="maincatelog2" class="input" id="maincatelog2" onChange="javascript:selectjob(this, document.form1.subcatelog2)" >
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
              </select></td>
            <td><div align="right">具体职位(二)：</div></td>
            <td><SELECT name="subcatelog2" class="input" id="subcatelog2">
              </SELECT></td>
          </tr>
          <tr bgcolor="#fbfbfb"> 
            <td height="26"><div align="right">最适合的职位：</div></td>
            <td><input name="jobname" type="text" class="input" id="jobname">
              <font color="#FF0000">*</font>(可填写多个)</td>
            <td><div align="right">全职/兼职：</div></td>
            <td><select name="jobtype" class="input" id="jobtype">
                <option value=1>全职</option>
                <option value=2>兼职</option>
                <option value=3>都可以</option>
              </select></td>
          </tr>
          <tr> 
            <td height="26"><div align="right">薪水要求：</div></td>
            <td><select name="salary" class="input" id="salary">
                    <option value="0" selected >面议</option>
                    <option value="1" >3000以下</option>
                    <option value="2" >3000-4000</option>
                    <option value="3" >4000-5000</option>
                    <option value="4" >5000-7000</option>
                    <option value="5" >7000以上</option>
              </select>
              (元/月)</td>
            <td><div align="right">住房要求：</div></td>
            <td><select name="workhouse" class="input" id="workhouse">
                <option value="面议协商" >面议协商</option>
                <option value="公司提供" >公司提供</option>
                <option value="自行解决" >自行解决</option>
              </select></td>
          </tr>
          <tr> 
            <td height="26"><div align="right">到岗时间：</div></td>
            <td colspan="3"><select name="checkindate" class="input" id="checkindate">
                <option value="">请选择</option>
                <option value="1">随时到岗</option>
                <option value="2">三天内</option>
                <option value="3">一周内</option>
                <option value="4">一个月内</option>
                <option value="5">三个月内</option>
                <option value="6">面议协商</option>
              </select> <font color="#FF0000">*</font></td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="26" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;自我评价、自荐说明</strong></td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr bgcolor="#fbfbfb"> 
            <td width="15%" height="26"><div align="right">自评、自荐说明：</div></td>
            <td width="85%"><textarea name="selfintro" cols="66" rows="5" class="input" id="selfintro">（例如：特长、技能、自我评价、自我推荐等，可自我发挥） </textarea>
              <font color="#FF0000">*</font>（500字以内）</td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="26" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;工作经历</strong></td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="15%" height="26"><div align="right">工作经验：</div></td>
            <td width="85%"><input name="doneyear" type="text" class="input" id="doneyear" size="5">
              年<font color="#FF0000">*</font>(应届毕业生填写<font color="#FF0000">0</font>)</td>
          </tr>
          <tr bgcolor="#fbfbfb"> 
            <td height="26"><div align="right">工作经历介绍：</div></td>
            <td><textarea name="job_career" cols="66" rows="6" class="input" id="job_career">(例如：X年X月—X年X月     某实习/工作单位      某工作职位       负责某项工作）</textarea>
              <font color="#FF0000">*</font> （1000字以内）</td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="26" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;联系方式</strong></td>
          </tr>
        </table>
        <div align="center"><br />
          <font color="#FF0000">特别提醒：</font>对自己身材、形象比较自信的，请一定要填写个人的网络相册地址，如：网易相册，QQ相册或个人BLOG等。<br />
          （没有网络相册的自己去注册申请），让用人单位更全面地了解你，对澳门求职帮助很大。<br />
        </div>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr bgcolor="#fbfbfb"> 
            <td width="15%" height="26"><div align="right">电话：</div></td>
            <td width="39%"><input name="tel" type="text" class="input" id="jobname3">
              <font color="#FF0000">*</font></td>
            <td width="11%"><div align="right">手机：</div></td>
            <td width="35%"><input name="mobile" type="text" class="input" id="tel"></td>
          </tr>
          <tr> 
            <td height="26"><div align="right">聊天号码：</div></td>
            <td><input name="chatno" type="text" class="input" id="tel2" size="20">
              (QQ、ICQ、MSN等)</td>
            <td><div align="right">个人网络相册/主页：</div></td>
            <td><input name="selfweb" type="text" class="input" id="tel3">
              如:QQ相册、BLOG</td>
          </tr>
          <tr bgcolor="#fbfbfb"> 
            <td height="26"><div align="right">住址：</div></td>
            <td><input name="address" type="text" class="input" id="tel4" size="36">
              <font color="#FF0000">*</font></td>
            <td><div align="right">邮编：</div></td>
            <td><input name="zipcode" type="text" class="input" id="tel5"></td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="26" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;保密设置</strong></td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr bgcolor="#fbfbfb"> 
            <td width="15%" height="26"><div align="right">保密设置：</div></td>
            <td><input name="resumestatus" type="radio" value="open" checked>
              公开简历 
              <input name="resumestatus" type="radio" value="hide">
              完全隐藏</td>
          </tr>
        </table>
        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td>&nbsp;</td>
          </tr>
        </table>
        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td><div align="center">
                <input name="Submit" type="submit"  value="填写完毕  提交简历">
              </div></td>
          </tr>
        </table>
      </td>
  </tr></form>
</table>
<br>
<br>
<!--#include file="bottom.asp"-->
</body>
</html>
