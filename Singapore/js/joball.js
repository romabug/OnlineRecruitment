<!--  Job Category Associate List script written entirely in JavaScript  -->
<!--  Written by WenWei, 2001-2004. E-mail: wenwei(AT)blueidea.com  -->

// 职位大类选项列表
var PCLOptions = new Array()

// 职位小类选项列表
var CCLOptions = new Array()

GenerateJobCategoryList();

// 生成职位类别选项列表
function GenerateJobCategoryList()
{
    var ii = 0
    var jj = 0
    
    PCLOptions[ii++] = "计算机硬件|计算机硬件"
	PCLOptions[ii++] = "计算机软件|计算机软件"
	PCLOptions[ii++] = "互联网开发及应用|互联网开发及应用"
	PCLOptions[ii++] = "IT-管理|IT-管理"
	PCLOptions[ii++] = "IT-品管、技术支持及其它|IT-品管、技术支持及其它"
	PCLOptions[ii++] = "通信技术|通信技术"
	PCLOptions[ii++] = "电子/电器/半导体/仪器仪表|电子/电器/半导体/仪器仪表"
	PCLOptions[ii++] = "销售管理|销售管理"
	PCLOptions[ii++] = "销售人员|销售人员"
	PCLOptions[ii++] = "销售行政及商务|销售行政及商务"
	PCLOptions[ii++] = "客服及技术支持|客服及技术支持"
	PCLOptions[ii++] = "财务/审计/税务|财务/审计/税务"
	PCLOptions[ii++] = "证券/金融/投资|证券/金融/投资"
	PCLOptions[ii++] = "银行|银行"
	PCLOptions[ii++] = "保险|保险"
	PCLOptions[ii++] = "生产/营运|生产/营运"
	PCLOptions[ii++] = "质量/安全管理|质量/安全管理"
	PCLOptions[ii++] = "工程/机械/能源|工程/机械/能源"
	PCLOptions[ii++] = "技工|技工"
	PCLOptions[ii++] = "服装/纺织/皮革|服装/纺织/皮革"
	PCLOptions[ii++] = "采购|采购"
	PCLOptions[ii++] = "贸易|贸易"
	PCLOptions[ii++] = "物流/仓储|物流/仓储"
	PCLOptions[ii++] = "生物/化工/制药/医疗器械|生物/化工/制药/医疗器械"
	PCLOptions[ii++] = "医院/医疗/护理|医院/医疗/护理"
	PCLOptions[ii++] = "广告|广告"
	PCLOptions[ii++] = "公关/媒介|公关/媒介"
	PCLOptions[ii++] = "市场/营销|市场/营销"
	PCLOptions[ii++] = "影视/媒体|影视/媒体"
	PCLOptions[ii++] = "文字媒体/写作|文字媒体/写作"
	PCLOptions[ii++] = "艺术/设计|艺术/设计"
	PCLOptions[ii++] = "建筑工程|建筑工程"
	PCLOptions[ii++] = "房地产|房地产"
	PCLOptions[ii++] = "物业管理|物业管理"
	PCLOptions[ii++] = "人力资源|人力资源"
	PCLOptions[ii++] = "高级管理|高级管理"
	PCLOptions[ii++] = "行政/后勤|行政/后勤"
	PCLOptions[ii++] = "咨询/顾问|咨询/顾问"
	PCLOptions[ii++] = "律师/法务|律师/法务"
	PCLOptions[ii++] = "教师|教师"
	PCLOptions[ii++] = "科研人员|科研人员"
	PCLOptions[ii++] = "餐饮/娱乐|餐饮/娱乐"
	PCLOptions[ii++] = "酒店/旅游|酒店/旅游"
	PCLOptions[ii++] = "美容/保健|美容/保健"
	PCLOptions[ii++] = "百货/连锁/零售服务|百货/连锁/零售服务"
	PCLOptions[ii++] = "交通运输服务|交通运输服务"
	PCLOptions[ii++] = "保安/家政/其他服务|保安/家政/其他服务"
	PCLOptions[ii++] = "公务员|公务员"
	PCLOptions[ii++] = "翻译|翻译"
	PCLOptions[ii++] = "在校学生|在校学生"
	PCLOptions[ii++] = "储备干部/培训生/实习生|储备干部/培训生/实习生"
	PCLOptions[ii++] = "兼职|兼职"
    PCLOptions[ii++] = "其他类|其他类"
    
    
    ii = 0
    jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "计算机硬件-高级硬件工程师|高级硬件工程师"
    CCLOptions[ii][jj++] = "计算机硬件-硬件工程师|硬件工程师"
    CCLOptions[ii++][jj++] = "计算机硬件-其它职位|其它职位"
    
    jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "计算机软件-高级软件工程师|高级软件工程师"
    CCLOptions[ii][jj++] = "计算机软件-软件工程师|软件工程师"
    CCLOptions[ii][jj++] = "计算机软件-ERP技术/开发应用|ERP技术/开发应用"
    CCLOptions[ii][jj++] = "计算机软件-系统集成工程师|系统集成工程师"
    CCLOptions[ii][jj++] = "计算机软件-系统分析员|系统分析员"
    CCLOptions[ii][jj++] = "计算机软件-系统工程师|系统工程师"
    CCLOptions[ii][jj++] = "计算机软件-数据库工程师/管理员|数据库工程师/管理员"
    CCLOptions[ii][jj++] = "计算机软件-计算机辅助设计工程师|计算机辅助设计工程师"
    CCLOptions[ii++][jj++] = "计算机软件-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "互联网开发及应用-互联网软件开发工程师|互联网软件开发工程师"
    CCLOptions[ii][jj++] = "互联网开发及应用-多媒体/游戏开发工程师|多媒体/游戏开发工程师"
    CCLOptions[ii][jj++] = "互联网开发及应用-网站营运经理/主管|网站营运经理/主管"
    CCLOptions[ii][jj++] = "互联网开发及应用-网络工程师|网络工程师"
    CCLOptions[ii][jj++] = "互联网开发及应用-系统管理员/网络管理员|系统管理员/网络管理员"
    CCLOptions[ii][jj++] = "互联网开发及应用-网站策划|网站策划"
    CCLOptions[ii][jj++] = "互联网开发及应用-网站编辑|网站编辑"
    CCLOptions[ii][jj++] = "互联网开发及应用-网页设计/制作/美工|网页设计/制作/美工"
    CCLOptions[ii][jj++] = "互联网开发及应用-网络信息安全工程师|网络信息安全工程师"
    CCLOptions[ii][jj++] = "互联网开发及应用-智能大厦/综合布线|智能大厦/综合布线"
    CCLOptions[ii++][jj++] = "互联网开发及应用-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "IT-管理-首席技术执行官CTO/首席信息官CIO|首席技术执行官CTO/首席信息官CIO"
    CCLOptions[ii][jj++] = "IT-管理-技术总监/经理|技术总监/经理"
    CCLOptions[ii][jj++] = "IT-管理-信息技术经理/主管|信息技术经理/主管"
    CCLOptions[ii][jj++] = "IT-管理-信息技术专员|信息技术专员"
    CCLOptions[ii][jj++] = "IT-管理-项目总监|项目总监"
    CCLOptions[ii][jj++] = "IT-管理-项目经理|项目经理"
    CCLOptions[ii][jj++] = "IT-管理-项目主管|项目主管"
    CCLOptions[ii][jj++] = "IT-管理-项目执行/协调人员|项目执行/协调人员"
    CCLOptions[ii++][jj++] = "IT-管理-其它职位|其它职位"
    
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "IT-品管、技术支持及其它-技术支持经理|技术支持经理"
    CCLOptions[ii][jj++] = "IT-品管、技术支持及其它-技术支持工程师|技术支持工程师"
    CCLOptions[ii][jj++] = "IT-品管、技术支持及其它-计量工程师|计量工程师"
    CCLOptions[ii][jj++] = "IT-品管、技术支持及其它-标准化工程师|标准化工程师"
    CCLOptions[ii][jj++] = "IT-品管、技术支持及其它-品质经理|品质经理"
    CCLOptions[ii][jj++] = "IT-品管、技术支持及其它-系统测试|系统测试"
    CCLOptions[ii][jj++] = "IT-品管、技术支持及其它-软件测试|软件测试"
    CCLOptions[ii][jj++] = "IT-品管、技术支持及其它-硬件测试|硬件测试"
    CCLOptions[ii][jj++] = "IT-品管、技术支持及其它-测试员|测试员"
    CCLOptions[ii][jj++] = "IT-品管、技术支持及其它-技术文员/助理|技术文员/助理"
    CCLOptions[ii++][jj++] = "IT-品管、技术支持及其它-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "通信技术-通信技术工程师|通信技术工程师"
    CCLOptions[ii][jj++] = "通信技术-有线传输工程师|有线传输工程师"
    CCLOptions[ii][jj++] = "通信技术-无线通信工程师|无线通信工程师"
    CCLOptions[ii][jj++] = "通信技术-电信交换工程师|电信交换工程师"
    CCLOptions[ii][jj++] = "通信技术-数据通信工程师|数据通信工程师"
    CCLOptions[ii][jj++] = "通信技术-移动通信工程师|移动通信工程师"
    CCLOptions[ii][jj++] = "通信技术-电信网络工程师|电信网络工程师"
    CCLOptions[ii][jj++] = "通信技术-通信电源工程师|通信电源工程师"
    CCLOptions[ii++][jj++] = "通信技术-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-集成电路IC设计/应用工程师|集成电路IC设计/应用工程师"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-IC验证工程师|IC验证工程师"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-电子工程师/技术员|电子工程师/技术员"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-电气工程师/技术员|电气工程师/技术员"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-电路工程师/技术员|电路工程师/技术员"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-电声/音响工程师/技术|电声/音响工程师/技术"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-半导体技术|半导体技术"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-自动控制工程师/技术员|自动控制工程师/技术员"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-电子软件开发(ARM/MCU...)|电子软件开发(ARM/MCU...)"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-嵌入式软件开发(Linux/单片机/DLC/DSP…)|嵌入式软件开发(Linux/单片机/DLC/DSP…)"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-电池/电源开发|电池/电源开发"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-FAE 现场应用工程师|FAE 现场应用工程师"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-家用电器/数码产品研发|家用电器/数码产品研发"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-仪器/仪表/计量|仪器/仪表/计量"
    CCLOptions[ii][jj++] = "电子/电器/半导体/仪器仪表-测试工程师|测试工程师"
    CCLOptions[ii++][jj++] = "电子/电器/半导体/仪器仪表-其它职位|其它职位"
    
    jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "销售管理-销售总监|销售总监"
    CCLOptions[ii][jj++] = "销售管理-销售经理|销售经理"
    CCLOptions[ii][jj++] = "销售管理-销售主管|销售主管"
    CCLOptions[ii][jj++] = "销售管理-渠道/分销经理|渠道/分销经理"
    CCLOptions[ii][jj++] = "销售管理-渠道/分销主管|渠道/分销主管"
    CCLOptions[ii][jj++] = "销售管理-客户经理|客户经理"
    CCLOptions[ii][jj++] = "销售管理-区域销售总监|区域销售总监"
    CCLOptions[ii][jj++] = "销售管理-区域销售经理|区域销售经理"
    CCLOptions[ii++][jj++] = "销售管理-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "销售人员-销售代表|销售代表"
    CCLOptions[ii][jj++] = "销售人员-渠道/分销专员|渠道/分销专员"
    CCLOptions[ii][jj++] = "销售人员-客户代表|客户代表"
    CCLOptions[ii][jj++] = "销售人员-销售工程师|销售工程师"
    CCLOptions[ii][jj++] = "销售人员-电话销售|电话销售"
    CCLOptions[ii][jj++] = "销售人员-经销商|经销商"
    CCLOptions[ii++][jj++] = "销售人员-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "销售行政及商务-销售行政经理/主管|销售行政经理/主管"
    CCLOptions[ii][jj++] = "销售行政及商务-销售行政专员/助理|销售行政专员/助理"
    CCLOptions[ii][jj++] = "销售行政及商务-商务经理|商务经理"
    CCLOptions[ii][jj++] = "销售行政及商务-商务主管/专员|商务主管/专员"
    CCLOptions[ii][jj++] = "销售行政及商务-商务助理|商务助理"
    CCLOptions[ii][jj++] = "销售行政及商务-销售助理|销售助理"
    CCLOptions[ii++][jj++] = "销售行政及商务-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "客服及技术支持-客服总监（非技术）|客服总监（非技术）"
    CCLOptions[ii][jj++] = "客服及技术支持-客服经理（非技术）|客服经理（非技术）"
    CCLOptions[ii][jj++] = "客服及技术支持-客服主管（非技术）|客服主管（非技术）"
    CCLOptions[ii][jj++] = "客服及技术支持-客服专员/助理（非技术）|客服专员/助理（非技术）"
    CCLOptions[ii][jj++] = "客服及技术支持-售前/售后技术支持经理|售前/售后技术支持经理"
    CCLOptions[ii][jj++] = "客服及技术支持-售前/售后技术支持主管|售前/售后技术支持主管"
    CCLOptions[ii][jj++] = "客服及技术支持-售前/售后技术支持工程师|售前/售后技术支持工程师"
    CCLOptions[ii][jj++] = "客服及技术支持-咨询热线/呼叫中心服务人员|咨询热线/呼叫中心服务人员"
    CCLOptions[ii++][jj++] = "客服及技术支持-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "财务/审计/税务-首席财务官CFO|首席财务官CFO"
    CCLOptions[ii][jj++] = "财务/审计/税务-财务总监|财务总监"
    CCLOptions[ii][jj++] = "财务/审计/税务-财务经理|财务经理"
    CCLOptions[ii][jj++] = "财务/审计/税务-财务顾问|财务顾问"
    CCLOptions[ii][jj++] = "财务/审计/税务-财务主管/总帐主管|财务主管/总帐主管"
    CCLOptions[ii][jj++] = "财务/审计/税务-会计经理/会计主管|会计经理/会计主管"
    CCLOptions[ii][jj++] = "财务/审计/税务-会计|会计"
    CCLOptions[ii][jj++] = "财务/审计/税务-出纳员|出纳员"
    CCLOptions[ii][jj++] = "财务/审计/税务-财务/会计助理|财务/会计助理"
    CCLOptions[ii][jj++] = "财务/审计/税务-财务分析经理/主管|财务分析经理/主管"
    CCLOptions[ii][jj++] = "财务/审计/税务-财务分析员|财务分析员"
    CCLOptions[ii][jj++] = "财务/审计/税务-成本经理/成本主管|成本经理/成本主管"
    CCLOptions[ii][jj++] = "财务/审计/税务-成本管理员|成本管理员"
    CCLOptions[ii][jj++] = "财务/审计/税务-审计经理/主管|审计经理/主管"
    CCLOptions[ii][jj++] = "财务/审计/税务-审计专员/助理|审计专员/助理"
    CCLOptions[ii][jj++] = "财务/审计/税务-税务经理/税务主管|税务经理/税务主管"
    CCLOptions[ii][jj++] = "财务/审计/税务-税务专员/助理|税务专员/助理"
    CCLOptions[ii][jj++] = "财务/审计/税务-统计员|统计员"
    CCLOptions[ii++][jj++] = "财务/审计/税务-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "证券/金融/投资-证券/期货/外汇经纪人|证券/期货/外汇经纪人"
    CCLOptions[ii][jj++] = "证券/金融/投资-证券分析师|证券分析师"
    CCLOptions[ii][jj++] = "证券/金融/投资-股票/期货操盘|股票/期货操盘"
    CCLOptions[ii][jj++] = "证券/金融/投资-金融/经济研究员|金融/经济研究员"
    CCLOptions[ii][jj++] = "证券/金融/投资-投资/基金项目经理|投资/基金项目经理"
    CCLOptions[ii][jj++] = "证券/金融/投资-投资/理财顾问|投资/理财顾问"
    CCLOptions[ii][jj++] = "证券/金融/投资-投资银行业务|投资银行业务"
    CCLOptions[ii][jj++] = "证券/金融/投资-融资经理/融资主管|融资经理/融资主管"
    CCLOptions[ii][jj++] = "证券/金融/投资-融资专员|融资专员"
    CCLOptions[ii][jj++] = "证券/金融/投资-拍卖师|拍卖师"
    CCLOptions[ii++][jj++] = "证券/金融/投资-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "银行-行长/副行长|行长/副行长"
    CCLOptions[ii][jj++] = "银行-资产评估/分析|资产评估/分析"
    CCLOptions[ii][jj++] = "银行-风险控制|风险控制"
    CCLOptions[ii][jj++] = "银行-信贷管理/信用调查/分析人员|信贷管理/信用调查/分析人员"
    CCLOptions[ii][jj++] = "银行-进出口/信用证结算|进出口/信用证结算"
    CCLOptions[ii][jj++] = "银行-外汇交易|外汇交易"
    CCLOptions[ii][jj++] = "银行-清算人员|清算人员"
    CCLOptions[ii][jj++] = "银行-高级客户经理/客户经理|高级客户经理/客户经理"
    CCLOptions[ii][jj++] = "银行-客户主管/专员|客户主管/专员"
    CCLOptions[ii][jj++] = "银行-银行柜员|银行柜员"
    CCLOptions[ii][jj++] = "银行-银行卡、电子银行业务推广|银行卡、电子银行业务推广"
    CCLOptions[ii++][jj++] = "银行-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "保险-保险精算师|保险精算师"
    CCLOptions[ii][jj++] = "保险-保险产品开发/项目策划|保险产品开发/项目策划"
    CCLOptions[ii][jj++] = "保险-保险业务经理/主管|保险业务经理/主管"
    CCLOptions[ii][jj++] = "保险-保险代理/经纪人/客户经理|保险代理/经纪人/客户经理"
    CCLOptions[ii][jj++] = "保险-理财顾问/财务规划师|理财顾问/财务规划师"
    CCLOptions[ii][jj++] = "保险-储备经理人|储备经理人"
    CCLOptions[ii][jj++] = "保险-保险核保|保险核保"
    CCLOptions[ii][jj++] = "保险-保险理赔|保险理赔"
    CCLOptions[ii][jj++] = "保险-保险客户服务/续期管|保险客户服务/续期管"
    CCLOptions[ii][jj++] = "保险-保险培训师|保险培训师"
    CCLOptions[ii][jj++] = "保险-保险内勤|保险内勤"
    CCLOptions[ii++][jj++] = "保险-其它职位|其它职位"
    
     jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "生产/营运-工厂经理/厂长|工厂经理/厂长"
    CCLOptions[ii][jj++] = "生产/营运-总工程师/副总工程师|总工程师/副总工程师"
    CCLOptions[ii][jj++] = "生产/营运-项目经理/主管|项目经理/主管"
    CCLOptions[ii][jj++] = "生产/营运-项目工程师|项目工程师"
    CCLOptions[ii][jj++] = "生产/营运-营运经理|营运经理"
    CCLOptions[ii][jj++] = "生产/营运-营运主管|营运主管"
    CCLOptions[ii][jj++] = "生产/营运-生产经理/车间主任|生产经理/车间主任"
    CCLOptions[ii][jj++] = "生产/营运-生产计划协调员|生产计划协调员"
    CCLOptions[ii][jj++] = "生产/营运-生产主管/督导/领班|生产主管/督导/领班"
    CCLOptions[ii][jj++] = "生产/营运-化验员|化验员"
    CCLOptions[ii++][jj++] = "生产/营运-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "质量/安全管理-质量管理/测试经理(QA/QC经理)|质量管理/测试经理(QA/QC经理)"
    CCLOptions[ii][jj++] = "质量/安全管理-质量管理/测试主管(QA/QC主管)|质量管理/测试主管(QA/QC主管)"
    CCLOptions[ii][jj++] = "质量/安全管理-质量管理/测试工程师(QA/QC工程师)|质量管理/测试工程师(QA/QC工程师)"
    CCLOptions[ii][jj++] = "质量/安全管理-质量检验员/测试员|质量检验员/测试员"
    CCLOptions[ii][jj++] = "质量/安全管理-可靠度工程师|可靠度工程师"
    CCLOptions[ii][jj++] = "质量/安全管理-故障分析工程师|故障分析工程师"
    CCLOptions[ii][jj++] = "质量/安全管理-认证工程师/审核员|认证工程师/审核员"
    CCLOptions[ii][jj++] = "质量/安全管理-体系工程师/审核员|体系工程师/审核员"
    CCLOptions[ii][jj++] = "质量/安全管理-安全/健康/环境经理/主管|安全/健康/环境经理/主管"
    CCLOptions[ii][jj++] = "质量/安全管理-安全/健康/环境工程师|安全/健康/环境工程师"
    CCLOptions[ii][jj++] = "质量/安全管理-供应商管理|供应商管理"
    CCLOptions[ii][jj++] = "质量/安全管理-采购材料、设备质量管理|采购材料、设备质量管理"
    CCLOptions[ii++][jj++] = "质量/安全管理-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "工程/机械/能源-技术研发经理/主管|技术研发经理/主管"
    CCLOptions[ii][jj++] = "工程/机械/能源-技术研发工程师|技术研发工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-产品工艺/制程工程师|产品工艺/制程工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-产品规划工程师|产品规划工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-实验室负责人/工程师|实验室负责人/工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-工程/设备经理|工程/设备经理"
    CCLOptions[ii][jj++] = "工程/机械/能源-工程/设备主管|工程/设备主管"
    CCLOptions[ii][jj++] = "工程/机械/能源-工程/设备工程师|工程/设备工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-工程/机械绘图员|工程/机械绘图员"
    CCLOptions[ii][jj++] = "工程/机械/能源-工业工程师|工业工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-机械工程师|机械工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-结构工程师|结构工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-模具工程师|模具工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-机电工程师|机电工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-维修工程师|维修工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-铸造/锻造工程师|铸造/锻造工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-注塑工程师|注塑工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-焊接工程师|焊接工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-夹具工程师|夹具工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-CNC工程师|CNC工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-冲压工程师|冲压工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-锅炉工程师|锅炉工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-电力工程师/技术员|电力工程师/技术员"
    CCLOptions[ii][jj++] = "工程/机械/能源-光源与照明工程|光源与照明工程"
    CCLOptions[ii][jj++] = "工程/机械/能源-汽车/摩托车工程师|汽车/摩托车工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-船舶工程师|船舶工程师"
    CCLOptions[ii][jj++] = "工程/机械/能源-飞行器设计与制造|飞行器设计与制造"
    CCLOptions[ii++][jj++] = "工程/机械/能源-其它职位|其它职位"
    
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "技工-技工|技工"
    CCLOptions[ii][jj++] = "技工-钳工/机修工/钣金工|钳工/机修工/钣金工"
    CCLOptions[ii][jj++] = "技工-电焊工/铆焊工|电焊工/铆焊工"
    CCLOptions[ii][jj++] = "技工-车工/磨工/铣工/冲压工/锣工|车工/磨工/铣工/冲压工/锣工"
    CCLOptions[ii][jj++] = "技工-模具工|模具工"
    CCLOptions[ii][jj++] = "技工-电工|电工"
    CCLOptions[ii][jj++] = "技工-叉车工|叉车工"
    CCLOptions[ii][jj++] = "技工-空调工/电梯工/锅炉工|空调工/电梯工/锅炉工"
    CCLOptions[ii][jj++] = "技工-水工/木工/油漆工|水工/木工/油漆工"
    CCLOptions[ii][jj++] = "技工-普工|普工"
    CCLOptions[ii][jj++] = "技工-裁剪车缝熨烫|裁剪车缝熨烫"
    CCLOptions[ii][jj++] = "技工-汽车修理工|汽车修理工"
    CCLOptions[ii++][jj++] = "技工-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "服装/纺织/皮革-服装/纺织设计|服装/纺织设计"
    CCLOptions[ii][jj++] = "服装/纺织/皮革-面料辅料开发|面料辅料开发"
    CCLOptions[ii][jj++] = "服装/纺织/皮革-面料辅料采购|面料辅料采购"
    CCLOptions[ii][jj++] = "服装/纺织/皮革-服装/纺织/皮革跟单|服装/纺织/皮革跟单"
    CCLOptions[ii][jj++] = "服装/纺织/皮革-质量管理/验货员(QA/QC)|质量管理/验货员(QA/QC)"
    CCLOptions[ii][jj++] = "服装/纺织/皮革-板房/楦头/底格出格师|板房/楦头/底格出格师"
    CCLOptions[ii][jj++] = "服装/纺织/皮革-服装打样/制版|服装打样/制版"
    CCLOptions[ii][jj++] = "服装/纺织/皮革-纸样师/车板工|纸样师/车板工"
    CCLOptions[ii][jj++] = "服装/纺织/皮革-裁床|裁床"
    CCLOptions[ii++][jj++] = "服装/纺织/皮革-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "采购-采购总监|采购总监"
    CCLOptions[ii][jj++] = "采购-采购经理|采购经理"
    CCLOptions[ii][jj++] = "采购-采购主管|采购主管"
    CCLOptions[ii][jj++] = "采购-采购员|采购员"
    CCLOptions[ii][jj++] = "采购-采购助理|采购助理"
    CCLOptions[ii][jj++] = "采购-选址拓展|选址拓展"
    CCLOptions[ii++][jj++] = "采购-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "贸易-外贸/贸易经理/主管|外贸/贸易经理/主管"
    CCLOptions[ii][jj++] = "贸易-外贸/贸易专员/助理|外贸/贸易专员/助理"
    CCLOptions[ii][jj++] = "贸易-国内贸易人员|国内贸易人员"
    CCLOptions[ii][jj++] = "贸易-业务跟单经理|业务跟单经理"
    CCLOptions[ii][jj++] = "贸易-高级业务跟单|高级业务跟单"
    CCLOptions[ii][jj++] = "贸易-业务跟单|业务跟单"
    CCLOptions[ii][jj++] = "贸易-助理业务跟单|助理业务跟单"
    CCLOptions[ii++][jj++] = "贸易-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "物流/仓储-物流总监|物流总监"
    CCLOptions[ii][jj++] = "物流/仓储-物流经理|物流经理"
    CCLOptions[ii][jj++] = "物流/仓储-物流主管|物流主管"
    CCLOptions[ii][jj++] = "物流/仓储-物流专员/助理|物流专员/助理"
    CCLOptions[ii][jj++] = "物流/仓储-供应链总监|供应链总监"
    CCLOptions[ii][jj++] = "物流/仓储-供应链经理|供应链经理"
    CCLOptions[ii][jj++] = "物流/仓储-供应链主管/专员|供应链主管/专员"
    CCLOptions[ii][jj++] = "物流/仓储-物料经理|物料经理"
    CCLOptions[ii][jj++] = "物流/仓储-物料主管/专员|物料主管/专员"
    CCLOptions[ii][jj++] = "物流/仓储-仓库经理/主管|仓库经理/主管"
    CCLOptions[ii][jj++] = "物流/仓储-仓库管理员|仓库管理员"
    CCLOptions[ii][jj++] = "物流/仓储-运输经理/主管|运输经理/主管"
    CCLOptions[ii][jj++] = "物流/仓储-货运代理|货运代理"
    CCLOptions[ii][jj++] = "物流/仓储-集装箱业务|集装箱业务"
    CCLOptions[ii][jj++] = "物流/仓储-报关员|报关员"
    CCLOptions[ii][jj++] = "物流/仓储-单证员|单证员"
    CCLOptions[ii][jj++] = "物流/仓储-船务/空运陆运操作|船务/空运陆运操作"
    CCLOptions[ii][jj++] = "物流/仓储-快递员|快递员"
    CCLOptions[ii][jj++] = "物流/仓储-调度员|调度员"
    CCLOptions[ii][jj++] = "物流/仓储-理货员|理货员"
    CCLOptions[ii++][jj++] = "物流/仓储-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-生物工程/生物制药|生物工程/生物制药"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-化工技术应用|化工技术应用"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-医药技术研发管理人员|医药技术研发管理人员"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-医药技术研发人员|医药技术研发人员"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-临床研究员|临床研究员"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-临床协调员|临床协调员"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-药品注册|药品注册"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-药品生产/质量管理|药品生产/质量管理"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-药品市场推广经理|药品市场推广经理"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-药品市场推广主管/专员|药品市场推广主管/专员"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-医药销售经理/主管|医药销售经理/主管"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-医药销售代表|医药销售代表"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-医疗器械市场推广|医疗器械市场推广"
    CCLOptions[ii][jj++] = "生物/化工/制药/医疗器械-医疗器械销售|医疗器械销售"
    CCLOptions[ii++][jj++] = "生物/化工/制药/医疗器械-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "医院/医疗/护理-医院管理人员|医院管理人员"
    CCLOptions[ii][jj++] = "医院/医疗/护理-内科医生|内科医生"
    CCLOptions[ii][jj++] = "医院/医疗/护理-外科医生|外科医生"
    CCLOptions[ii][jj++] = "医院/医疗/护理-专科医生|专科医生"
    CCLOptions[ii][jj++] = "医院/医疗/护理-牙科医生|牙科医生"
    CCLOptions[ii][jj++] = "医院/医疗/护理-麻醉医生|麻醉医生"
    CCLOptions[ii][jj++] = "医院/医疗/护理-美容整形师|美容整形师"
    CCLOptions[ii][jj++] = "医院/医疗/护理-理疗师|理疗师"
    CCLOptions[ii][jj++] = "医院/医疗/护理-中医科医生|中医科医生"
    CCLOptions[ii][jj++] = "医院/医疗/护理-针灸、推拿|针灸、推拿"
    CCLOptions[ii][jj++] = "医院/医疗/护理-心理医生|心理医生"
    CCLOptions[ii][jj++] = "医院/医疗/护理-营养师|营养师"
    CCLOptions[ii][jj++] = "医院/医疗/护理-药库主任/药剂师|药库主任/药剂师"
    CCLOptions[ii][jj++] = "医院/医疗/护理-医药学检验|医药学检验"
    CCLOptions[ii][jj++] = "医院/医疗/护理-公共卫生/疾病控制|公共卫生/疾病控制"
    CCLOptions[ii][jj++] = "医院/医疗/护理-护士/护理人|护士/护理人"
    CCLOptions[ii][jj++] = "医院/医疗/护理-兽医|兽医"
    CCLOptions[ii++][jj++] = "医院/医疗/护理-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "广告-广告客户总监/副总监|广告客户总监/副总监"
    CCLOptions[ii][jj++] = "广告-广告客户经理|广告客户经理"
    CCLOptions[ii][jj++] = "广告-广告客户主管/专员|广告客户主管/专员"
    CCLOptions[ii][jj++] = "广告-广告创意/设计经理|广告创意/设计经理"
    CCLOptions[ii][jj++] = "广告-广告创意总监|广告创意总监"
    CCLOptions[ii][jj++] = "广告-广告创意/设计主管/专员|广告创意/设计主管/专员"
    CCLOptions[ii][jj++] = "广告-文案|文案"
    CCLOptions[ii][jj++] = "广告-企业/业务发展经|企业/业务发展经"
    CCLOptions[ii][jj++] = "广告-企业策划人员|企业策划人员"
    CCLOptions[ii++][jj++] = "广告-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "公关/媒介-公关经理|公关经理"
    CCLOptions[ii][jj++] = "公关/媒介-公关主管|公关主管"
    CCLOptions[ii][jj++] = "公关/媒介-公关专员|公关专员"
    CCLOptions[ii][jj++] = "公关/媒介-会务经理|会务经理"
    CCLOptions[ii][jj++] = "公关/媒介-会务主管|会务主管"
    CCLOptions[ii][jj++] = "公关/媒介-会务专员|会务专员"
    CCLOptions[ii][jj++] = "公关/媒介-媒介经理|媒介经理"
    CCLOptions[ii][jj++] = "公关/媒介-媒介主管|媒介主管"
    CCLOptions[ii][jj++] = "公关/媒介-媒介专员|媒介专员"
    CCLOptions[ii][jj++] = "公关/媒介-公关/媒介助理|公关/媒介助理"
    CCLOptions[ii++][jj++] = "公关/媒介-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "市场/营销-市场/营销总监|市场/营销总监"
    CCLOptions[ii][jj++] = "市场/营销-市场/营销经理|市场/营销经理"
    CCLOptions[ii][jj++] = "市场/营销-市场/营销主管|市场/营销主管"
    CCLOptions[ii][jj++] = "市场/营销-市场/营销专员|市场/营销专员"
    CCLOptions[ii][jj++] = "市场/营销-市场助理|市场助理"
    CCLOptions[ii][jj++] = "市场/营销-市场分析/调研人|市场分析/调研人"
    CCLOptions[ii][jj++] = "市场/营销-产品/品牌经理|产品/品牌经理"
    CCLOptions[ii][jj++] = "市场/营销-产品/品牌主管|产品/品牌主管"
    CCLOptions[ii][jj++] = "市场/营销-产品/品牌专员|产品/品牌专员"
    CCLOptions[ii][jj++] = "市场/营销-市场通路经理/主管|市场通路经理/主管"
    CCLOptions[ii][jj++] = "市场/营销-市场通路专员|市场通路专员"
    CCLOptions[ii][jj++] = "市场/营销-市场企划经理/主管|市场企划经理/主管"
    CCLOptions[ii][jj++] = "市场/营销-市场企划专员|市场企划专员"
    CCLOptions[ii][jj++] = "市场/营销-促销经理|促销经理"
    CCLOptions[ii][jj++] = "市场/营销-促销主管/督导|促销主管/督导"
    CCLOptions[ii][jj++] = "市场/营销-促销员/导购|促销员/导购"
    CCLOptions[ii++][jj++] = "市场/营销-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "影视/媒体-影视策划/制作人|影视策划/制作人"
    CCLOptions[ii][jj++] = "影视/媒体-导演/编导|导演/编导"
    CCLOptions[ii][jj++] = "影视/媒体-艺术/设计总监|艺术/设计总监"
    CCLOptions[ii][jj++] = "影视/媒体-经纪人/星探|经纪人/星探"
    CCLOptions[ii][jj++] = "影视/媒体-演员/模特/主持人|演员/模特/主持人"
    CCLOptions[ii][jj++] = "影视/媒体-摄影师|摄影师"
    CCLOptions[ii][jj++] = "影视/媒体-音效师|音效师"
    CCLOptions[ii][jj++] = "影视/媒体-配音员|配音员"
    CCLOptions[ii][jj++] = "影视/媒体-化妆师/造型师|化妆师/造型师"
    CCLOptions[ii++][jj++] = "影视/媒体-其它职位|其它职位"
    
    jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "文字媒体/写作-总编/副总编|总编/副总编"
    CCLOptions[ii][jj++] = "文字媒体/写作-编辑/作家/撰稿人|编辑/作家/撰稿人"
    CCLOptions[ii][jj++] = "文字媒体/写作-记者|记者"
    CCLOptions[ii][jj++] = "文字媒体/写作-美术编辑|美术编辑"
    CCLOptions[ii][jj++] = "文字媒体/写作-排版设计|排版设计"
    CCLOptions[ii][jj++] = "文字媒体/写作-校对/录入|校对/录入"
    CCLOptions[ii][jj++] = "文字媒体/写作-出版/发行|出版/发行"
    CCLOptions[ii++][jj++] = "文字媒体/写作-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "艺术/设计-平面设计|平面设计"
    CCLOptions[ii][jj++] = "艺术/设计-动画/3D设计|动画/3D设计"
    CCLOptions[ii][jj++] = "艺术/设计-陈列设计/展览设计|陈列设计/展览设计"
    CCLOptions[ii][jj++] = "艺术/设计-多媒体设计|多媒体设计"
    CCLOptions[ii][jj++] = "艺术/设计-包装设计|包装设计"
    CCLOptions[ii][jj++] = "艺术/设计-工业/产品设计|工业/产品设计"
    CCLOptions[ii][jj++] = "艺术/设计-工艺品/珠宝设计鉴定|工艺品/珠宝设计鉴定"
    CCLOptions[ii][jj++] = "艺术/设计-家具/家居用品设计|家具/家居用品设计"
    CCLOptions[ii][jj++] = "艺术/设计-玩具设计|玩具设计"
    CCLOptions[ii++][jj++] = "艺术/设计-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "建筑工程-建筑工程师|建筑工程师"
    CCLOptions[ii][jj++] = "建筑工程-结构/土木/土建工程师|结构/土木/土建工程师"
    CCLOptions[ii][jj++] = "建筑工程-公路/桥梁/港口/隧道工程|公路/桥梁/港口/隧道工程"
    CCLOptions[ii][jj++] = "建筑工程-岩土工程|岩土工程"
    CCLOptions[ii][jj++] = "建筑工程-电气工程|电气工程"
    CCLOptions[ii][jj++] = "建筑工程-给排水/暖通工程|给排水/暖通工程"
    CCLOptions[ii][jj++] = "建筑工程-城市规划与设计|城市规划与设计"
    CCLOptions[ii][jj++] = "建筑工程-室内外装潢设计|室内外装潢设计"
    CCLOptions[ii][jj++] = "建筑工程-园艺/园林/景观设计|园艺/园林/景观设计"
    CCLOptions[ii][jj++] = "建筑工程-测绘/测量|测绘/测量"
    CCLOptions[ii][jj++] = "建筑工程-建筑制图|建筑制图"
    CCLOptions[ii][jj++] = "建筑工程-工程造价师/预结算|工程造价师/预结算"
    CCLOptions[ii][jj++] = "建筑工程-建筑工程管理|建筑工程管理"
    CCLOptions[ii][jj++] = "建筑工程-建筑工程验收|建筑工程验收"
    CCLOptions[ii][jj++] = "建筑工程-工程监理|工程监理"
    CCLOptions[ii][jj++] = "建筑工程-施工员|施工员"
    CCLOptions[ii++][jj++] = "建筑工程-其它职位|其它职位"
    
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "房地产-房地产开发/策划经理|房地产开发/策划经理"
    CCLOptions[ii][jj++] = "房地产-房地产开发/策划主管/专员|房地产开发/策划主管/专员"
    CCLOptions[ii][jj++] = "房地产-房产项目配套工程师|房产项目配套工程师"
    CCLOptions[ii][jj++] = "房地产-房地产评估|房地产评估"
    CCLOptions[ii][jj++] = "房地产-房地产中介/交易|房地产中介/交易"
    CCLOptions[ii][jj++] = "房地产-房地产销售人员|房地产销售人员"
    CCLOptions[ii++][jj++] = "房地产-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "物业管理-高级物业顾问/物业顾问|高级物业顾问/物业顾问"
    CCLOptions[ii][jj++] = "物业管理-业管理经理/主管|业管理经理/主管"
    CCLOptions[ii][jj++] = "物业管理-物业管理专员/助理|物业管理专员/助理"
    CCLOptions[ii][jj++] = "物业管理-物业招商/租赁/租售|物业招商/租赁/租售"
    CCLOptions[ii][jj++] = "物业管理-物业设施管理人员|物业设施管理人员"
    CCLOptions[ii][jj++] = "物业管理-物业维修人员|物业维修人员"
    CCLOptions[ii++][jj++] = "物业管理-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "人力资源-人事总监|人事总监"
    CCLOptions[ii][jj++] = "人力资源-人事经理|人事经理"
    CCLOptions[ii][jj++] = "人力资源-人事主管|人事主管"
    CCLOptions[ii][jj++] = "人力资源-人事专员|人事专员"
    CCLOptions[ii][jj++] = "人力资源-人事助理|人事助理"
    CCLOptions[ii][jj++] = "人力资源-招聘经理/主管|招聘经理/主管"
    CCLOptions[ii][jj++] = "人力资源-招聘专员/助理|招聘专员/助理"
    CCLOptions[ii][jj++] = "人力资源-薪资福利经理/主管|薪资福利经理/主管"
    CCLOptions[ii][jj++] = "人力资源-薪资福利专员/助理|薪资福利专员/助理"
    CCLOptions[ii][jj++] = "人力资源-绩效考核经理/主管|绩效考核经理/主管"
    CCLOptions[ii][jj++] = "人力资源-绩效考核专员/助理|绩效考核专员/助理"
    CCLOptions[ii][jj++] = "人力资源-培训经理/主管|培训经理/主管"
    CCLOptions[ii][jj++] = "人力资源-培训专员/助理/培训师|培训专员/助理/培训师"
    CCLOptions[ii][jj++] = "人力资源-员工关系|员工关系"
    CCLOptions[ii++][jj++] = "人力资源-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "高级管理-首席执行官CEO/总裁/总经理|首席执行官CEO/总裁/总经理"
    CCLOptions[ii][jj++] = "高级管理-首席运营官COO|首席运营官COO"
    CCLOptions[ii][jj++] = "高级管理-副总经理/副总裁|副总经理/副总裁"
    CCLOptions[ii][jj++] = "高级管理-合伙人|合伙人"
    CCLOptions[ii][jj++] = "高级管理-总监|总监"
    CCLOptions[ii][jj++] = "高级管理-办事处首席代表|办事处首席代表"
    CCLOptions[ii][jj++] = "高级管理-办事处/分公司/分支机构经理|办事处/分公司/分支机构经理"
    CCLOptions[ii][jj++] = "高级管理-总裁助理/总经理助理|总裁助理/总经理助理"
    CCLOptions[ii++][jj++] = "高级管理-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "行政/后勤-行政总监|行政总监"
    CCLOptions[ii][jj++] = "行政/后勤-行政经理/主管/办公室主任|行政经理/主管/办公室主任"
    CCLOptions[ii][jj++] = "行政/后勤-行政专员/助理|行政专员/助理"
    CCLOptions[ii][jj++] = "行政/后勤-经理助理/秘书|经理助理/秘书"
    CCLOptions[ii][jj++] = "行政/后勤-前台接待/总机/接待生|前台接待/总机/接待生"
    CCLOptions[ii][jj++] = "行政/后勤-后勤|后勤"
    CCLOptions[ii][jj++] = "行政/后勤-图书管理员/资料管理员|图书管理员/资料管理员"
    CCLOptions[ii][jj++] = "行政/后勤-电脑操作员/打字员|电脑操作员/打字员"
    CCLOptions[ii++][jj++] = "行政/后勤-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "咨询/顾问-专业顾问|专业顾问"
    CCLOptions[ii][jj++] = "咨询/顾问-咨询总监|咨询总监"
    CCLOptions[ii][jj++] = "咨询/顾问-咨询经理|咨询经理"
    CCLOptions[ii][jj++] = "咨询/顾问-专业培训师|专业培训师"
    CCLOptions[ii][jj++] = "咨询/顾问-咨询员|咨询员"
    CCLOptions[ii][jj++] = "咨询/顾问-情报信息分析人员|情报信息分析人员"
    CCLOptions[ii++][jj++] = "咨询/顾问-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "律师/法务-律师/法律顾问|律师/法律顾问"
    CCLOptions[ii][jj++] = "律师/法务-律师助理|律师助理"
    CCLOptions[ii][jj++] = "律师/法务-法务经理|法务经理"
    CCLOptions[ii][jj++] = "律师/法务-法务主管/专员|法务主管/专员"
    CCLOptions[ii][jj++] = "律师/法务-法务助理|法务助理"
    CCLOptions[ii][jj++] = "律师/法务-知识产权/专利顾问/专员|知识产权/专利顾问/专员"
    CCLOptions[ii++][jj++] = "律师/法务-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "教师-大学教授|大学教授"
    CCLOptions[ii][jj++] = "教师-讲师/助教|讲师/助教"
    CCLOptions[ii][jj++] = "教师-中学教师|中学教师"
    CCLOptions[ii][jj++] = "教师-小学教师|小学教师"
    CCLOptions[ii][jj++] = "教师-幼教|幼教"
    CCLOptions[ii][jj++] = "教师-院校教务管理人员|院校教务管理人员"
    CCLOptions[ii][jj++] = "教师-兼职教师|兼职教师"
    CCLOptions[ii][jj++] = "教师-家教|家教"
    CCLOptions[ii++][jj++] = "教师-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "科研人员-科研管理人员|科研管理人员"
    CCLOptions[ii][jj++] = "科研人员-科研人员|科研人员"
    CCLOptions[ii++][jj++] = "科研人员-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "餐饮/娱乐-餐饮/娱乐管理|餐饮/娱乐管理"
    CCLOptions[ii][jj++] = "餐饮/娱乐-餐饮/娱乐领班|餐饮/娱乐领班"
    CCLOptions[ii][jj++] = "餐饮/娱乐-餐饮/娱乐服务员|餐饮/娱乐服务员"
    CCLOptions[ii][jj++] = "餐饮/娱乐-礼仪/迎宾|礼仪/迎宾"
    CCLOptions[ii][jj++] = "餐饮/娱乐-司仪|司仪"
    CCLOptions[ii][jj++] = "餐饮/娱乐-行政主厨/厨师长|行政主厨/厨师长"
    CCLOptions[ii][jj++] = "餐饮/娱乐-厨师|厨师"
    CCLOptions[ii][jj++] = "餐饮/娱乐-调酒师|调酒师"
    CCLOptions[ii][jj++] = "餐饮/娱乐-茶艺师|茶艺师"
    CCLOptions[ii++][jj++] = "餐饮/娱乐-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "酒店/旅游-酒店/宾馆经理|酒店/宾馆经理"
    CCLOptions[ii][jj++] = "酒店/旅游-酒店/宾馆营销|酒店/宾馆营销"
    CCLOptions[ii][jj++] = "酒店/旅游-大堂经理|大堂经理"
    CCLOptions[ii][jj++] = "酒店/旅游-楼面经理|楼面经理"
    CCLOptions[ii][jj++] = "酒店/旅游-前厅接待|前厅接待"
    CCLOptions[ii][jj++] = "酒店/旅游-客房服务员/楼面服务员|客房服务员/楼面服务员"
    CCLOptions[ii][jj++] = "酒店/旅游-行李员|行李员"
    CCLOptions[ii][jj++] = "酒店/旅游-清洁服务人员|清洁服务人员"
    CCLOptions[ii][jj++] = "酒店/旅游-导游/旅行顾问|导游/旅行顾问"
    CCLOptions[ii][jj++] = "酒店/旅游-订票/订房服务|订票/订房服务"
    CCLOptions[ii++][jj++] = "酒店/旅游-其它职位|其它职位"   
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "美容/保健-美容顾问/化妆|美容顾问/化妆"
    CCLOptions[ii][jj++] = "美容/保健-美容助理/见席美容师|美容助理/见席美容师"
    CCLOptions[ii][jj++] = "美容/保健-瘦身顾问|瘦身顾问"
    CCLOptions[ii][jj++] = "美容/保健-发型师|发型师"
    CCLOptions[ii][jj++] = "美容/保健-发型助理/学徒|发型助理/学徒"
    CCLOptions[ii][jj++] = "美容/保健-美甲师|美甲师"
    CCLOptions[ii][jj++] = "美容/保健-按摩/足疗|按摩/足疗"
    CCLOptions[ii][jj++] = "美容/保健-健身顾问/教练|健身顾问/教练"
    CCLOptions[ii][jj++] = "美容/保健-瑜伽/舞蹈老师|瑜伽/舞蹈老师"
    CCLOptions[ii][jj++] = "美容/保健-宠物护理/美容|宠物护理/美容"
    CCLOptions[ii++][jj++] = "美容/保健-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "百货/连锁/零售服务-店长/卖场经理|店长/卖场经理"
    CCLOptions[ii][jj++] = "百货/连锁/零售服务-店员/营业员|店员/营业员"
    CCLOptions[ii][jj++] = "百货/连锁/零售服务-收银员|收银员"
    CCLOptions[ii][jj++] = "百货/连锁/零售服务-理货员/陈列员|理货员/陈列员"
    CCLOptions[ii][jj++] = "百货/连锁/零售服务-导购员|导购员"
    CCLOptions[ii][jj++] = "百货/连锁/零售服务-兼职店员|兼职店员"
    CCLOptions[ii++][jj++] = "百货/连锁/零售服务-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "交通运输服务-飞机机长/副机长|飞机机长/副机长"
    CCLOptions[ii][jj++] = "交通运输服务-空乘人员|空乘人员"
    CCLOptions[ii][jj++] = "交通运输服务-地勤人员|地勤人员"
    CCLOptions[ii][jj++] = "交通运输服务-列车车长|列车车长"
    CCLOptions[ii][jj++] = "交通运输服务-列车司机|列车司机"
    CCLOptions[ii][jj++] = "交通运输服务-乘务员|乘务员"
    CCLOptions[ii][jj++] = "交通运输服务-船长/副船长|船长/副船长"
    CCLOptions[ii][jj++] = "交通运输服务-船员|船员"
    CCLOptions[ii][jj++] = "交通运输服务-司机|司机"
    CCLOptions[ii++][jj++] = "交通运输服务-其它职位|其它职位"   
    
    jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "保安/家政/其他服务-保安人员|保安人员"
    CCLOptions[ii][jj++] = "保安/家政/其他服务-保镖|保镖"
    CCLOptions[ii][jj++] = "保安/家政/其他服务-寻呼员/话务员|寻呼员/话务员"
    CCLOptions[ii][jj++] = "保安/家政/其他服务-搬运工|搬运工"
    CCLOptions[ii][jj++] = "保安/家政/其他服务-清洁工|清洁工"
    CCLOptions[ii][jj++] = "保安/家政/其他服务-家政服务/保姆|家政服务/保姆"
    CCLOptions[ii++][jj++] = "保安/家政/其他服务-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "公务员-公务员|公务员"
    CCLOptions[ii++][jj++] = "公务员-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "翻译-英语翻译|英语翻译"
    CCLOptions[ii][jj++] = "翻译-日语翻译|日语翻译"
    CCLOptions[ii][jj++] = "翻译-德语翻译|德语翻译"
    CCLOptions[ii][jj++] = "翻译-法语翻译|法语翻译"
    CCLOptions[ii][jj++] = "翻译-俄语翻译|俄语翻译"
    CCLOptions[ii][jj++] = "翻译-意大利语翻译|意大利语翻译"
    CCLOptions[ii][jj++] = "翻译-西班牙语翻译|西班牙语翻译"
    CCLOptions[ii][jj++] = "翻译-葡萄牙语翻译|葡萄牙语翻译"
    CCLOptions[ii][jj++] = "翻译-阿拉伯语翻译|阿拉伯语翻译"
    CCLOptions[ii][jj++] = "翻译-韩语翻译|韩语翻译"
    CCLOptions[ii][jj++] = "翻译-泰语翻译|泰语翻译"
    CCLOptions[ii][jj++] = "翻译-中国方言翻译|中国方言翻译"
    CCLOptions[ii++][jj++] = "翻译-其他语种翻译|其他语种翻译"   
    
           jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "在校学生-研究生|研究生"
    CCLOptions[ii][jj++] = "在校学生-大学/大专应届毕业生|大学/大专应届毕业生"
    CCLOptions[ii][jj++] = "在校学生-中专/职校生|中专/职校生"
    CCLOptions[ii++][jj++] = "在校学生-其它|其它"   
    
            jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "储备干部/培训生/实习生-储备干部|储备干部"
    CCLOptions[ii][jj++] = "储备干部/培训生/实习生-培训生|培训生"
    CCLOptions[ii][jj++] = "储备干部/培训生/实习生-实习生|实习生"
    CCLOptions[ii++][jj++] = "储备干部/培训生/实习生-其它职位|其它职位"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "兼职-|兼职"
    CCLOptions[ii++][jj++] = "兼职-其它|其它"
    
        jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii++][jj++] = "其他-其它职位|其它职位"  
    
    ii = 0
    jj = 0
}

