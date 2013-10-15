<!--  Place Associate List script written entirely in JavaScript  -->
<!--  Written by WenWei, 2001-2004. E-mail: wenwei(AT)blueidea.com  -->
// 地区选项列表
var ALOptions = new Array()

// 城市选项列表
var CLOptions = new Array()

GeneratePlaceList()

// 生成地区和城市选项列表
function GeneratePlaceList()
{
    var ii = 0
    var jj = 0
	
	
    ALOptions[ii++] = "北京-|北京市"   
    ALOptions[ii++] = "上海-|上海市"
    ALOptions[ii++] = "天津-|天津市"
    ALOptions[ii++] = "重庆-|重庆市"
    ALOptions[ii++] = "广东-|广东省"
    ALOptions[ii++] = "江苏-|江苏省"
    ALOptions[ii++] = "浙江-|浙江省"
    ALOptions[ii++] = "福建-|福建省"
    ALOptions[ii++] = "湖南-|湖南省"
    ALOptions[ii++] = "湖北-|湖北省"
    ALOptions[ii++] = "山东-|山东省"
    ALOptions[ii++] = "辽宁-|辽宁省"
    ALOptions[ii++] = "吉林-|吉林省"
    ALOptions[ii++] = "云南-|云南省"
    ALOptions[ii++] = "四川-|四川省"

    ALOptions[ii++] = "安徽-|安徽省"	
    ALOptions[ii++] = "江西-|江西省"
    ALOptions[ii++] = "黑龙江-|黑龙江省"
    ALOptions[ii++] = "河北-|河北省"
    ALOptions[ii++] = "陕西-|陕西省"
    ALOptions[ii++] = "海南-|海南省"
    ALOptions[ii++] = "河南-|河南省"
    ALOptions[ii++] = "山西-|山西省"
    ALOptions[ii++] = "内蒙古-|内蒙古自治区"
    ALOptions[ii++] = "广西-|广西壮族自治区"
    ALOptions[ii++] = "贵州-|贵州省"
    ALOptions[ii++] = "甘肃-|甘肃省"
    ALOptions[ii++] = "宁夏-|宁夏回族自治区"
    ALOptions[ii++] = "青海-|青海省"
    ALOptions[ii++] = "新疆-|新疆维吾尔自治区"
    ALOptions[ii++] = "西藏-|西藏自治区"
    ALOptions[ii++] = "台湾-|台湾省"
    ALOptions[ii++] = "香港-|香港特别行政区"
    ALOptions[ii++] = "澳门-|澳门特别行政区"
    ALOptions[ii++] = "国外-|国外"
    
    
    ii = 0

    jj = 0
    // ii = 15
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "北京-东城|├-东城区"
    CLOptions[ii][jj++] = "北京-西城|├-西城区"
    CLOptions[ii][jj++] = "北京-崇文|├-崇文区"
    CLOptions[ii][jj++] = "北京-宣武|├-宣武区"
    CLOptions[ii][jj++] = "北京-朝阳|├-朝阳区"
    CLOptions[ii][jj++] = "北京-海淀|├-海淀区"
    CLOptions[ii][jj++] = "北京-丰台|├-丰台区"
    CLOptions[ii][jj++] = "北京-石景山|├-石景山区"
    CLOptions[ii][jj++] = "北京-门头沟|├-门头沟区"
    CLOptions[ii][jj++] = "北京-房山|├-房山区"
    CLOptions[ii][jj++] = "北京-通州|├-通州区"
    CLOptions[ii][jj++] = "北京-顺义|├-顺义区"
    CLOptions[ii][jj++] = "北京-昌平|├-昌平区"
    CLOptions[ii][jj++] = "北京-大兴|├-大兴区"
    CLOptions[ii][jj++] = "北京-怀柔|├-怀柔区"
    CLOptions[ii][jj++] = "北京-平谷|├-平谷区"
    CLOptions[ii][jj++] = "北京-密云|├-密云县"
    CLOptions[ii][jj++] = "北京-延庆|├-延庆县"
    CLOptions[ii++][jj++] = "北京-其他|└-其他"
    
    jj = 0
    // ii = 4
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "上海-徐汇|├-徐汇区"
    CLOptions[ii][jj++] = "上海-卢湾|├-卢湾区"
    CLOptions[ii][jj++] = "上海-黄浦|├-黄浦区"
    CLOptions[ii][jj++] = "上海-静安|├-静安区"
    CLOptions[ii][jj++] = "上海-南市|├-南市区"
    CLOptions[ii][jj++] = "上海-杨浦|├-杨浦区"
    CLOptions[ii][jj++] = "上海-浦东|├-浦东区"
    CLOptions[ii][jj++] = "上海-虹口|├-虹口区"
    CLOptions[ii][jj++] = "上海-普陀|├-普陀区"
    CLOptions[ii][jj++] = "上海-闸北|├-闸北区"
    CLOptions[ii][jj++] = "上海-长宁|├-长宁区"
    CLOptions[ii][jj++] = "上海-闵行|├-闵行区"
    CLOptions[ii][jj++] = "上海-宝山|├-宝山区"
    CLOptions[ii][jj++] = "上海-嘉定|├-嘉定区"
    CLOptions[ii][jj++] = "上海-松江|├-松江区"
    CLOptions[ii][jj++] = "上海-青浦|├-青浦区"
    CLOptions[ii][jj++] = "上海-金山|├-金山区"
    CLOptions[ii][jj++] = "上海-奉贤|├-奉贤区"
    CLOptions[ii][jj++] = "上海-南汇|├-南汇区"
    CLOptions[ii][jj++] = "上海-崇明|├-崇明县"
    CLOptions[ii++][jj++] = "上海-其他|└-其他"
    
    jj = 0
    // ii = 1
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "天津-和平|├-和平区"
    CLOptions[ii][jj++] = "天津-河东|├-河东区"
    CLOptions[ii][jj++] = "天津-河西|├-河西区"
    CLOptions[ii][jj++] = "天津-南开|├-南开区"
    CLOptions[ii][jj++] = "天津-河北|├-河北区"
    CLOptions[ii][jj++] = "天津-红桥|├-红桥区"
    CLOptions[ii][jj++] = "天津-塘沽|├-塘沽区"
    CLOptions[ii][jj++] = "天津-汉沽|├-汉沽区"
    CLOptions[ii][jj++] = "天津-大港|├-大港区"
    CLOptions[ii][jj++] = "天津-东丽|├-东丽区"
    CLOptions[ii][jj++] = "天津-西青|├-西青区"
    CLOptions[ii][jj++] = "天津-北辰|├-北辰区"
    CLOptions[ii][jj++] = "天津-津南|├-津南区"
    CLOptions[ii][jj++] = "天津-武清|├-武清区"
    CLOptions[ii][jj++] = "天津-宝坻|├-宝坻区"
    CLOptions[ii][jj++] = "天津-静海|├-静海县"
    CLOptions[ii][jj++] = "天津-宁河|├-宁河县"
    CLOptions[ii][jj++] = "天津-蓟县|├-蓟县"
    CLOptions[ii++][jj++] = "天津-其他|└-其他"
    

    
    jj = 0
    // ii = 3
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "重庆-渝中|├-渝中区"
    CLOptions[ii][jj++] = "重庆-大渡口|├-大渡口区"
    CLOptions[ii][jj++] = "重庆-江北|├-江北区"
    CLOptions[ii][jj++] = "重庆-沙坪坝|├-沙坪坝区"
    CLOptions[ii][jj++] = "重庆-九龙坡|├-九龙坡区"
    CLOptions[ii][jj++] = "重庆-南岸|├-南岸区"
    CLOptions[ii][jj++] = "重庆-北碚|├-北碚区"
    CLOptions[ii][jj++] = "重庆-万盛|├-万盛区"
    CLOptions[ii][jj++] = "重庆-双桥|├-双桥区"
    CLOptions[ii][jj++] = "重庆-渝北|├-渝北区"
    CLOptions[ii][jj++] = "重庆-巴南|├-巴南区"
    CLOptions[ii][jj++] = "重庆-万州|├-万州区"
    CLOptions[ii][jj++] = "重庆-涪陵|├-涪陵区"
    CLOptions[ii][jj++] = "重庆-黔江|├-黔江区"
    CLOptions[ii][jj++] = "重庆-长寿|├-长寿区"
    CLOptions[ii][jj++] = "重庆-永川|├-永川市"
    CLOptions[ii][jj++] = "重庆-合川|├-合川市"
    CLOptions[ii][jj++] = "重庆-江津|├-江津市"
    CLOptions[ii][jj++] = "重庆-南川|├-南川市"
    CLOptions[ii++][jj++] = "重庆-其他|└-其他"
    
    
    jj = 0
    // ii = 4
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "广东-广州|├-广州市"
    CLOptions[ii][jj++] = "广东-深圳|├-深圳市"
    CLOptions[ii][jj++] = "广东-珠海|├-珠海市"
    CLOptions[ii][jj++] = "广东-东莞|├-东莞市"
    CLOptions[ii][jj++] = "广东-佛山|├-佛山市"
    CLOptions[ii][jj++] = "广东-汕头|├-汕头市"
    CLOptions[ii][jj++] = "广东-中山|├-中山市"
    CLOptions[ii][jj++] = "广东-湛江|├-湛江市"
    CLOptions[ii][jj++] = "广东-韶关|├-韶关市"
    CLOptions[ii][jj++] = "广东-河源|├-河源市"
    CLOptions[ii][jj++] = "广东-梅州|├-梅州市"
    CLOptions[ii][jj++] = "广东-惠州|├-惠州市"
    CLOptions[ii][jj++] = "广东-汕尾|├-汕尾市"
    CLOptions[ii][jj++] = "广东-江门|├-江门市"
    CLOptions[ii][jj++] = "广东-阳江|├-阳江市"
    CLOptions[ii][jj++] = "广东-茂名|├-茂名市"
    CLOptions[ii][jj++] = "广东-肇庆|├-肇庆市"
    CLOptions[ii][jj++] = "广东-清远|├-清远市"
    CLOptions[ii][jj++] = "广东-潮州|├-潮州市"
    CLOptions[ii][jj++] = "广东-揭阳|├-揭阳市"
    CLOptions[ii][jj++] = "广东-云浮|├-云浮市"
    CLOptions[ii++][jj++] = "广东-其他|└-其他"
    
    jj = 0
    // ii = 5
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "江苏-南京|├-南京市"
    CLOptions[ii][jj++] = "江苏-无锡|├-无锡市"
    CLOptions[ii][jj++] = "江苏-徐州|├-徐州市"
    CLOptions[ii][jj++] = "江苏-常州|├-常州市"
    CLOptions[ii][jj++] = "江苏-苏州|├-苏州市"
    CLOptions[ii][jj++] = "江苏-南通|├-南通市"
    CLOptions[ii][jj++] = "江苏-连云港|├-连云港市"
    CLOptions[ii][jj++] = "江苏-淮安|├-淮安市"
    CLOptions[ii][jj++] = "江苏-盐城|├-盐城市"
    CLOptions[ii][jj++] = "江苏-扬州|├-扬州市"
    CLOptions[ii][jj++] = "江苏-镇江|├-镇江市"
    CLOptions[ii][jj++] = "江苏-泰州|├-泰州市"
    CLOptions[ii][jj++] = "江苏-宿迁|├-宿迁市"
    CLOptions[ii][jj++] = "江苏-常熟|├-常熟市"
    CLOptions[ii][jj++] = "江苏-张家港|├-张家港市"
    CLOptions[ii][jj++] = "江苏-昆山|├-昆山市"
    CLOptions[ii][jj++] = "江苏-江阴|├-江阴市"
    CLOptions[ii][jj++] = "江苏-宜兴|├-宜兴市"
    CLOptions[ii++][jj++] = "江苏-其他|└-其他"
    
    jj = 0
    // ii = 6
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "浙江-杭州|├-杭州市"
    CLOptions[ii][jj++] = "浙江-宁波|├-宁波市"
    CLOptions[ii][jj++] = "浙江-温州|├-温州市"
    CLOptions[ii][jj++] = "浙江-嘉兴|├-嘉兴市"
    CLOptions[ii][jj++] = "浙江-湖州|├-湖州市"
    CLOptions[ii][jj++] = "浙江-绍兴|├-绍兴市"
    CLOptions[ii][jj++] = "浙江-金华|├-金华市"
    CLOptions[ii][jj++] = "浙江-衢州|├-衢州市"
    CLOptions[ii][jj++] = "浙江-舟山|├-舟山市"
    CLOptions[ii][jj++] = "浙江-台州|├-台州市"
    CLOptions[ii][jj++] = "浙江-丽水|├-丽水市"
    CLOptions[ii++][jj++] = "浙江-其他|└-其他"
    
    jj = 0
    // ii = 7
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "福建-福州|├-福州市"
    CLOptions[ii][jj++] = "福建-厦门|├-厦门市"
    CLOptions[ii][jj++] = "福建-莆田|├-莆田市"
    CLOptions[ii][jj++] = "福建-三明|├-三明市"
    CLOptions[ii][jj++] = "福建-泉州|├-泉州市"
    CLOptions[ii][jj++] = "福建-漳州|├-漳州市"
    CLOptions[ii][jj++] = "福建-南平|├-南平市"
    CLOptions[ii][jj++] = "福建-龙岩|├-龙岩市"
    CLOptions[ii][jj++] = "福建-宁德|├-宁德市"
    CLOptions[ii++][jj++] = "福建-其他|└-其他"
    
    jj = 0
    // ii = 8
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "湖南-长沙|├-长沙市"
    CLOptions[ii][jj++] = "湖南-株洲|├-株洲市"
    CLOptions[ii][jj++] = "湖南-湘潭|├-湘潭市"
    CLOptions[ii][jj++] = "湖南-衡阳|├-衡阳市"
    CLOptions[ii][jj++] = "湖南-邵阳|├-邵阳市"
    CLOptions[ii][jj++] = "湖南-岳阳|├-岳阳市"
    CLOptions[ii][jj++] = "湖南-常德|├-常德市"
    CLOptions[ii][jj++] = "湖南-张家界|├-张家界市"
    CLOptions[ii][jj++] = "湖南-益阳|├-益阳市"
    CLOptions[ii][jj++] = "湖南-郴州|├-郴州市"
    CLOptions[ii][jj++] = "湖南-永州|├-永州市"
    CLOptions[ii][jj++] = "湖南-怀化|├-怀化市"
    CLOptions[ii][jj++] = "湖南-娄底|├-娄底市"
    CLOptions[ii][jj++] = "湖南-湘西|├-湘西州"
    CLOptions[ii++][jj++] = "湖南-其他|└-其他"
    
    jj = 0
    // ii = 9
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "湖北-武汉|├-武汉市"
    CLOptions[ii][jj++] = "湖北-黄石|├-黄石市"
    CLOptions[ii][jj++] = "湖北-十堰|├-十堰市"
    CLOptions[ii][jj++] = "湖北-宜昌|├-宜昌市"
    CLOptions[ii][jj++] = "湖北-襄樊|├-襄樊市"
    CLOptions[ii][jj++] = "湖北-鄂州|├-鄂州市"
    CLOptions[ii][jj++] = "湖北-荆门|├-荆门市"
    CLOptions[ii][jj++] = "湖北-孝感|├-孝感市"
    CLOptions[ii][jj++] = "湖北-荆州|├-荆州市"
    CLOptions[ii][jj++] = "湖北-黄冈|├-黄冈市"
    CLOptions[ii][jj++] = "湖北-咸宁|├-咸宁市"
    CLOptions[ii][jj++] = "湖北-随州|├-随州市"
    CLOptions[ii][jj++] = "湖北-恩施|├-恩施州"
    CLOptions[ii][jj++] = "湖北-仙桃|├-仙桃市"
    CLOptions[ii][jj++] = "湖北-潜江|├-潜江市"
    CLOptions[ii][jj++] = "湖北-天门|├-天门市"
    CLOptions[ii][jj++] = "湖北-神农架|├-神农架"
    CLOptions[ii++][jj++] = "湖北-其他|└-其他"
    
    jj = 0
    // ii = 10
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "山东-济南|├-济南市"
    CLOptions[ii][jj++] = "山东-青岛|├-青岛市"
    CLOptions[ii][jj++] = "山东-淄博|├-淄博市"
    CLOptions[ii][jj++] = "山东-枣庄|├-枣庄市"
    CLOptions[ii][jj++] = "山东-东营|├-东营市"
    CLOptions[ii][jj++] = "山东-烟台|├-烟台市"
    CLOptions[ii][jj++] = "山东-潍坊|├-潍坊市"
    CLOptions[ii][jj++] = "山东-济宁|├-济宁市"
    CLOptions[ii][jj++] = "山东-泰安|├-泰安市"
    CLOptions[ii][jj++] = "山东-威海|├-威海市"
    CLOptions[ii][jj++] = "山东-日照|├-日照市"
    CLOptions[ii][jj++] = "山东-莱芜|├-莱芜市"
    CLOptions[ii][jj++] = "山东-临沂|├-临沂市"
    CLOptions[ii][jj++] = "山东-德州|├-德州市"
    CLOptions[ii][jj++] = "山东-聊城|├-聊城市"
    CLOptions[ii][jj++] = "山东-滨州|├-滨州市"
    CLOptions[ii][jj++] = "山东-荷泽|├-荷泽市"
    CLOptions[ii++][jj++] = "山东-其他|└-其他"

    jj = 0
    // ii = 11
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "辽宁-沈阳|├-沈阳市"
    CLOptions[ii][jj++] = "辽宁-大连|├-大连市"
    CLOptions[ii][jj++] = "辽宁-鞍山|├-鞍山市"
    CLOptions[ii][jj++] = "辽宁-抚顺|├-抚顺市"
    CLOptions[ii][jj++] = "辽宁-本溪|├-本溪市"
    CLOptions[ii][jj++] = "辽宁-丹东|├-丹东市"
    CLOptions[ii][jj++] = "辽宁-锦州|├-锦州市"
    CLOptions[ii][jj++] = "辽宁-葫芦岛|├-葫芦岛市"
    CLOptions[ii][jj++] = "辽宁-营口|├-营口市"
    CLOptions[ii][jj++] = "辽宁-盘锦|├-盘锦市"
    CLOptions[ii][jj++] = "辽宁-阜新|├-阜新市"
    CLOptions[ii][jj++] = "辽宁-辽阳|├-辽阳市"
    CLOptions[ii][jj++] = "辽宁-铁岭|├-铁岭市"
    CLOptions[ii][jj++] = "辽宁-朝阳|├-朝阳市"
    CLOptions[ii++][jj++] = "辽宁-其他|└-其他"
    
    jj = 0
    // ii = 12
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "吉林-长春|├-长春市"
    CLOptions[ii][jj++] = "吉林-吉林|├-吉林市"
    CLOptions[ii][jj++] = "吉林-四平|├-四平市"
    CLOptions[ii][jj++] = "吉林-辽源|├-辽源市"
    CLOptions[ii][jj++] = "吉林-通化|├-通化市"
    CLOptions[ii][jj++] = "吉林-白山|├-白山市"
    CLOptions[ii][jj++] = "吉林-松原|├-松原市"
    CLOptions[ii][jj++] = "吉林-白城|├-白城市"
    CLOptions[ii][jj++] = "吉林-延边|├-延边州"
    CLOptions[ii++][jj++] = "吉林-其他|└-其他"
    
    jj = 0
    // ii = 13
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "云南-昆明|├-昆明市"
    CLOptions[ii][jj++] = "云南-曲靖|├-曲靖市"
    CLOptions[ii][jj++] = "云南-玉溪|├-玉溪市"
    CLOptions[ii][jj++] = "云南-保山|├-保山市"
    CLOptions[ii][jj++] = "云南-昭通|├-昭通市"
    CLOptions[ii][jj++] = "云南-思茅|├-思茅市"
    CLOptions[ii][jj++] = "云南-临沧|├-临沧"
    CLOptions[ii][jj++] = "云南-丽江|├-丽江市"
    CLOptions[ii][jj++] = "云南-文山|├-文山州"
    CLOptions[ii][jj++] = "云南-红河|├-红河州"
    CLOptions[ii][jj++] = "云南-景洪|├-景洪市"
    CLOptions[ii][jj++] = "云南-大理|├-大理市"
    CLOptions[ii][jj++] = "云南-楚雄|├-楚雄市"
    CLOptions[ii][jj++] = "云南-怒江|├-怒江州"
    CLOptions[ii][jj++] = "云南-迪庆|├-迪庆"
    CLOptions[ii][jj++] = "云南-德宏|├-德宏州"
    CLOptions[ii++][jj++] = "云南-其他|└-其他"
    
    jj = 0
    // ii = 14
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "四川-成都|├-成都市"
    CLOptions[ii][jj++] = "四川-自贡|├-自贡市"
    CLOptions[ii][jj++] = "四川-攀枝花|├-攀枝花市"
    CLOptions[ii][jj++] = "四川-泸州|├-泸州市"
    CLOptions[ii][jj++] = "四川-德阳|├-德阳市"
    CLOptions[ii][jj++] = "四川-绵阳|├-绵阳市"
    CLOptions[ii][jj++] = "四川-广元|├-广元市"
    CLOptions[ii][jj++] = "四川-遂宁|├-遂宁市"
    CLOptions[ii][jj++] = "四川-内江|├-内江市"
    CLOptions[ii][jj++] = "四川-乐山|├-乐山市"
    CLOptions[ii][jj++] = "四川-南充|├-南充市"
    CLOptions[ii][jj++] = "四川-眉山|├-眉山市"
    CLOptions[ii][jj++] = "四川-宜宾|├-宜宾市"
    CLOptions[ii][jj++] = "四川-广安|├-广安市"
    CLOptions[ii][jj++] = "四川-达州|├-达州市"
    CLOptions[ii][jj++] = "四川-西昌|├-西昌市"
    CLOptions[ii][jj++] = "四川-雅安|├-雅安市"
    CLOptions[ii][jj++] = "四川-巴中|├-巴中市"
    CLOptions[ii][jj++] = "四川-资阳|├-资阳市"
    CLOptions[ii][jj++] = "四川-阿坝|├-阿坝州"
    CLOptions[ii][jj++] = "四川-甘孜|├-甘孜州"
    CLOptions[ii][jj++] = "四川-凉山|├-凉山州"
    CLOptions[ii++][jj++] = "四川-其他|└-其他"
    
	jj = 0
    // ii = 0
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "安徽-合肥|├-合肥市"
    CLOptions[ii][jj++] = "安徽-芜湖|├-芜湖市"
    CLOptions[ii][jj++] = "安徽-蚌埠|├-蚌埠市"
    CLOptions[ii][jj++] = "安徽-淮南|├-淮南市"
    CLOptions[ii][jj++] = "安徽-马鞍山|├-马鞍山市"
    CLOptions[ii][jj++] = "安徽-淮北|├-淮北市"
    CLOptions[ii][jj++] = "安徽-铜陵|├-铜陵市"
    CLOptions[ii][jj++] = "安徽-安庆|├-安庆市"
    CLOptions[ii][jj++] = "安徽-黄山|├-黄山市"
    CLOptions[ii][jj++] = "安徽-滁州|├-滁州市"
    CLOptions[ii][jj++] = "安徽-阜阳|├-阜阳市"
    CLOptions[ii][jj++] = "安徽-宿州|├-宿州市"
    CLOptions[ii][jj++] = "安徽-巢湖|├-巢湖市"
    CLOptions[ii][jj++] = "安徽-六安|├-六安市"
    CLOptions[ii][jj++] = "安徽-亳州|├-亳州市"
    CLOptions[ii][jj++] = "安徽-池州|├-池州市"
    CLOptions[ii][jj++] = "安徽-宣城|├-宣城市"
    CLOptions[ii++][jj++] = "安徽-其他|└-其他"

    jj = 0
    // ii = 16
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "江西-南昌|├-南昌市"
    CLOptions[ii][jj++] = "江西-景德镇|├-景德镇市"
    CLOptions[ii][jj++] = "江西-萍乡|├-萍乡市"
    CLOptions[ii][jj++] = "江西-九江|├-九江市"
    CLOptions[ii][jj++] = "江西-新余|├-新余市"
    CLOptions[ii][jj++] = "江西-鹰潭|├-鹰潭市"
    CLOptions[ii][jj++] = "江西-赣州|├-赣州市"
    CLOptions[ii][jj++] = "江西-吉安|├-吉安市"
    CLOptions[ii][jj++] = "江西-宜春|├-宜春市"
    CLOptions[ii][jj++] = "江西-抚州|├-抚州市"
    CLOptions[ii][jj++] = "江西-上饶|├-上饶市"
    CLOptions[ii++][jj++] = "江西-其他|└-其他"
    
    jj = 0
    // ii = 17
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "黑龙江-哈尔滨|├-哈尔滨市"
    CLOptions[ii][jj++] = "黑龙江-齐齐哈尔|├-齐齐哈尔市"
    CLOptions[ii][jj++] = "黑龙江-鹤岗|├-鹤岗市"
    CLOptions[ii][jj++] = "黑龙江-双鸭山|├-双鸭山市"
    CLOptions[ii][jj++] = "黑龙江-鸡西|├-鸡西市"
    CLOptions[ii][jj++] = "黑龙江-大庆|├-大庆市"
    CLOptions[ii][jj++] = "黑龙江-伊春|├-伊春市"
    CLOptions[ii][jj++] = "黑龙江-牡丹江|├-牡丹江市"
    CLOptions[ii][jj++] = "黑龙江-佳木斯|├-佳木斯市"
    CLOptions[ii][jj++] = "黑龙江-七台河|├-七台河市"
    CLOptions[ii][jj++] = "黑龙江-黑河|├-黑河市"
    CLOptions[ii][jj++] = "黑龙江-绥化|├-绥化市"
    CLOptions[ii][jj++] = "黑龙江-大兴安岭|├-大兴安岭"
    CLOptions[ii++][jj++] = "黑龙江-其他|└-其他"
    
    jj = 0
    // ii = 18
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "河北-石家庄|├-石家庄市"
    CLOptions[ii][jj++] = "河北-唐山|├-唐山市"
    CLOptions[ii][jj++] = "河北-秦皇岛|├-秦皇岛市"
    CLOptions[ii][jj++] = "河北-邯郸|├-邯郸市"
    CLOptions[ii][jj++] = "河北-邢台|├-邢台市"
    CLOptions[ii][jj++] = "河北-保定|├-保定市"
    CLOptions[ii][jj++] = "河北-张家口|├-张家口市"
    CLOptions[ii][jj++] = "河北-承德|├-承德市"
    CLOptions[ii][jj++] = "河北-沧州|├-沧州市"
    CLOptions[ii][jj++] = "河北-廊坊|├-廊坊市"
    CLOptions[ii][jj++] = "河北-衡水|├-衡水市"
    CLOptions[ii++][jj++] = "河北-其他|└-其他"
    
    jj = 0
    // ii = 19
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "陕西-西安|├-西安市"
    CLOptions[ii][jj++] = "陕西-铜川|├-铜川市"
    CLOptions[ii][jj++] = "陕西-宝鸡|├-宝鸡市"
    CLOptions[ii][jj++] = "陕西-咸阳|├-咸阳市"
    CLOptions[ii][jj++] = "陕西-渭南|├-渭南市"
    CLOptions[ii][jj++] = "陕西-延安|├-延安市"
    CLOptions[ii][jj++] = "陕西-汉中|├-汉中市"
    CLOptions[ii][jj++] = "陕西-榆林|├-榆林市"
    CLOptions[ii][jj++] = "陕西-安康|├-安康市"
    CLOptions[ii][jj++] = "陕西-商洛|├-商洛市"
    CLOptions[ii++][jj++] = "陕西-其他|└-其他"
    
    jj = 0
    // ii = 20
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "海南-海口|├-海口市"
    CLOptions[ii][jj++] = "海南-三亚|├-三亚市"
    CLOptions[ii][jj++] = "海南-五指山|├-五指山市"
    CLOptions[ii][jj++] = "海南-琼海|├-琼海市"
    CLOptions[ii][jj++] = "海南-儋州|├-儋州市"
    CLOptions[ii][jj++] = "海南-琼山|├-琼山市"
    CLOptions[ii][jj++] = "海南-文昌|├-文昌市"
    CLOptions[ii][jj++] = "海南-万宁|├-万宁市"
    CLOptions[ii][jj++] = "海南-东方|├-东方市"
    CLOptions[ii++][jj++] = "海南-其他|└-其他"
    
    jj = 0
    // ii = 21
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "河南-郑州|├-郑州市"
    CLOptions[ii][jj++] = "河南-开封|├-开封市"
    CLOptions[ii][jj++] = "河南-洛阳|├-洛阳市"
    CLOptions[ii][jj++] = "河南-平顶山|├-平顶山市"
    CLOptions[ii][jj++] = "河南-安阳|├-安阳市"
    CLOptions[ii][jj++] = "河南-鹤壁|├-鹤壁市"
    CLOptions[ii][jj++] = "河南-新乡|├-新乡市"
    CLOptions[ii][jj++] = "河南-焦作|├-焦作市"
    CLOptions[ii][jj++] = "河南-濮阳|├-濮阳市"
    CLOptions[ii][jj++] = "河南-许昌|├-许昌市"
    CLOptions[ii][jj++] = "河南-漯河|├-漯河市"
    CLOptions[ii][jj++] = "河南-三门峡|├-三门峡市"
    CLOptions[ii][jj++] = "河南-南阳|├-南阳市"
    CLOptions[ii][jj++] = "河南-商丘|├-商丘市"
    CLOptions[ii][jj++] = "河南-信阳|├-信阳市"
    CLOptions[ii][jj++] = "河南-周口|├-周口市"
    CLOptions[ii][jj++] = "河南-驻马店|├-驻马店市"
    CLOptions[ii++][jj++] = "河南-其他|└-其他"
  
    jj = 0
    // ii = 22
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "山西-太原|├-太原市"
    CLOptions[ii][jj++] = "山西-大同|├-大同市"
    CLOptions[ii][jj++] = "山西-阳泉|├-阳泉市"
    CLOptions[ii][jj++] = "山西-长治|├-长治市"
    CLOptions[ii][jj++] = "山西-晋城|├-晋城市"
    CLOptions[ii][jj++] = "山西-朔州|├-朔州市"
    CLOptions[ii][jj++] = "山西-晋中|├-晋中市"
    CLOptions[ii][jj++] = "山西-忻州|├-忻州市"
    CLOptions[ii][jj++] = "山西-临汾|├-临汾市"
    CLOptions[ii][jj++] = "山西-运城|├-运城市"
    CLOptions[ii][jj++] = "山西-吕梁|├-吕梁市"
    CLOptions[ii++][jj++] = "山西-其他|└-其他"
    
    jj = 0
    // ii = 23
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "内蒙古-呼和浩特|├-呼和浩特市"
    CLOptions[ii][jj++] = "内蒙古-包头|├-包头市"
    CLOptions[ii][jj++] = "内蒙古-乌海|├-乌海市"
    CLOptions[ii][jj++] = "内蒙古-赤峰|├-赤峰市"
    CLOptions[ii][jj++] = "内蒙古-通辽|├-通辽市"
    CLOptions[ii][jj++] = "内蒙古-鄂尔多斯|├-鄂尔多斯市"
    CLOptions[ii][jj++] = "内蒙古-呼伦贝尔|├-呼伦贝尔市"
    CLOptions[ii][jj++] = "内蒙古-乌兰察布|├-乌兰察布市"
    CLOptions[ii][jj++] = "内蒙古-锡林郭勒|├-锡林郭勒盟"
    CLOptions[ii][jj++] = "内蒙古-巴彦淖尔|├-巴彦淖尔市"
    CLOptions[ii][jj++] = "内蒙古-阿拉善|├-阿拉善盟"
    CLOptions[ii][jj++] = "内蒙古-兴安|├-兴安盟"
    CLOptions[ii++][jj++] = "内蒙古-其他|└-其他"
    
    jj = 0
    // ii = 24
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "广西-南宁|├-南宁市"
    CLOptions[ii][jj++] = "广西-柳州|├-柳州市"
    CLOptions[ii][jj++] = "广西-桂林|├-桂林市"
    CLOptions[ii][jj++] = "广西-梧州|├-梧州市"
    CLOptions[ii][jj++] = "广西-北海|├-北海市"
    CLOptions[ii][jj++] = "广西-防城港|├-防城港市"
    CLOptions[ii][jj++] = "广西-钦州|├-钦州市"
    CLOptions[ii][jj++] = "广西-贵港|├-贵港市"
    CLOptions[ii][jj++] = "广西-玉林|├-玉林市"
    CLOptions[ii][jj++] = "广西-百色|├-百色市"
    CLOptions[ii][jj++] = "广西-贺州|├-贺州市"
    CLOptions[ii][jj++] = "广西-河池|├-河池市"
    CLOptions[ii][jj++] = "广西-来宾|├-来宾市"
    CLOptions[ii][jj++] = "广西-崇左|├-崇左市"
    CLOptions[ii++][jj++] = "广西-其他|└-其他"
    
    jj = 0
    // ii = 25
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "贵州-贵阳|├-贵阳市"
    CLOptions[ii][jj++] = "贵州-六盘水|├-六盘水市"
    CLOptions[ii][jj++] = "贵州-遵义|├-遵义市"
    CLOptions[ii][jj++] = "贵州-安顺|├-安顺市"
    CLOptions[ii][jj++] = "贵州-铜仁|├-铜仁市"
    CLOptions[ii][jj++] = "贵州-毕节|├-毕节市"
    CLOptions[ii][jj++] = "贵州-都匀|├-都匀市"
    CLOptions[ii][jj++] = "贵州-兴义|├-兴义市"
    CLOptions[ii][jj++] = "贵州-凯里|├-凯里市"
    CLOptions[ii++][jj++] = "贵州-其他|└-其他"
    
    jj = 0
    // ii = 26
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "甘肃-兰州|├-兰州市"
    CLOptions[ii][jj++] = "甘肃-嘉峪关|├-嘉峪关市"
    CLOptions[ii][jj++] = "甘肃-金昌|├-金昌市"
    CLOptions[ii][jj++] = "甘肃-白银|├-白银市"
    CLOptions[ii][jj++] = "甘肃-天水|├-天水市"
    CLOptions[ii][jj++] = "甘肃-武威|├-武威市"
    CLOptions[ii][jj++] = "甘肃-张掖|├-张掖市"
    CLOptions[ii][jj++] = "甘肃-平凉|├-平凉市"
    CLOptions[ii][jj++] = "甘肃-酒泉|├-酒泉市"
    CLOptions[ii][jj++] = "甘肃-临夏|├-临夏州"
    CLOptions[ii][jj++] = "甘肃-庆阳|├-庆阳市"
    CLOptions[ii][jj++] = "甘肃-定西|├-定西市"
    CLOptions[ii][jj++] = "甘肃-陇南|├-陇南"
    CLOptions[ii][jj++] = "甘肃-甘南|├-甘南州"
    CLOptions[ii++][jj++] = "甘肃-其他|└-其他"
    
    jj = 0
    // ii = 27
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "宁夏-银川|├-银川市"
    CLOptions[ii][jj++] = "宁夏-青铜峡|├-青铜峡市"
    CLOptions[ii][jj++] = "宁夏-吴忠|├-吴忠市"
    CLOptions[ii][jj++] = "宁夏-石嘴山|├-石嘴山市"
    CLOptions[ii][jj++] = "宁夏-固原|├-固原市"
    CLOptions[ii][jj++] = "宁夏-中卫|├-中卫市"
    CLOptions[ii][jj++] = "宁夏-灵武|├-灵武市"
    CLOptions[ii++][jj++] = "宁夏-其他|└-其他"
    
    jj = 0
    // ii = 28
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "青海-西宁|├-西宁市"
    CLOptions[ii][jj++] = "青海-海东|├-海东"
    CLOptions[ii][jj++] = "青海-海北|├-海北州"
    CLOptions[ii][jj++] = "青海-黄南|├-黄南州"
    CLOptions[ii][jj++] = "青海-海南|├-海南州"
    CLOptions[ii][jj++] = "青海-果洛|├-果洛州"
    CLOptions[ii][jj++] = "青海-玉树|├-玉树州"
    CLOptions[ii][jj++] = "青海-海西|├-海西州"
    CLOptions[ii++][jj++] = "青海-其他|└-其他"
    
    jj = 0
    // ii = 29
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "新疆-乌鲁木齐|├-乌鲁木齐市"
    CLOptions[ii][jj++] = "新疆-克拉玛依|├-克拉玛依市"
    CLOptions[ii][jj++] = "新疆-吐鲁番|├-吐鲁番市"
    CLOptions[ii][jj++] = "新疆-哈密|├-哈密市"
    CLOptions[ii][jj++] = "新疆-昌吉|├-昌吉市"
    CLOptions[ii][jj++] = "新疆-博乐|├-博乐市"
    CLOptions[ii][jj++] = "新疆-库尔勒|├-库尔勒市"
    CLOptions[ii][jj++] = "新疆-阿克苏|├-阿克苏市"
    CLOptions[ii][jj++] = "新疆-阿图什|├-阿图什市"
    CLOptions[ii][jj++] = "新疆-喀什|├-喀什市"
    CLOptions[ii][jj++] = "新疆-和田|├-和田市"
    CLOptions[ii][jj++] = "新疆-伊宁|├-伊宁市"
    CLOptions[ii][jj++] = "新疆-塔城|├-塔城市"
    CLOptions[ii][jj++] = "新疆-阿勒泰|├-阿勒泰市"
    CLOptions[ii][jj++] = "新疆-石河子|├-石河子市"
    CLOptions[ii][jj++] = "新疆-阿拉尔|├-阿拉尔市"
    CLOptions[ii][jj++] = "新疆-图木舒克|├-图木舒克市"
    CLOptions[ii][jj++] = "新疆-五家渠|├-五家渠市"
    CLOptions[ii++][jj++] = "新疆-其他|└-其他"
    
    jj = 0
    // ii = 30
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "西藏-拉萨|├-拉萨市"
    CLOptions[ii][jj++] = "西藏-昌都|├-昌都"
    CLOptions[ii][jj++] = "西藏-山南|├-山南"
    CLOptions[ii][jj++] = "西藏-日喀则|├-日喀则"
    CLOptions[ii][jj++] = "西藏-那曲|├-那曲"
    CLOptions[ii][jj++] = "西藏-阿里|├-阿里"
    CLOptions[ii][jj++] = "西藏-林芝|├-林芝"
    CLOptions[ii++][jj++] = "西藏-其他|└-其他"
    
    jj = 0
    // ii = 31
    CLOptions[ii] = new Array()
    CLOptions[ii][jj++] = "台湾-台北|├-台北市"
    CLOptions[ii][jj++] = "台湾-高雄|├-高雄市"
    CLOptions[ii][jj++] = "台湾-基隆|├-基隆市"
    CLOptions[ii][jj++] = "台湾-台中|├-台中市"
    CLOptions[ii][jj++] = "台湾-台南|├-台南市"
    CLOptions[ii][jj++] = "台湾-新竹|├-新竹市"
    CLOptions[ii][jj++] = "台湾-嘉义|├-嘉义市"
    CLOptions[ii++][jj++] = "台湾-其他|└-其他"
  
    jj = 0
    // ii = 32
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "香港-|香港特别行政区"
  
    jj = 0
    // ii = 33
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "澳门-|澳门特别行政区"
  
    jj = 0
    // ii = 34
    CLOptions[ii] = new Array()
    CLOptions[ii++][jj++] = "国外-|国外"
  
    ii = 0
    jj = 0
}

