<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<!--#include file="../inc/Function.asp"-->
<%
dim chkNO
chkNO=request("chkNO")
if chkNO="" then
Call ShowError("请选择一家企业！")
end if
Call RsName(rs,"select * from [01387company] where cid='"&ChkNo&"'" ,1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
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
g_citys=new Array(36);
g_citys[1] =  new Array("北京市","其他");
g_citys[2] =  new Array("天津市","其他");
g_citys[3] =  new Array("上海市","其他");
g_citys[4] =  new Array("重庆市","其他");
g_citys[5] =  new Array("义乌市","杭州市","宁波市","温州市","金华市","绍兴市","湖州市","绍兴市","嘉兴市","衢州市","丽水市","台州市","舟山市","其他");
g_citys[6] =  new Array("广州市","深圳市","东莞市","中山市","佛山市","珠海市","惠州市","汕头市","湛江市","潮州市","茂名市","肇庆市","梅州市","其他");
g_citys[7] =  new Array("南京市","苏州市","无锡市","扬州市","常州市","镇江市","连云港市","徐州市","泰州市","常熟市","盐城市","其他");
g_citys[8] =  new Array("福州市","厦门市","泉州市","漳州市","三明市","南平市","莆田市","龙岩市","宁德市","其他");
g_citys[9] =  new Array("长沙市","湘潭市","岳阳市","株洲市","张家界市","衡阳市","郴州市","常德市","吉首市","娄底市","怀化市","益阳市","邵阳市","永州市","其他");
g_citys[10] = new Array("武汉市","宜昌市","荆州市","黄石市","鄂州市","黄冈市","其他");
g_citys[11] = new Array("济南市","青岛市","烟台市","淄博市","潍坊市","临沂市","莱芜市","滨州市","其他");
g_citys[12] = new Array("沈阳市","抚顺市","大连市","本溪市","营口市","辽阳市","鞍山市","丹东市","阜新市","海城市","其他");
g_citys[13] = new Array("长春市","通化市","延吉市","四平市","九台市","辽源市","敦化市","其他");
g_citys[14] = new Array("昆明市","曲靖市","大理市","玉溪市","丽江市","楚雄市","保山市","个旧市","文山市","其他");
g_citys[15] = new Array("成都市","宜宾市","泸州市","内江市","攀枝花市","西昌市","德阳市","遂宁市","南充市","绵阳市","华鉴市","自贡市","其他");
g_citys[16] = new Array("合肥市","芜湖市","马鞍山市","蚌埠市","铜陵市","淮北市","淮南市","亳州市","巢湖市","黄山市","宿州市","阜阳市","安庆市","宣州市","滁州市","六安市","其他");
g_citys[17] = new Array("南昌市","景德镇市","九江市","鹰潭市","宜春市","新余市","萍乡市","赣州市","吉安市","井冈山市","抚州市","上饶市","其他");
g_citys[18] = new Array("哈尔滨市","佳木斯市","牡丹江市","大庆市","齐齐哈尔市","肇东市","双鸭山市","鸡西市","其他");
g_citys[19] = new Array("石家庄市","邯郸市","保定市","张家口市","秦皇岛市","辛集市","邢台市","唐山市","廊坊市","衡水市","沙河市","沧州市","承德市","其他");
g_citys[20] = new Array("西安市","咸阳市","宝鸡市","铜川市","延安市","其他");
g_citys[21] = new Array("海口市","三亚市","琼海市","通什市","其他");
g_citys[22] = new Array("郑州市","洛阳市","开封市","鹤壁市","焦作市","许昌市","驻马店市","安阳市","信阳市","平顶山市","南阳市","商丘市","其他");
g_citys[23] = new Array("太原市","大同市","忻州市","临汾市","阳泉市","长治市","其他");
g_citys[24] = new Array("呼和浩特","包头市","其他");
g_citys[25] = new Array("南宁市","桂林市","北海市","柳州市","梧州市","其他");
g_citys[26] = new Array("贵阳市","遵义市","铜仁市","赤水市","六盘水市","安顺市","其他");
g_citys[27] = new Array("银川市","青铜峡市","吴忠市","其他");
g_citys[28] = new Array("西宁市","格尔木市","德令哈市","其他");
g_citys[29] = new Array("乌鲁木齐市","石河子市","克拉玛依市","吐鲁番市","喀什市","其他");
g_citys[30] = new Array("拉萨市","日喀则市","其他");
g_citys[31] = new Array("兰州市","临夏市","白银市","其他");
g_citys[32] = new Array("台北市","台中市","基隆市","台南市","其他");
g_citys[33] = new Array("香港");
g_citys[34] = new Array("澳门");
g_citys[35] = new Array("国外");
g_citys[36] = new Array("其他");

function selectcitys(selPro, Citys) {
	p = parseInt(selPro.value);
	if(p <= 0 || p > 36) return;
	for(i = Citys.length - 1; i >= 0; i--) {
		Citys.options[i] = null;
	}
	for(i = 0; i < g_citys[p].length; i++) {
		Citys.options[Citys.length] = new Option(g_citys[p][i], g_citys[p][i]);
	}
}
</script>

<!--更新登陆时间的函数-->
<% Function  gengxin()

conn.execute("update [01387company] set lastlogin='"&now()&"',logintime=logintime+1 where username='"&username&"'")

end Function
%>


<form name="form1" method="post" action="EditCompany.asp">
  <table width="99%" border="0" align="center" cellPadding="3" cellSpacing="1" bordercolor="#111111" bgcolor="#FFFFFF" class="table" style="border-collapse: collapse">
    <tr> 
      <td height="25" colspan="2"  background="image/admin_bg_1.gif"><div align="center"><strong><font color="#FFFFFF">&nbsp; 
          企业详细信息 ( 总共收到 <font color="#FFFF00"> 
          <%	Call RsName(rs22,"select count(*) from [01387applylist] where cid='"&ChkNo&"' "  ,1,1) %>
          <%=rs22(0)%></font> 个简历 ) <a href="CompanyJobList.asp?cid=<%=chkNO%>">查看职位</a></font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap> <div align="right"><font color="#003399">公司名称： </font></div></td>
      <td height="20" align="middle"><div align="left"><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <input name="companyname" type="text" class="input" id="companyname" size="28" value="<%=rs("companyname")%>">
          <strong><font face="Geneva, Arial, Helvetica, sans-serif">&nbsp;&nbsp;</font></strong><font color="#333333" face="Geneva, Arial, Helvetica, sans-serif">&nbsp;更新时间</font><font color="#333333" face="Geneva, Arial, Helvetica, sans-serif"></font><strong><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <input name="lastlogin" type="text" class="input" id="lastlogin" size="10" value="<%=rs("lastlogin")%>">
          </font><font color="#FFFFFF">&nbsp;&nbsp;</font></strong> </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5">
      <td height="26"> <div align="right"><font color="#003399">来自网站/营业执照：</font></div></td>
      <td height="20" align="middle"><div align="left">
          <input name="licence" type="text" class="input" id="licence" value="<%=rs("licence")%>" size="28" maxlength="80">
        <a href="<%=rs("licence")%>" target="_blank">打开来自的网站链接</a>
		</div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="23%" height="26"> <div align="right"><font color="#003399">所属行业：</font></div></td>
      <td width="77%" height="20" align="middle"><div align="left"> <font face="Geneva, Arial, Helvetica, sans-serif"> 
          <select name="trade" size="1" class="input" id="trade" style="width: 240px; font-size: 12px; font-family: 宋体">
            <script language="JavaScript">writeTrade()</script>
          </select>
          </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right"><font color="#003399">公司性质：</font></div></td>
      <td width="77%" height="20" align="middle"> <div align="left"> <font face="Geneva, Arial, Helvetica, sans-serif"> 
          <select name="properity" class="input" id="properity">
            <script language="JavaScript">writeNature()</script>
          </select>
          </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap> <div align="right"><font color="#003399">成立日期： </font></div></td>
      <td width="77%" height="20" align="middle"><div align="left"><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <input name="u_year" type="text" class="input" id="u_year" value="<%=rs("u_year")%>" size="5">
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
          日<font color="#FF0000"></font> </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right"><font color="#003399">注册资金： </font></div></td>
      <td height="20" align="middle"> <div align="left"> 
          <input name="fund" type="text" class="input" id="fund" value="<%=rs("fund")%>" size="10">
          万元</div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap> <div align="right"><font color="#003399">员工人数： </font></div></td>
      <td height="20"> <div align="left"> 
          <input type="radio" value="少于50人" name="employee" <%if rs("employee")="少于50人" then%>checked<%end if%>>
          少于<b>50</b>人 
          <input type="radio" value="50-200人" name="employee" <%if rs("employee")="50-200人" then%>checked<%end if%>>
          <b>50-200</b>人 
          <input type="radio" value="200-500人" name="employee" <%if rs("employee")="200-500人" then%>checked<%end if%>>
          <b>200-500</b>人 
          <input type="radio" value="500-1000人" name="employee" <%if rs("employee")="500-1000人" then%>checked<%end if%>>
          <b>500-1000</b>人 
          <input type="radio" value="1000人以上" name="employee" <%if rs("employee")="1000人以上" then%>checked<%end if%>>
          <b>1000</b>人以上 <font color="#FF0000">*</font><font color="#624B35"></font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap><div align="right"><font color="#003399">法人代表：</font></div></td>
      <td height="20" align="middle"><div align="left"> 
          <input name="legal" type="text" class="input" id="legal" value="<%=rs("legal")%>" size="28" maxlength="80">
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap> <div align="right"><font color="#003399">公司简介： </font></div></td>
      <td height="20" align="middle" style="word-break:break-all"><div align="left"> 
          <textarea name="intro" cols="80" rows="8" class="input" id="intro"><%=replace(replace(rs("intro"),"&nbsp;",chr(32)),"<br>",chr(13))%></textarea>
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right"><font color="#003399">联 系 人： </font></div></td>
      <td height="18" align="middle"> <div align="left"> 
          <input name="contact" type="text" class="input" id="contact" value="<%=rs("contact")%>" size="28" maxlength="50">
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right"><font color="#003399">联系电话： </font></div></td>
      <td height="22" align="middle"> <div align="left"> 
          <input name="tel" type="text" class="input" id="tel" value="<%=rs("tel")%>" size="28" maxlength="50">
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right"><font color="#003399">传 　 真： </font></div></td>
      <td height="22" align="middle"> <div align="left"> 
          <input name="fax" type="text" class="input" id="fax" value="<%=rs("fax")%>" size="28" maxlength="50">
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right"><font color="#003399">手 　 机：</font></div></td>
      <td height="22" align="middle"> <div align="left"> 
          <input name="mobile" type="text" class="input" id="mobile" value="<%=rs("mobile")%>" size="28" maxlength="50">
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="25"> <div align="right"><font color="#003399">电子邮件： </font></div></td>
      <td align="middle" valign="top">
	  <div align="left"> <input name="email" type="text" class="input" id="email" value="<%=rs("email")%>" size="28" maxlength="50">
        <font face="Geneva, Arial, Helvetica, sans-serif"><a href="mailto:<%=rs("email")%>"><%=rs("email")%></a></font> </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right"><font color="#003399">公司主页： </font></div></td>
      <td height="1" align="middle"> <div align="left"><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <input name="website" type="text" class="input" id="website" value="<%=rs("website")%>" size="28" maxlength="50">
          </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap> <div align="right"><font color="#003399">通讯地址： </font></div></td>
      <td height="19" align="middle"> <div align="left"> <font face="Geneva, Arial, Helvetica, sans-serif"> 
          </font><font color="#000000"> 
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
          ( 省、市)<font color="#FF0000"> 
          <SELECT name="citys" class="input" id="citys">
            <option value="<%=rs("citys")%>"><%=rs("citys")%></option>
          </SELECT>
          </font>(市、区) 
          <input name="address" type="text" class="input" value="<%=rs("address")%>" size="20" maxlength="50"/>
          </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap> <div align="right"><font color="#003399">邮 　 编： 
          </font></div></td>
      <td height="10" align="middle"> <div align="left"> 
          <input name="zipcode" type="text" class="input" id="zipcode" value="<%=rs("zipcode")%>" size="8" maxlength="6"/>
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="40" colspan="2"> <div align="center"> 
          <input type="button" name="Button" value="返回上一页" onClick="javascript:history.go(-1)" style="width=100;height=30;font-size=12px">
          <input name="cid" type="hidden" id="cid" value="<%=request("chkNO")%>">
          <input name="page" type="hidden" id="page" value="<%=request("page")%>">
		  <%if Cint(request.cookies("01387job")("userpower"))>1 then%>
          <input type="submit" name="Button22" value="编辑企业资料" style="height=30;font-size=12px">
          <input type="button" name="Button2" value="该企业所有招聘职位" onClick="window.location.href='CompanyJobList.asp?cid=<%=chkNO%>'" style="width=150;height=30;font-size=12px">
          <%end if%>
		</div></td>
    </tr>
  </table>
</form>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call footer()
call closers()
call CloseConn()
%>
</body>
</html>