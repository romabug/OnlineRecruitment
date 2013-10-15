//Design By L.C.H
 //-----------------------------------------------------判断输入为数字验证
function IsDigit(cCheck)      
 {      
 return (('0'<=cCheck) && (cCheck<='9'));      
 } 
 //-----------------------------------------------------填写详细资料时验证
function Juge(theForm)
{
  if (theForm.uname.value == "")
  {
    alert("请输入您的姓名!");
    theForm.uname.focus();
    return (false);
  }
  if (theForm.u_year.value == "")
  {
    alert("请选择您的出生年份!");
    theForm.u_year.focus();
    return (false);
  }
  if (theForm.u_month.value == "")
  {
    alert("请选择您的出生月份!");
    theForm.u_month.focus();
    return (false);
  }
  if (theForm.u_day.value == "")
  {
    alert("请选择您的出生日期!");
    theForm.u_day.focus();
    return (false);
  }
  height=theForm.height.value;
  if (height == "")
  {
    alert("请输入您的身高!");
    theForm.height.focus();
    return (false);
  }
    for (nIndex=0; nIndex<height.length; nIndex++)      
  {      
  cCheck = height.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("身高请填写数字！");      
   theForm.height.focus();      
   return false;      
   }      
  }
    if (theForm.province.value == "")
  {
    alert("请选择省份!");
    theForm.province.focus();
    return (false);
  }
  if (theForm.cardno.value == "")
  {
    alert("请输入证件号码!");
    theForm.cardno.focus();
    return (false);
  }
  if (theForm.edu_career.value == "")
  {
    alert("请输入您的培训与教育经历!");
    theForm.edu_career.focus();
    return (false);
  }
  if (theForm.maincatelog.value == "")
  {
    alert("请选择您的应聘岗位!");
    theForm.maincatelog.focus();
    return (false);
  }
  if (theForm.jobname.value == "")
  {
    alert("请输入最适合的职位名称!");
    theForm.jobname.focus();
    return (false);
  }
  if (theForm.checkindate.value == "")
  {
    alert("请选择到岗时间!");
    theForm.checkindate.focus();
    return (false);
  }
  if (theForm.selfintro.value == "")
  {
    alert("请输入自我评价!");
    theForm.selfintro.focus();
    return (false);
  }
  doneyear=theForm.doneyear.value;
  if (doneyear == "")
  {
    alert("请输入工作经验!");
    theForm.doneyear.focus();
    return (false);
  }
  for (nIndex=0; nIndex<doneyear.length; nIndex++)      
  {      
  cCheck = doneyear.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("工作经验请填写数字！");      
   theForm.doneyear.focus();      
   return false;      
   }      
  }
  if (theForm.job_career.value == "")
  {
    alert("请输入工作经历!");
    theForm.job_career.focus();
    return (false);
  }
  if (theForm.tel.value == "")
  {
    alert("请输入联系电话!");
    theForm.tel.focus();
    return (false);
  }
  if (theForm.address.value == "")
  {
    alert("请输入现在所在地!");
    theForm.address.focus();
    return (false);
  }
}
 //-----------------------------------------------------选择岗位
g_jobs=new Array(25);

g_jobs[1] =  new Array(  "高级厨师","服务生","主厨","帮厨","清洁工","收银员","点菜/酒妹","调酒师","其它人员");

g_jobs[2] =  new Array(  "理货","收银","导购","店长","营业员","其它管理人员");

g_jobs[3] =  new Array(  "发牌员","监牌员","帐房","警卫","导游","保洁员","服务员","公关","设备维护","主管/经理","其它人员");

g_jobs[4] =  new Array(  "司机","邮递人员","机长","机师","空乘人员","地勤人员","乘务员","船长","船员","管理人员","其它人员");

g_jobs[5] =  new Array(  "网络管理员","电脑维护","程序员","数据库管理","项目管理","网站编辑","网页设计/美工","测试人员","多媒体设计","管理人员","其它人员");

g_jobs[6] =  new Array(  "广告设计","平面设计","电脑制版","影视设计","摄影师","文案策划","多媒体设计","管理人员","其它人员");

g_jobs[7] =  new Array(  "水管工","电工","燃气工","空调工","电梯工","管理人员","综合技术","其它人员");

g_jobs[8] =  new Array(   "汽车维修","汽车美容","洗车","汽车改装","汽车销售","管理人员","其它人员");

g_jobs[9] =  new Array(  "扎铁/电焊工","油漆工","建筑工人","水电工","制暖/制冷","装修设计","装修工","其它人员");

g_jobs[10] =  new Array(  "家庭保姆","警卫人员","清洁工","佣人","高级保姆","保镖","其它人员");

g_jobs[11] =  new Array(  "形象设计","高级理发师","一般理发师","美容/美体师","足按/推拿员","化妆师","管理人员","公关人才","其它人员");

g_jobs[12] =  new Array(  "舞蹈","声乐","时装/广告模特","调酒师","乐器演奏","服务员","培训员","公关人才","管理人员","其它人员");

g_jobs[13] =  new Array(  "策划人员","项目管理","会展帮工","会展设计","会展布置","其它人员");

g_jobs[14] =  new Array(  "制衣工","验收员","生产管理","设备维护","仓库管理","化验/检验员","其它人员");

g_jobs[15] =  new Array(  "警卫","花卉维护","设施维修","动物饲养","管理人员","其它人员");

g_jobs[16] =  new Array(  "外贸/贸易经理","外贸/贸易专员","外贸QC","采购专员/主管","跟单员","单证专员","仓管","其它人员");

g_jobs[17] =  new Array(  "同声传译/英语","英语","葡国语","阿拉伯语","日语","韩语","俄语","西班牙语","法语","德语","巴基斯坦语","其它语种");

g_jobs[18] =  new Array(  "证券/金融人才","拍卖/评估师","理财顾问","保险顾问","风险控制","管理人员","其它人员");

g_jobs[19] =  new Array(  "大学教师","中学教师","小学/幼儿教师","家教","电脑教师","乐器老师","舞蹈老师","绘画老师","其它人员");

g_jobs[20] =  new Array(  "中/西医师","护士/护理员","药剂师","心理医师","麻醉师","兽医/宠物医生","健美教练","其它人员");

g_jobs[21] =  new Array(  "房产中介","职业介绍所","法律顾问","心理咨询","其它人员");

g_jobs[22] =  new Array(  "打字员","办公文员","行政主管","后勤人员","电脑维护员","其它人员");

g_jobs[23] =  new Array(  "品牌经理","市场总监","销售总监","财务总监","人力资源总监","技术总监","职业/高级经理人","高级助理","其它人员");

g_jobs[24] =  new Array(  "高级设备维修工","锅炉工","钳工","电焊工","机械工","其他技术工种");

function selectjob(selPro, selCity) {
	p = parseInt(selPro.value);
	if(p <= 0 || p > 24) return;
	for(i = selCity.length - 1; i >= 0; i--) {
		selCity.options[i] = null;
	}
	for(i = 0; i < g_jobs[p].length; i++) {
		selCity.options[selCity.length] = new Option(g_jobs[p][i], g_jobs[p][i]);
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