// Place Associate List Object
function PlaceAssociateList(instance, parent, child, optionList)
{
    this.parent          = parent;              // 父选择框
    this.child           = child;               // 子选择框

    this.instance        = instance;            // 与对象关联的选择框实例

    this.optionList      = optionList;          // 选择框选项列表
    this.initValue       = null;                // 选择框初始值
    
    this.addedOptions    = null;                // 附加选项

    this.incPValue       = false;               // 包含父值
    this.incPValueFormat = "%PText%";           // 包含父值的选项的文本格式

    this.allowEmpty      = false;               // 允许空选项列表

    this.init            = InitPlaceSelector;   // 初始化方法
    this.SetSelectedValue = SetSelectedValue;          // 设置选中值方法

    this.instance.associateObject = this;       // 关联对象与选择框
}

// 选择列表初始化方法
function InitPlaceSelector()
{
    if( this.instance )                                         // 实例存在
    {
        var i, aIndex, aLength, aValueText;
        if( this.child || this.parent == null )                 // 子选择框存在, 则实例为父选择框;
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
            if( this.child ) this.instance.onchange = areaChanged
        }
        else if( this.parent )                                  // 父选择框存在, 则实例为子选择框
        {
            this.parent.onchange();
        }
    }
}

// 父选择列表值改变事件方法
function areaChanged()
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