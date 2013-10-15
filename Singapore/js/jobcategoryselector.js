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
    
    PCLOptions[ii++] = "1000-|计算机业(IT)类"
    PCLOptions[ii++] = "1100-|销售类"
    PCLOptions[ii++] = "1200-|市场营销/公关类"
    PCLOptions[ii++] = "1300-|客户服务类"
    PCLOptions[ii++] = "1400-|经营/管理类"
    PCLOptions[ii++] = "1500-|财务/审(统)计类"
    PCLOptions[ii++] = "1600-|企业文职类"
    PCLOptions[ii++] = "1700-|行政/人事类"
    PCLOptions[ii++] = "1800-|工业/工厂类"
    PCLOptions[ii++] = "1900-|电子通讯/电气(器)类"
    PCLOptions[ii++] = "2000-|机械(电)/仪表类"
    PCLOptions[ii++] = "2100-|金融/保险/证券类"
    PCLOptions[ii++] = "2200-|房地产/建筑施工类"
    PCLOptions[ii++] = "2300-|广告(装潢、包装)设计类"
    PCLOptions[ii++] = "2400-|文体/教育/培训类"
    PCLOptions[ii++] = "2500-|卫生医疗/美容保健类"
    PCLOptions[ii++] = "2600-|化工/制药类"
    PCLOptions[ii++] = "2700-|能源动力类"
    PCLOptions[ii++] = "2800-|宾馆饭店/餐饮旅游类"
    PCLOptions[ii++] = "2900-|商店/零售服务类"
    PCLOptions[ii++] = "3000-|技工/普工类"
    PCLOptions[ii++] = "3100-|轻工类"
    PCLOptions[ii++] = "3200-|后勤保障类"
    PCLOptions[ii++] = "3300-|翻译类"
    PCLOptions[ii++] = "3400-|物流/贸易类"
    PCLOptions[ii++] = "3500-|咨询/顾问类"
    PCLOptions[ii++] = "3600-|法律专业人员类"
    PCLOptions[ii++] = "3700-|影视/摄影专业类"
    PCLOptions[ii++] = "3800-|编辑/发行类"
    PCLOptions[ii++] = "3900-|其他类"
    
    
    ii = 0
    jj = 0
    // ii = 0
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1000-1003|数据库开发与管理(DBA)"
    CCLOptions[ii][jj++] = "1000-1004|系统分析员"
    CCLOptions[ii][jj++] = "1000-1005|软件工程师"
    CCLOptions[ii][jj++] = "1000-1006|网页设计师"
    CCLOptions[ii][jj++] = "1000-1007|电脑美工"
    CCLOptions[ii][jj++] = "1000-1008|网站策划"
    CCLOptions[ii][jj++] = "1000-1009|网站编辑"
    CCLOptions[ii][jj++] = "1000-1010|网络工程师"
    CCLOptions[ii][jj++] = "1000-1013|栏目主持人"
    CCLOptions[ii][jj++] = "1000-1014|INTERNET/WEB/电子商务"
    CCLOptions[ii][jj++] = "1000-1015|测试工程师"
    CCLOptions[ii][jj++] = "1000-1016|MRP/ERP/SAP实施工程师"
    CCLOptions[ii][jj++] = "1000-1017|系统集成/技术支持"
    CCLOptions[ii][jj++] = "1000-1018|硬件工程师"
    CCLOptions[ii][jj++] = "1000-1019|系统维护员"
    CCLOptions[ii][jj++] = "1000-1020|计算机辅助设计与绘图"
    CCLOptions[ii][jj++] = "1000-1021|多媒体设计与开发"
    CCLOptions[ii][jj++] = "1000-1023|网络管理员"
    CCLOptions[ii++][jj++] = "1000-1099|其它相关职位"
    
    jj = 0
    // ii = 1
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1100-1103|销售部经理"
    CCLOptions[ii][jj++] = "1100-1104|销售主管"
    CCLOptions[ii][jj++] = "1100-1105|销售代表"
    CCLOptions[ii][jj++] = "1100-1106|销售助理"
    CCLOptions[ii][jj++] = "1100-1107|推（营、促）销员"
    CCLOptions[ii][jj++] = "1100-1108|销售工程师"
    CCLOptions[ii][jj++] = "1100-1109|商务经理/商务专员"
    CCLOptions[ii][jj++] = "1100-1110|商务人员"
    CCLOptions[ii][jj++] = "1100-1113|渠道经理"
    CCLOptions[ii][jj++] = "1100-1114|渠道主管"
    CCLOptions[ii][jj++] = "1100-1115|区域销售经理"
    CCLOptions[ii][jj++] = "1100-1116|分销经理"
    CCLOptions[ii++][jj++] = "1100-1199|其它相关职位"
    
    jj = 0
    // ii = 2
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1200-1203|市场/营销经理"
    CCLOptions[ii][jj++] = "1200-1204|市场助理/专员"
    CCLOptions[ii][jj++] = "1200-1205|市场部主管"
    CCLOptions[ii][jj++] = "1200-1206|市场调研/业务分析"
    CCLOptions[ii][jj++] = "1200-1207|市场/行销企划"
    CCLOptions[ii][jj++] = "1200-1208|产品/品牌企划"
    CCLOptions[ii][jj++] = "1200-1209|品牌经理"
    CCLOptions[ii][jj++] = "1200-1213|价格企划"
    CCLOptions[ii][jj++] = "1200-1214|广告企划"
    CCLOptions[ii][jj++] = "1200-1215|新闻媒介企划"
    CCLOptions[ii][jj++] = "1200-1216|市场推广/拓展/合作"
    CCLOptions[ii][jj++] = "1200-1217|促销/礼仪专员"
    CCLOptions[ii][jj++] = "1200-1218|公关经理"
    CCLOptions[ii][jj++] = "1200-1219|公关专员"
    CCLOptions[ii][jj++] = "1200-1223|美工师"
    CCLOptions[ii++][jj++] = "1200-1299|其它相关职位"
    
    jj = 0
    // ii = 3
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1300-1303|客户服务经理"
    CCLOptions[ii][jj++] = "1300-1304|客户数据库管理"
    CCLOptions[ii][jj++] = "1300-1305|客户关系管理"
    CCLOptions[ii][jj++] = "1300-1306|客户培训"
    CCLOptions[ii][jj++] = "1300-1307|客户咨询"
    CCLOptions[ii][jj++] = "1300-1308|热线咨询"
    CCLOptions[ii][jj++] = "1300-1309|客户服务"
    CCLOptions[ii][jj++] = "1300-1313|售前/售后支持"
    CCLOptions[ii][jj++] = "1300-1314|投诉处理"
    CCLOptions[ii][jj++] = "1300-1315|投诉监控"
    CCLOptions[ii][jj++] = "1300-1316|客户主任"
    CCLOptions[ii][jj++] = "1300-1317|接待处主任"
    CCLOptions[ii++][jj++] = "1300-1399|其它相关职位"
    
    jj = 0
    // ii = 4
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1400-1403|(正/副)总裁/总经理/CEO"
    CCLOptions[ii][jj++] = "1400-1404|厂长/副厂长"
    CCLOptions[ii][jj++] = "1400-1405|技术总监CTO"
    CCLOptions[ii][jj++] = "1400-1406|市场/营销总监"
    CCLOptions[ii][jj++] = "1400-1407|人力资源总监"
    CCLOptions[ii][jj++] = "1400-1408|行政总监"
    CCLOptions[ii][jj++] = "1400-1409|信息主管/CIO"
    CCLOptions[ii][jj++] = "1400-1410|管理顾问"
    CCLOptions[ii][jj++] = "1400-1411|工程总监"
    CCLOptions[ii][jj++] = "1400-1413|部门经理"
    CCLOptions[ii][jj++] = "1400-1414|部门主管"
    CCLOptions[ii][jj++] = "1400-1415|总经理助理"
    CCLOptions[ii][jj++] = "1400-1416|经理助理"
    CCLOptions[ii][jj++] = "1400-1417|项目经理"
    CCLOptions[ii][jj++] = "1400-1418|财务总监"
    CCLOptions[ii++][jj++] = "1400-1499|其它相关职位"
    
    jj = 0
    // ii = 5
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1500-1503|财务主管/经理"
    CCLOptions[ii][jj++] = "1500-1504|会计"
    CCLOptions[ii][jj++] = "1500-1505|会计助理"
    CCLOptions[ii][jj++] = "1500-1506|出纳"
    CCLOptions[ii][jj++] = "1500-1507|注册会计师"
    CCLOptions[ii][jj++] = "1500-1508|注册审计师"
    CCLOptions[ii][jj++] = "1500-1509|审计"
    CCLOptions[ii][jj++] = "1500-1510|总账主任"
    CCLOptions[ii][jj++] = "1500-1511|出纳主任"
    CCLOptions[ii][jj++] = "1500-1512|审计(核)主管"
    CCLOptions[ii][jj++] = "1500-1513|统计"
    CCLOptions[ii][jj++] = "1500-1514|财务分析"
    CCLOptions[ii][jj++] = "1500-1515|成本分析/核算"
    CCLOptions[ii][jj++] = "1500-1516|帐目(进出口)管理"
    CCLOptions[ii][jj++] = "1500-1522|营运会计经理"
    CCLOptions[ii][jj++] = "1500-1523|审计会计经理"
    CCLOptions[ii++][jj++] = "1500-1599|其它相关职位"
    
    jj = 0
    // ii = 6
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1600-1603|图书情报/档案管理"
    CCLOptions[ii][jj++] = "1600-1604|文案策划/资料编写"
    CCLOptions[ii][jj++] = "1600-1605|高级文员"
    CCLOptions[ii][jj++] = "1600-1606|高级秘书"
    CCLOptions[ii][jj++] = "1600-1607|电脑操作员/打字员"
    CCLOptions[ii][jj++] = "1600-1608|前台文员接待"
    CCLOptions[ii][jj++] = "1600-1609|话务员"
    CCLOptions[ii][jj++] = "1600-1613|文员"
    CCLOptions[ii++][jj++] = "1600-1699|其它相关职位"
    
    jj = 0
    // ii = 7
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1700-1703|人事经理"
    CCLOptions[ii][jj++] = "1700-1704|行政经理"
    CCLOptions[ii][jj++] = "1700-1705|人事助理"
    CCLOptions[ii][jj++] = "1700-1706|行政助理"
    CCLOptions[ii][jj++] = "1700-1707|人事文员"
    CCLOptions[ii][jj++] = "1700-1708|行政文员"
    CCLOptions[ii][jj++] = "1700-1709|总务"
    CCLOptions[ii][jj++] = "1700-1713|薪资福利经理/主管/专员"
    CCLOptions[ii][jj++] = "1700-1714|绩效考核经理/主管/专员"
    CCLOptions[ii][jj++] = "1700-1715|员工培训经理/主管"
    CCLOptions[ii][jj++] = "1700-1716|招聘经理/主任"
    CCLOptions[ii][jj++] = "1700-1717|招聘专员"
    CCLOptions[ii++][jj++] = "1700-1799|其它相关职位"
    
    jj = 0
    // ii = 8
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1800-1803|产品开发"
    CCLOptions[ii][jj++] = "1800-1804|生产经理"
    CCLOptions[ii][jj++] = "1800-1805|生管主管/督导"
    CCLOptions[ii][jj++] = "1800-1806|生管员"
    CCLOptions[ii][jj++] = "1800-1807|PE工程师"
    CCLOptions[ii][jj++] = "1800-1808|IE工程师"
    CCLOptions[ii][jj++] = "1800-1809|工艺工程师"
    CCLOptions[ii][jj++] = "1800-1813|组长/拉长"
    CCLOptions[ii][jj++] = "1800-1814|工程经理/主管"
    CCLOptions[ii][jj++] = "1800-1815|工程设备工程师"
    CCLOptions[ii][jj++] = "1800-1816|品管经理/主管"
    CCLOptions[ii][jj++] = "1800-1817|品质工程师"
    CCLOptions[ii][jj++] = "1800-1818|品管员"
    CCLOptions[ii][jj++] = "1800-1819|ISO专员"
    CCLOptions[ii][jj++] = "1800-1823|物控经理/主管"
    CCLOptions[ii][jj++] = "1800-1824|物控员"
    CCLOptions[ii][jj++] = "1800-1825|仓库管理员"
    CCLOptions[ii][jj++] = "1800-1826|计划员/调度员"
    CCLOptions[ii][jj++] = "1800-1827|设备经理/主管"
    CCLOptions[ii][jj++] = "1800-1828|化验/检验员"
    CCLOptions[ii][jj++] = "1800-1829|安全主任"
    CCLOptions[ii][jj++] = "1800-1832|采购主管"
    CCLOptions[ii][jj++] = "1800-1833|跟单员"
    CCLOptions[ii][jj++] = "1800-1834|统计员"
    CCLOptions[ii][jj++] = "1800-1835|采购员"
    CCLOptions[ii][jj++] = "1800-1836|SMT技术员"
    CCLOptions[ii][jj++] = "1800-1837|ME工程师"
    CCLOptions[ii][jj++] = "1800-1838|制造课长"
    CCLOptions[ii][jj++] = "1800-1839|RD经理"
    CCLOptions[ii++][jj++] = "1800-1899|其它相关职位"
    
    jj = 0
    // ii = 9
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "1900-1903|电子工程师"
    CCLOptions[ii][jj++] = "1900-1904|电气工程师"
    CCLOptions[ii][jj++] = "1900-1905|电器工程师"
    CCLOptions[ii][jj++] = "1900-1906|电力工程师"
    CCLOptions[ii][jj++] = "1900-1907|电信工程师/通讯工程师"
    CCLOptions[ii][jj++] = "1900-1908|变压器/磁电工程师"
    CCLOptions[ii][jj++] = "1900-1909|电声工程师"
    CCLOptions[ii][jj++] = "1900-1913|数码产品开发工程师"
    CCLOptions[ii][jj++] = "1900-1914|单片机/DSP/底层软件开发"
    CCLOptions[ii][jj++] = "1900-1915|电路(布线)设计"
    CCLOptions[ii][jj++] = "1900-1916|智能大厦/综合布线/弱电"
    CCLOptions[ii][jj++] = "1900-1917|光源与照明工程"
    CCLOptions[ii][jj++] = "1900-1918|灯饰研发工程师"
    CCLOptions[ii][jj++] = "1900-1919|电气维修"
    CCLOptions[ii][jj++] = "1900-1923|自动控制"
    CCLOptions[ii][jj++] = "1900-1924|无线电技术"
    CCLOptions[ii][jj++] = "1900-1925|半导体技术"
    CCLOptions[ii][jj++] = "1900-1926|家用电器"
    CCLOptions[ii][jj++] = "1900-1927|小家电"
    CCLOptions[ii][jj++] = "1900-1928|测试工程师"
    CCLOptions[ii++][jj++] = "1900-1999|其它相关职位"

    jj = 0
    // ii = 10
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2000-2003|机械设计与制造"
    CCLOptions[ii][jj++] = "2000-2004|机械工程师"
    CCLOptions[ii][jj++] = "2000-2005|机械工艺师"
    CCLOptions[ii][jj++] = "2000-2006|模具工程师"
    CCLOptions[ii][jj++] = "2000-2007|刀具工程师"
    CCLOptions[ii][jj++] = "2000-2008|CNC工程师"
    CCLOptions[ii][jj++] = "2000-2009|结构设计师"
    CCLOptions[ii][jj++] = "2000-2013|机电一体化"
    CCLOptions[ii][jj++] = "2000-2014|铸造/锻造"
    CCLOptions[ii][jj++] = "2000-2015|注塑成型"
    CCLOptions[ii][jj++] = "2000-2016|气动/液压"
    CCLOptions[ii][jj++] = "2000-2017|机械制图"
    CCLOptions[ii][jj++] = "2000-2018|精密机械/仪器仪表"
    CCLOptions[ii][jj++] = "2000-2019|设备修理"
    CCLOptions[ii][jj++] = "2000-2023|汽车/摩托车工程师"
    CCLOptions[ii][jj++] = "2000-2024|五金矿产/金属制品"
    CCLOptions[ii][jj++] = "2000-2025|锅炉/压力容器"
    CCLOptions[ii][jj++] = "2000-2026|纺织机械"
    CCLOptions[ii][jj++] = "2000-2027|船舶机械"
    CCLOptions[ii][jj++] = "2000-2028|食品机械"
    CCLOptions[ii][jj++] = "2000-2029|焊接机械"
    CCLOptions[ii++][jj++] = "2000-2099|其它相关职位"
    
    jj = 0
    // ii = 11
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2100-2103|证券期货"
    CCLOptions[ii][jj++] = "2100-2104|银行信贷"
    CCLOptions[ii][jj++] = "2100-2105|金融投资分析"
    CCLOptions[ii][jj++] = "2100-2106|融资经理/主管"
    CCLOptions[ii][jj++] = "2100-2107|出纳员/银行专员"
    CCLOptions[ii][jj++] = "2100-2108|预结算专员"
    CCLOptions[ii][jj++] = "2100-2109|税务专员"
    CCLOptions[ii][jj++] = "2100-2113|评估师"
    CCLOptions[ii][jj++] = "2100-2114|炒股操盘手"
    CCLOptions[ii][jj++] = "2100-2115|保险业务/保险经纪人/保险代理人"
    CCLOptions[ii++][jj++] = "2100-2199|其它相关职位"
    
    jj = 0
    // ii = 12
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2200-2203|房地产开发/策划"
    CCLOptions[ii][jj++] = "2200-2204|房地产评估"
    CCLOptions[ii][jj++] = "2200-2205|房地产中介"
    CCLOptions[ii][jj++] = "2200-2206|物业管理"
    CCLOptions[ii][jj++] = "2200-2207|建筑(结构)工程师"
    CCLOptions[ii][jj++] = "2200-2208|注册建筑师"
    CCLOptions[ii][jj++] = "2200-2209|建筑制图"
    CCLOptions[ii][jj++] = "2200-2213|工程监理"
    CCLOptions[ii][jj++] = "2200-2214|管道(水、电)"
    CCLOptions[ii][jj++] = "2200-2215|制冷暖通"
    CCLOptions[ii][jj++] = "2200-2216|给排水/供水(电)工程"
    CCLOptions[ii][jj++] = "2200-2217|工民建"
    CCLOptions[ii][jj++] = "2200-2218|工程预决算/施工"
    CCLOptions[ii][jj++] = "2200-2219|路桥技术/隧道工程"
    CCLOptions[ii][jj++] = "2200-2223|基建/岩土工程"
    CCLOptions[ii][jj++] = "2200-2224|港口与航道工程"
    CCLOptions[ii][jj++] = "2200-2225|园艺工程/园林技术"
    CCLOptions[ii++][jj++] = "2200-2299|其它相关职位"
    
    jj = 0
    // ii = 13
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2300-2303|平面设计"
    CCLOptions[ii][jj++] = "2300-2304|三维动画设计"
    CCLOptions[ii][jj++] = "2300-2305|多媒体设计与制作"
    CCLOptions[ii][jj++] = "2300-2306|产品包装设计"
    CCLOptions[ii][jj++] = "2300-2307|室内(外)装修/装潢设计"
    CCLOptions[ii][jj++] = "2300-2308|工艺品设计"
    CCLOptions[ii][jj++] = "2300-2309|工业产品设计"
    CCLOptions[ii][jj++] = "2300-2313|纺织/服饰(装)设计"
    CCLOptions[ii][jj++] = "2300-2314|形象设计"
    CCLOptions[ii][jj++] = "2300-2315|玩具设计"
    CCLOptions[ii][jj++] = "2300-2316|珠宝设计"
    CCLOptions[ii][jj++] = "2300-2317|文案/媒体策划"
    CCLOptions[ii][jj++] = "2300-2318|广告设计/创意策划"
    CCLOptions[ii++][jj++] = "2300-2399|其它相关职位"
    
    jj = 0
    // ii = 14
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2400-2403|新闻出版"
    CCLOptions[ii][jj++] = "2400-2404|记者"
    CCLOptions[ii][jj++] = "2400-2405|广播电视(影)"
    CCLOptions[ii][jj++] = "2400-2406|文化艺术"
    CCLOptions[ii][jj++] = "2400-2407|高等教育"
    CCLOptions[ii][jj++] = "2400-2408|中级教育"
    CCLOptions[ii][jj++] = "2400-2409|小学/幼儿教育"
    CCLOptions[ii][jj++] = "2400-2413|竞技/体育"
    CCLOptions[ii][jj++] = "2400-2414|职业教育/培训"
    CCLOptions[ii][jj++] = "2400-2415|家教"
    CCLOptions[ii][jj++] = "2400-2416|记者"
    CCLOptions[ii++][jj++] = "2400-2499|其它相关职位"
    
    jj = 0
    // ii = 15
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2500-2503|医生/医师"
    CCLOptions[ii][jj++] = "2500-2504|牙科医生"
    CCLOptions[ii][jj++] = "2500-2505|心理医生"
    CCLOptions[ii][jj++] = "2500-2506|外科医生"
    CCLOptions[ii][jj++] = "2500-2507|妇产科医生"
    CCLOptions[ii][jj++] = "2500-2508|预防医生"
    CCLOptions[ii][jj++] = "2500-2509|护士/护理"
    CCLOptions[ii][jj++] = "2500-2513|保健/健美"
    CCLOptions[ii][jj++] = "2500-2514|美容/美发"
    CCLOptions[ii][jj++] = "2500-2515|药剂/中药/西药/药检"
    CCLOptions[ii][jj++] = "2500-2516|针灸推拿"
    CCLOptions[ii][jj++] = "2500-2517|临床医学"
    CCLOptions[ii][jj++] = "2500-2518|妇幼保健"
    CCLOptions[ii][jj++] = "2500-2519|卫生防疫"
    CCLOptions[ii][jj++] = "2500-2523|医药代表"
    CCLOptions[ii][jj++] = "2500-2524|医药检验"
    CCLOptions[ii][jj++] = "2500-2525|兽医"
    CCLOptions[ii++][jj++] = "2500-2599|其它相关职位"
    
    jj = 0
    // ii = 16
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2600-2603|日用化工"
    CCLOptions[ii][jj++] = "2600-2604|生物化工/生物制药"
    CCLOptions[ii][jj++] = "2600-2605|造纸/废品处理"
    CCLOptions[ii][jj++] = "2600-2606|化学药剂/药品"
    CCLOptions[ii][jj++] = "2600-2607|玻璃/硅酸盐工业"
    CCLOptions[ii][jj++] = "2600-2608|农药、化肥"
    CCLOptions[ii][jj++] = "2600-2609|无机化工"
    CCLOptions[ii][jj++] = "2600-2613|有机化工"
    CCLOptions[ii][jj++] = "2600-2614|精细化工"
    CCLOptions[ii][jj++] = "2600-2615|分析化工"
    CCLOptions[ii][jj++] = "2600-2616|高分子化工/化纤/新材料"
    CCLOptions[ii][jj++] = "2600-2617|电镀化工"
    CCLOptions[ii++][jj++] = "2600-2699|其它相关职位"
    
    jj = 0
    // ii = 17
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2700-2703|水利、水电"
    CCLOptions[ii][jj++] = "2700-2704|核电、火电"
    CCLOptions[ii][jj++] = "2700-2705|电厂、电力"
    CCLOptions[ii][jj++] = "2700-2706|制冷、暖通"
    CCLOptions[ii][jj++] = "2700-2707|空调、锅炉"
    CCLOptions[ii][jj++] = "2700-2708|石油\天燃气\储运"
    CCLOptions[ii][jj++] = "2700-2709|子类燃气"
    CCLOptions[ii++][jj++] = "2700-2799|其它相关职位"
    
    jj = 0
    // ii = 18
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2800-2803|大堂经理/副理"
    CCLOptions[ii][jj++] = "2800-2804|酒店管理"
    CCLOptions[ii][jj++] = "2800-2805|楼面经理/主任"
    CCLOptions[ii][jj++] = "2800-2806|服务员/侍者/门童"
    CCLOptions[ii][jj++] = "2800-2807|高级厨师/调酒师"
    CCLOptions[ii][jj++] = "2800-2809|前台接待/礼仪/接线生"
    CCLOptions[ii][jj++] = "2800-2813|业务经理"
    CCLOptions[ii][jj++] = "2800-2814|线路开发主管"
    CCLOptions[ii][jj++] = "2800-2815|计调经理"
    CCLOptions[ii][jj++] = "2800-2816|导游"
    CCLOptions[ii][jj++] = "2800-2817|伴游"
    CCLOptions[ii++][jj++] = "2800-2899|其它相关职位"
    
    jj = 0
    // ii = 19
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "2900-2903|店长"
    CCLOptions[ii][jj++] = "2900-2904|营销主管"
    CCLOptions[ii][jj++] = "2900-2905|营业员/服务员/店员"
    CCLOptions[ii][jj++] = "2900-2906|理货员"
    CCLOptions[ii][jj++] = "2900-2907|导购员"
    CCLOptions[ii][jj++] = "2900-2908|收银员"
    CCLOptions[ii++][jj++] = "2900-2999|其它相关职位"
    
    jj = 0
    // ii = 20
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3000-3003|车、铣、刨、磨"
    CCLOptions[ii][jj++] = "3000-3004|钳、钣、铆、冲、焊、铸"
    CCLOptions[ii][jj++] = "3000-3005|裁、剪、车、缝、熨、烫"
    CCLOptions[ii][jj++] = "3000-3006|水工/木工/油漆工"
    CCLOptions[ii][jj++] = "3000-3007|电工/锅炉工"
    CCLOptions[ii][jj++] = "3000-3008|普通工人"
    CCLOptions[ii++][jj++] = "3000-3099|其它相关职位"
    
    jj = 0
    // ii = 21
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3100-3103|服装纺织"
    CCLOptions[ii][jj++] = "3100-3104|印刷/染整技术"
    CCLOptions[ii][jj++] = "3100-3105|纸浆造纸工艺"
    CCLOptions[ii][jj++] = "3100-3106|制鞋/制衣/制革/手袋"
    CCLOptions[ii][jj++] = "3100-3107|食品工程/糖酒饮料/粮油副食"
    CCLOptions[ii][jj++] = "3100-3108|陶瓷技术"
    CCLOptions[ii][jj++] = "3100-3109|金银首饰加工"
    CCLOptions[ii++][jj++] = "3100-3199|其它相关职位"
    
    jj = 0
    // ii = 22
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3200-3203|保安部经理"
    CCLOptions[ii][jj++] = "3200-3204|消防主任"
    CCLOptions[ii][jj++] = "3200-3205|保安"
    CCLOptions[ii][jj++] = "3200-3206|车务经理/主管"
    CCLOptions[ii][jj++] = "3200-3207|司机"
    CCLOptions[ii][jj++] = "3200-3208|寻呼/声讯服务"
    CCLOptions[ii][jj++] = "3200-3209|社区服务"
    CCLOptions[ii][jj++] = "3200-3210|搬运/清洁工/后勤"
    CCLOptions[ii][jj++] = "3200-3213|食堂厨师"
    CCLOptions[ii++][jj++] = "3200-3299|其它相关职位"
    
    jj = 0
    // ii = 23
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3300-3303|英语翻译"
    CCLOptions[ii][jj++] = "3300-3304|日语翻译"
    CCLOptions[ii][jj++] = "3300-3305|法语翻译"
    CCLOptions[ii][jj++] = "3300-3306|德语翻译"
    CCLOptions[ii][jj++] = "3300-3307|俄语翻译"
    CCLOptions[ii][jj++] = "3300-3308|朝鲜语翻译"
    CCLOptions[ii][jj++] = "3300-3309|西班牙语翻译"
    CCLOptions[ii++][jj++] = "3300-3399|其它相关职位"
    
    jj = 0
    // ii = 24
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3400-3403|物流经理"
    CCLOptions[ii][jj++] = "3400-3404|物流主管"
    CCLOptions[ii][jj++] = "3400-3405|仓库经理/主管"
    CCLOptions[ii][jj++] = "3400-3406|仓库管理员"
    CCLOptions[ii][jj++] = "3400-3407|运输经理/主管"
    CCLOptions[ii][jj++] = "3400-3408|单证员"
    CCLOptions[ii][jj++] = "3400-3409|快递员"
    CCLOptions[ii][jj++] = "3400-3413|物流操作员"
    CCLOptions[ii][jj++] = "3400-3414|船务人员"
    CCLOptions[ii][jj++] = "3400-3415|外销员"
    CCLOptions[ii][jj++] = "3400-3416|国际业务"
    CCLOptions[ii][jj++] = "3400-3417|报关员"
    CCLOptions[ii++][jj++] = "3400-3499|其它相关职位"
    
    jj = 0
    // ii = 25
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3500-3503|企业策划/顾问"
    CCLOptions[ii][jj++] = "3500-3504|企业管理/企管顾问"
    CCLOptions[ii][jj++] = "3500-3505|涉外咨询师"
    CCLOptions[ii][jj++] = "3500-3506|高级猎头顾问"
    CCLOptions[ii][jj++] = "3500-3507|咨询总监"
    CCLOptions[ii][jj++] = "3500-3508|咨询经理"
    CCLOptions[ii][jj++] = "3500-3509|咨询员"
    CCLOptions[ii][jj++] = "3500-3513|信息中介"
    CCLOptions[ii][jj++] = "3500-3514|专业顾问"
    CCLOptions[ii++][jj++] = "3500-3599|其它相关职位"

    jj = 0
    // ii = 26
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3600-3603|律师"
    CCLOptions[ii][jj++] = "3600-3604|法律顾问"
    CCLOptions[ii][jj++] = "3600-3605|法务人员"
    CCLOptions[ii][jj++] = "3600-3606|律师助理"
    CCLOptions[ii][jj++] = "3600-3607|书记员"
    CCLOptions[ii++][jj++] = "3600-3699|其它相关职位"
    
    jj = 0
    // ii = 27
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3700-3703|影视策划/制作人员"
    CCLOptions[ii][jj++] = "3700-3704|影音器材管理"
    CCLOptions[ii][jj++] = "3700-3705|演员"
    CCLOptions[ii][jj++] = "3700-3706|模特儿"
    CCLOptions[ii][jj++] = "3700-3707|摄影师"
    CCLOptions[ii][jj++] = "3700-3708|音效师"
    CCLOptions[ii][jj++] = "3700-3709|节目主持人"
    CCLOptions[ii++][jj++] = "3700-3799|其它相关职位"
    
    jj = 0
    // ii = 28
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3800-3803|总编"
    CCLOptions[ii][jj++] = "3800-3804|副总编"
    CCLOptions[ii][jj++] = "3800-3805|编辑主任"
    CCLOptions[ii][jj++] = "3800-3806|编辑"
    CCLOptions[ii][jj++] = "3800-3807|美术编辑"
    CCLOptions[ii][jj++] = "3800-3808|发行主管"
    CCLOptions[ii][jj++] = "3800-3809|发行助理"
    CCLOptions[ii++][jj++] = "3800-3899|其它相关职位"

    jj = 0
    // ii = 29
    CCLOptions[ii] = new Array()
    CCLOptions[ii][jj++] = "3900-3903|交通运输"
    CCLOptions[ii][jj++] = "3900-3904|声光技术"
    CCLOptions[ii][jj++] = "3900-3905|生物技术"
    CCLOptions[ii][jj++] = "3900-3906|测绘技术"
    CCLOptions[ii][jj++] = "3900-3907|激光技术"
    CCLOptions[ii][jj++] = "3900-3908|地质勘探"
    CCLOptions[ii][jj++] = "3900-3909|矿产冶金"
    CCLOptions[ii][jj++] = "3900-3913|环境工程"
    CCLOptions[ii][jj++] = "3900-3914|市政建设/子类规划"
    CCLOptions[ii][jj++] = "3900-3915|农、林、牧、渔、其他"
    CCLOptions[ii++][jj++] = "3900-3999|其它相关职位"

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