// Job Category Associate List Object
function JobCategoryAssociateList(instance, parent, child, optionList)
{
    this.parent           = parent;              // 父选择框
    this.child            = child;               // 子选择框

    this.instance         = instance;            // 与对象关联的选择框实例

    this.optionList       = optionList;          // 选择框选项列表
    this.initValue        = null;                // 选择框初始值
    
    this.addedOptions     = null;                // 附加选项

    this.incPValue        = false;               // 包含父值
    this.incPValueFormat  = "%PText%";           // 包含父值的选项的文本格式

    this.allowEmpty       = false;               // 允许空选项列表

    this.init             = InitJobCategorySelector;   // 初始化方法
    this.SetSelectedValue = SetSelectedValue;          // 设置选中值方法

    this.instance.associateObject = this;       // 关联对象与选择框
}

// 选择列表初始化方法
function InitJobCategorySelector()
{
    if( this.instance )                                         // 实例存在
    {
        var i, aIndex, aLength, aValueText;
        if( this.child )                                        // 子选择框存在, 则实例为父选择框
        {
           this.instance.length = 0;                           // 清空实例
            if( this.addedOptions != null )                     // 附加选项
            {
                for( i = 0; i<this.addedOptions.length; i++ )
                {
                    aValueText = this.addedOptions[i].split("|");
                    if( aValueText.length > 0 )                 // 添加选项
                    {
                        this.instance.options[this.instance.length] = new Option(aValueText[1], aValueText[0]);
                        if( aValueText[0] == this.initValue )   // 选中初始值
                            this.instance.options[this.instance.length-1].selected = true;
                    }
                }
            }
            for( i = 0; i<this.optionList.length; i++ )
            {
                aValueText = this.optionList[i].split("|");
                if( aValueText.length > 0 )                     // 添加选项
                {
                    this.instance.options[this.instance.length] = new Option(aValueText[1], aValueText[0]);
                    if( aValueText[0] == this.initValue )       // 选中初始值
                        this.instance.options[this.instance.length-1].selected = true;
                }
            }
            this.instance.onchange = parentCategoryChanged;
        }
        else if( this.parent )                                  // 父选择框存在, 则实例为子选择框
        {
			this.parent.onchange();
        }
    }
}

