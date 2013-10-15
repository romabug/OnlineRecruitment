//Designed By L.C.H
 //-----------------------------------------------------判断输入为数字验证
function IsDigit(cCheck)      
 {      
 return (('0'<=cCheck) && (cCheck<='9'));      
 } 
 //-----------------------------------------------------填写详细资料时验证
function Juge(theForm)
{
	
	   
  if (theForm.maincatelog.value == "0")
  {
    alert("请选择您的应聘岗位!");
    theForm.maincatelog.focus();
    return (false);
  }
  if (theForm.jobname.value == "")
  {
    alert("请输入招聘职位名称!");
    theForm.jobname.focus();
    return (false);
  }
  neednum=theForm.neednum.value;
  if (neednum == "")
  {
    alert("请输入招聘人数!");
    theForm.neednum.focus();
    return (false);
  }
    for (nIndex=0; nIndex<neednum.length; nIndex++)      
  {      
  cCheck = neednum.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("招聘人数填写数字！");      
   theForm.neednum.focus();      
   return false;      
   }      
  }
  
  if (theForm.jobcity.value == "")
  {
    alert("请输入工作地区!");
    theForm.jobcity.focus();
    return (false);
  }
  
  Salary=theForm.Salary.value;
  if (Salary == "")
  {
    alert("请输入月薪!");
    theForm.Salary.focus();
    return (false);
  }
    for (nIndex=0; nIndex<Salary.length; nIndex++)      
  {      
  cCheck = Salary.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("月薪填写数字！");      
   theForm.Salary.focus();      
   return false;      
   } 
   
      var  Juget=true;
      for(var j=0;j<theForm.fangfa.length;j++){

 if (theForm.fangfa[j].checked) {
		 Juget=false;
		break;
        }	
       }
          if (Juget){
          alert("请选取联系方式！");
          theForm.fangfa[1].focus();
          return (false);
       }
	   
     if (theForm.zpyear.value == "")
  {
    alert("请选择有效期几年!");
    theForm.zpyear.focus();
    return (false);
  }
  
     if (theForm.zpmonth.value == "")
  {
    alert("请选择有效期几月!");
    theForm.zpmonth.focus();
    return (false);
  }
     if (theForm.zpday.value == "")
  {
    alert("请选择有效期几日!");
    theForm.zpday.focus();
    return (false);
  }
    if (theForm.demand.value == "")
  {
    alert("请输入具体要求!");
    theForm.demand.focus();
    return (false);
  }

  

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

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}