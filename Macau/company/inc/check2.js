//Design By L.C.H
 //-----------------------------------------------------判断输入为数字验证
function IsDigit(cCheck)      
 {      
 return (('0'<=cCheck) && (cCheck<='9'));      
 } 
 //-----------------------------------------------------填写详细资料时验证
 function fucCheckLength(strTemp)
{
	var i,sum;
	sum=0;
	for(i=0;i<strTemp.length;i++)
	{
		if ((strTemp.charCodeAt(i)>=0) && (strTemp.charCodeAt(i)<=255))
			sum=sum+1;
		else
			sum=sum+2;
	}
	return sum;
}
function Juge(theForm)
{
  if (theForm.companyname.value == "")
  {
    alert("请输入公司名称!");
    theForm.companyname.focus();
    return (false);
  }
  u_year=theForm.u_year.value;
  if (u_year == "")
  {
    alert("请输入年份!");
    theForm.u_year.focus();
    return (false);
  }
  if (u_year<1800||u_year>=2007)
  {
  alert("请填写正确的年份!");
  theForm.u_year.focus();
  return (false);
  }
  for (nIndex=0; nIndex<u_year.length; nIndex++)      
  {      
  cCheck = u_year.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("年份请填写数字！");      
   theForm.u_year.focus();      
   return false;      
   }      
  }
  if (theForm.u_month.value == "")
  {
    alert("请选择月份!");
    theForm.u_month.focus();
    return (false);
  }
  if (theForm.u_day.value == "")
  {
    alert("请选择日期!");
    theForm.u_day.focus();
    return (false);
  }
 // fund=theForm.fund.value;
  //if (fund == "")
  //{
 //   alert("请输入注册资金!");
//    theForm.fund.focus();
//    return (false);
//  }
//    for (nIndex=0; nIndex<fund.length; nIndex++)      
 // {      
 // cCheck = fund.charAt(nIndex);      
 // if (!IsDigit(cCheck))     
//   {      
//   alert("注册资金请填写数字！");      
////   theForm.fund.focus();      
//   return false;      
//   }      
//  }
//  if (theForm.legal.value == "")
 // {
  //  alert("请输入法人代表!");
  //  theForm.legal.focus();
//    return (false);
//  }

  if (theForm.intro.value == "")
  {
    alert("请输入公司简介!");
    theForm.intro.focus();
    return (false);
  }
    if (fucCheckLength(theForm.intro.value) >5000 )
	{
		alert("公司简介不能超过5000字");
		theForm.intro.focus();
		return (false);
	}
  if (theForm.contact.value == "")
  {
    alert("请输入联系人!");
    theForm.contact.focus();
    return (false);
  }
  if (theForm.tel.value == "")
  {
    alert("请输入联系电话!");
    theForm.tel.focus();
    return (false);
  }
  if (theForm.province.value == "")
  {
    alert("请选择省份!");
    theForm.province.focus();
    return (false);
  }
  if (theForm.address.value == "")
  {
    alert("请输入公司地址!");
    theForm.address.focus();
    return (false);
  }
  if (theForm.knowfrom[0].checked || theForm.knowfrom[1].checked || theForm.knowfrom[2].checked || theForm.knowfrom[3].checked || theForm.knowfrom[4].checked || theForm.knowfrom[5].checked || theForm.knowfrom[6].checked || theForm.knowfrom[7].checked || theForm.knowfrom[8].checked || theForm.knowfrom[9].checked || theForm.knowfrom[10].checked || theForm.knowfrom[11].checked)
  {
  return true;
  }
  else
  {
  alert("您至少选择一项从何处得知澳门劳工招聘网");
  theForm.knowfrom[0].focus();
  return false;  
  }
}
/**输出企业性质下拉列表项*/
function writeNature()
{
	with(document)
	{
		write("<option value='1'>国有企业</option>");
		write("<option value='2'>外资企业</option>");
		write("<option value='3'>合资企业</option>");
		write("<option value='4'>私营企业</option>");
		write("<option value='5'>民营企业</option>");
		write("<option value='6'>股份制企业</option>");
		write("<option value='7'>集体企业</option>");
		write("<option value='8'>集体事业</option>");
		write("<option value='9'>乡镇企业</option>");
		write("<option value='10'>行政机关</option>");
		write("<option value='11'>社会团体</option>");
		write("<option value='12'>事业单位</option>");
		write("<option value='13'>跨国公司(集团)</option>");
		write("<option value='14'>其他</option>");
	}	
}
//--行业列表
function writeTrade()
{
	with(document)
	{
		write("<option value='1'>互联网、电子商务</option>");
		write("<option value='2'>计算机业（软件、数据库、系统集成）</option>");
		write("<option value='3'>计算机业（硬件、网络设备）</option>");
		write("<option value='4'>电子、微电子技术</option>");
		write("<option value='5'>通讯、电信业</option>");
		write("<option value='6'>家电业</option>");
		write("<option value='7'>批发零售(百货、超市、购物中心、专卖店…)</option>");
		write("<option value='8'>贸易、商务、进出口</option>");
		write("<option value='9'>电气</option>");
		write("<option value='10'>电力、能源、矿产业</option>");
		write("<option value='11'>石油、化工业</option>");
		write("<option value='12'>生物工程、制药、环保</option>");
		write("<option value='13'>机械制造、机电设备、重工业</option>");
		write("<option value='14'>汽车、摩托车</option>");
		write("<option value='15'>仪器仪表、电工设备</option>");
		write("<option value='16'>广告、公关、设计</option>");
		write("<option value='17'>艺术、文化传播、媒体、影视制作、新闻出版</option>");
		write("<option value='18'>快速消费品（食品、饮料、粮油、化妆品、烟酒…）</option>");
		write("<option value='19'>纺织品业（服饰、鞋类、家纺用品、皮具…）</option>");
		write("<option value='20'>咨询业（顾问、会计师、审计师、法律）</option>");
		write("<option value='21'>金融业（投资、保险、证券、银行、基金）</option>");
		write("<option value='22'>建筑、房地产、物业管理、装潢</option>");
		write("<option value='23'>运输、物流、快递</option>");
		write("<option value='24'>旅游业、餐饮、娱乐、酒店</option>");
		write("<option value='25'>办公设备、文化体育休闲用品、家居用品</option>");
		write("<option value='26'>印刷、包装、造纸</option>");
		write("<option value='27'>生产、制造、加工</option>");
		write("<option value='28'>教育、培训、科研院所</option>");
		write("<option value='29'>医疗、保健、卫生服务</option>");
		write("<option value='30'>人才交流、中介</option>");
		write("<option value='31'>协会、社团、政府公用事业、社区服务</option>");
		write("<option value='32'>农、林、牧、副、渔业</option>");
		write("<option value='33'>法律</option>");					//新增
		write("<option value='34'>其他</option>");
	}	
}

//地区
 //-----------------------------------------------------选择岗位
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