// 父选择列表值改变事件方法
function parentCategoryChanged()
{
    if( this.associateObject )
    {
        var i, aLength, aObject, aChildObject, aIndex, aValueText;
        var aParentValue, aParentText;

        aObject = this.associateObject;
        aChildObject = aObject.child.associateObject;
        aParentValue = this.options[this.selectedIndex].value;
        aParentText  = this.options[this.selectedIndex].text;
        aLength = 0;

        aObject.child.length = 0;                               // 清空实例

        if( aObject.addedOptions )                              // 父选择框附加选项数
            aLength = aObject.addedOptions.length;

        if( this.selectedIndex >= aLength )                     // 父选择框选中项不在附加选项中
        {
            aIndex = this.selectedIndex - aLength;
            if( aChildObject.incPValue )                            // 包含父值
            {
                aObject.child.options[aObject.child.length] = new Option(
                    aChildObject.incPValueFormat.replace("%PText%", this.options[this.selectedIndex].text),
                    aParentValue);
                if( aParentValue == aChildObject.initValue )       // 选中初始值
                    aObject.child.options[aObject.child.length-1].selected = true;
            }

            for( i=0; i<aChildObject.optionList[aIndex].length; i++ )
            {
                aValueText = aChildObject.optionList[aIndex][i].split("|");
                if( aValueText.length > 0 && aValueText[0] != aParentValue)       // 添加选项
                {
                    aObject.child.options[aObject.child.length] = new Option(aValueText[1], aValueText[0]);
                    if( aValueText[0] == aChildObject.initValue )       // 选中初始值
                        aObject.child.options[aObject.child.length-1].selected = true;
                }
            }
            if( !aChildObject.allowEmpty && aObject.child.length == 0)
            {
                aObject.child.options[aObject.child.length] = new Option(aParentText, aParentValue);
            }
        }
        else
        {
            if( aChildObject.addedOptions != null )                  // 附加选项
            {
                for( i = 0;i<aChildObject.addedOptions.length; i++ )
                {
                    aValueText = aChildObject.addedOptions[i].split("|");
                    if( aValueText.length > 0 )                 // 添加选项
                    {
                        aObject.child.options[aObject.child.length] = new Option(aValueText[1], aValueText[0]);
                        if( aValueText[0] == aChildObject.initValue )   // 选中初始值
                            aObject.child.options[aObject.child.length-1].selected = true;
                    }
                }
            }
        }
    }
}

function SetSelectedValue(aValue, aWantProcessed)
{
    if( this.instance )
    {
        var optionValue = aValue;
        if( aWantProcessed )
        {
            var optionValues = optionValue.split("-");
            if( optionValues.length > 0 )
                optionValue = optionValues[0] + "-";
        }
       for( i = 0;i<this.instance.options.length; i++ )
        {
           if( this.instance.options[i].value == optionValue )
            {
                this.instance.options[i].selected = true;
                if( this.child )
                {
					this.instance.onchange();
                    this.child.associateObject.SetSelectedValue(aValue, false);
                }
                break;
            }
        }
    }
}