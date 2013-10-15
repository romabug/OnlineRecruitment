<SCRIPT LANGUAGE="JavaScript"> 
function setcity() { 
switch (document.theForm.door.value) { 

case '不限': 
var labels = new Array("-不限地区-"); 
var values = new Array("不限"); 
break; 

case '北京': 
var labels = new Array("北京市"); 
var values = new Array("北京市"); 
break; 
case '天津' : 
var labels = new Array("天津市"); 
var values = new Array("天津市"); 
break 
case '上海' : 
var labels = new Array("上海市"); 
var values = new Array("上海市");
break 
case '重庆' : 
var labels = new Array("重庆市"); 
var values = new Array("重庆市");
break 
case '广东' : 
var labels = new Array("广州","深圳","东莞","中山","佛山","珠海","惠州","汕头","湛江","潮州","潮阳","江门","汕尾","茂名","阳江","肇庆","梅州","云浮","清远","韶关","河源","揭阳","其他"); 
var values = new Array("广州","深圳","东莞","中山","佛山","珠海","惠州","汕头","湛江","潮州","潮阳","江门","汕尾","茂名","阳江","肇庆","梅州","云浮","清远","韶关","河源","揭阳","其他");
break 
case '江苏' : 
var labels = new Array("南京","苏州","无锡","扬州","常州","镇江","南通","江阴","连云港","徐州","淮阴","宿迁","东台","泰州","仪征","丹阳","宜兴","常熟","淮安","盐城","兴化","姜堰","其他"); 
var values = new Array("南京","苏州","无锡","扬州","常州","镇江","南通","江阴","连云港","徐州","淮阴","宿迁","东台","泰州","仪征","丹阳","宜兴","常熟","淮安","盐城","兴化","姜堰","其他");
break 
case '浙江' : 
var labels = new Array("杭州","宁波","温州","金华","义乌","绍兴","湖州","余姚","临海","萧山","临安","诸暨","嵊泗","绍兴县","兰溪县","嘉兴","海宁","桐乡","衢州","上虞","嵊州","慈溪","丽水","瓯海","黄岩","椒江","台州","其他"); 
var values = new Array("杭州","宁波","温州","金华","义乌","绍兴","湖州","余姚","临海","萧山","临安","诸暨","嵊泗","绍兴县","兰溪县","嘉兴","海宁","桐乡","衢州","上虞","嵊州","慈溪","丽水","瓯海","黄岩","椒江","台州","其他");
break 
case '福建' : 
var labels = new Array("福州","厦门","泉州","漳州","石狮","三明","南平","莆田","永安","邵武","龙岩","其他"); 
var values = new Array("福州","厦门","泉州","漳州","石狮","三明","南平","莆田","永安","邵武","龙岩","其他");
break 
case '湖南' : 
var labels = new Array("长沙","湘潭","岳阳","株洲","张家界","衡阳","郴州","湘乡","汨罗","常德","津市","吉首","娄底","涟源","冷水江","怀化","洪江","益阳","耒阳","邵阳","永州","冷水滩","其他"); 
var values = new Array("长沙","湘潭","岳阳","株洲","张家界","衡阳","郴州","湘乡","汨罗","常德","津市","吉首","娄底","涟源","冷水江","怀化","洪江","益阳","耒阳","邵阳","永州","冷水滩","其他");
break 
case '湖北' : 
var labels = new Array("武汉","宜昌","孝感","荆州","襄樊","老河口","枝城","枣阳","荆门","宜城","黄石","鄂州","黄冈","咸宁","武穴","蒲昕","麻城","十堰","恩施","丹江口","利川","天门","汉川","洪湖","应城","潜江","安陆","仙桃","随州","石首","其他"); 
var values = new Array("武汉","宜昌","孝感","荆州","襄樊","老河口","枝城","枣阳","荆门","宜城","黄石","鄂州","黄冈","咸宁","武穴","蒲昕","麻城","十堰","恩施","丹江口","利川","天门","汉川","洪湖","应城","潜江","安陆","仙桃","随州","石首","其他"); 
break 
case '山东' : 
var labels = new Array("济南","青岛","烟台","淄博","潍坊","临沂","莱芜","济宁","荷泽","日照","藤州","聊城","德州","滨州","临清","青州","威海","泰安","新泰","曲阜","东营","诸城","枣庄","其他"); 
var values = new Array("济南","青岛","烟台","淄博","潍坊","临沂","莱芜","济宁","荷泽","日照","藤州","聊城","德州","滨州","临清","青州","威海","泰安","新泰","曲阜","东营","诸城","枣庄","其他");
break
case '辽宁' : 
var labels = new Array("沈阳","铁岭","抚顺","大连","本溪","营口","锦州","兴城","北票","盘锦","辽阳","铁法","鞍山","瓦房店","丹东","锦西","朝阳","阜新","海城","其他"); 
var values = new Array("沈阳","铁岭","抚顺","大连","本溪","营口","锦州","兴城","北票","盘锦","辽阳","铁法","鞍山","瓦房店","丹东","锦西","朝阳","阜新","海城","其他");
break
case '吉林' : 
var labels = new Array("长春","吉林","通化","扶余","桦甸","延吉","图门","龙井","敦化","集安","浑江","梅河口","四平","公主岭","辽源","白城","洮南","九台","其他"); 
var values = new Array("长春","吉林","通化","扶余","桦甸","延吉","图门","龙井","敦化","集安","浑江","梅河口","四平","公主岭","辽源","白城","洮南","九台","其他");
break
case '云南' : 
var labels = new Array("昆明","曲靖","大理","玉溪","丽江","楚雄","开远","迪庆","东川","昭通","个旧","保山","文山","其他"); 
var values = new Array("昆明","曲靖","大理","玉溪","丽江","楚雄","开远","迪庆","东川","昭通","个旧","保山","文山","其他");
break
case '四川' : 
var labels = new Array("成都","宜宾","泸州","内江","攀枝花","西昌","德阳","雅安","遂宁","南充","绵阳","广元","马尔康","达县","华鉴","自贡","乐山","其他"); 
var values = new Array("成都","宜宾","泸州","内江","攀枝花","西昌","德阳","雅安","遂宁","南充","绵阳","广元","马尔康","达县","华鉴","自贡","乐山","其他"); 
break
case '安徽' : 
var labels = new Array("合肥","芜湖","马鞍山","蚌埠","铜陵","淮北","淮南","亳州","巢湖","黄山","歙县","宿州","阜阳","六安","滁州","宣州","黄山","安庆","其他"); 
var values = new Array("合肥","芜湖","马鞍山","蚌埠","铜陵","淮北","淮南","亳州","巢湖","黄山","歙县","宿州","阜阳","六安","滁州","宣州","黄山","安庆","其他");
break
case '江西' : 
var labels = new Array("南昌","景德镇","九江","鹰潭","宜春","新余","萍乡","赣州","吉安","井冈山","抚州","临川","上饶","其他"); 
var values = new Array("南昌","景德镇","九江","鹰潭","宜春","新余","萍乡","赣州","吉安","井冈山","抚州","临川","上饶","其他");
break
case '黑龙江' : 
var labels = new Array("哈尔滨","佳木斯","牡丹江","大庆","齐齐哈尔","阿城","肇东","绥化","伊春","鹤岗","七台河","双鸭","同江","绥汾河","鸡西","北安","黑河","五大连池","其他"); 
var values = new Array("哈尔滨","佳木斯","牡丹江","大庆","齐齐哈尔","阿城","肇东","绥化","伊春","鹤岗","七台河","双鸭","同江","绥汾河","鸡西","北安","黑河","五大连池","其他");
break
case '河北' : 
var labels = new Array("石家庄","邯郸","保定","张家口","秦皇岛","辛集","邢台","泊头","唐山","北戴河","廊坊","定州","南宫","衡水","沙河","沧州","任丘","承德","涿州","其他"); 
var values = new Array("石家庄","邯郸","保定","张家口","秦皇岛","辛集","邢台","泊头","唐山","北戴河","廊坊","定州","南宫","衡水","沙河","沧州","任丘","承德","涿州","其他");
break
case '陕西' : 
var labels = new Array("西安","咸阳","宝鸡","铜川","渭南","延安","汉中","韩城","其他"); 
var values = new Array("西安","咸阳","宝鸡","铜川","渭南","延安","汉中","韩城","其他");
break
case '海南' : 
var labels = new Array("海口","三亚","琼海","通什","其他"); 
var values = new Array("海口","三亚","琼海","通什","其他");
break
case '河南' : 
var labels = new Array("郑州","洛阳","开封","鹤壁","焦作","许昌","驻马店","周口","新乡","安阳","濮阳","漯河","信阳","平顶山","三门峡","南阳","商丘","义马","其他"); 
var values = new Array("郑州","洛阳","开封","鹤壁","焦作","许昌","驻马店","周口","新乡","安阳","濮阳","漯河","信阳","平顶山","三门峡","南阳","商丘","义马","其他");
break
case '山西' : 
var labels = new Array("太原","大同","忻州","临汾","运城","长治","榆次","侯马","阳泉","晋城","其他"); 
var values = new Array("太原","大同","忻州","临汾","运城","长治","榆次","侯马","阳泉","晋城","其他");
break
case '内蒙古' : 
var labels = new Array("呼和浩特","赤峰","包头","二连浩特","临河","东胜","满洲里","乌兰浩特","霍林郭勒","集宁","乌海","海拉尔","牙克石","锡林浩特","通辽","扎兰屯","其他"); 
var values = new Array("呼和浩特","赤峰","包头","二连浩特","临河","东胜","满洲里","乌兰浩特","霍林郭勒","集宁","乌海","海拉尔","牙克石","锡林浩特","通辽","扎兰屯","其他");
break
case '广西' : 
var labels = new Array("南宁","桂林","北海","柳州","玉林","百色","河池","凭祥","钦州","梧州","合山","其他"); 
var values = new Array("南宁","桂林","北海","柳州","玉林","百色","河池","凭祥","钦州","梧州","合山","其他");
break
case '贵州' : 
var labels = new Array("贵阳","遵义","铜仁","都匀","兴义","赤水","六盘水","凯里","安顺","其他"); 
var values = new Array("贵阳","遵义","铜仁","都匀","兴义","赤水","六盘水","凯里","安顺","其他");
break
case '宁夏' : 
var labels = new Array("银川","青铜峡","吴忠","石嘴山","中卫","中宁","固原","其他"); 
var values = new Array("银川","青铜峡","吴忠","石嘴山","中卫","中宁","固原","其他");
break
case '青海' : 
var labels = new Array("西宁","格尔木","共和","德令哈","其他"); 
var values = new Array("西宁","格尔木","共和","德令哈","其他");
break
case '新疆' : 
var labels = new Array("乌鲁木齐","石河子","克拉玛依","博乐","塔城","阿勒泰","哈密","阿克苏","阿图什","昌吉","奎屯","伊宁","吐鲁番","库尔勒","喀什","和田","其他"); 
var values = new Array("乌鲁木齐","石河子","克拉玛依","博乐","塔城","阿勒泰","哈密","阿克苏","阿图什","昌吉","奎屯","伊宁","吐鲁番","库尔勒","喀什","和田","其他");
break
case '西藏' : 
var labels = new Array("拉萨","日喀则","其他"); 
var values = new Array("拉萨","日喀则","其他");
break
case '甘肃' : 
var labels = new Array("兰州","酒泉","临夏","张掖","嘉峪关","金昌","平凉","白银","武威","玉门","天水","西峰","其他"); 
var values = new Array("兰州","酒泉","临夏","张掖","嘉峪关","金昌","平凉","白银","武威","玉门","天水","西峰","其他");
break
case '台湾' : 
var labels = new Array("台北","台中","基隆","台南","其他"); 
var labels = new Array("台北","台中","基隆","台南","其他");
break
case '香港' : 
var labels = new Array("香港"); 
var values = new Array("香港");
break
case '澳门' : 
var labels = new Array("澳门"); 
var values = new Array("澳门");
break
case '国外' : 
var labels = new Array("国外"); 
var values = new Array("国外");
break

} 
document.theForm.door1.options.length = 0; 
for(var i = 0; i < labels.length; i++) { 
document.theForm.door1.add(document.createElement("OPTION")); 
document.theForm.door1.options[i].text=labels[i]; 
document.theForm.door1.options[i].value=values[i]; 
} 
document.theForm.door1.selectedIndex = 0; 
} 
</SCRIPT> 
<SELECT NAME="door" OnChange="setcity()"   style="width:100px;">
<option value="不限" selected>-不限省份-</option> 
<option value="北京">北京</option>
<option value="天津">天津 </option>
<option value="上海">上海 </option>
<option value="重庆">重庆 </option>
<option value="广东">广东 </option>
<option value="江苏">江苏 </option>
<option value="浙江">浙江 </option>
<option value="福建">福建 </option>
<option value="湖南">湖南 </option>
<option value="湖北">湖北 </option>
<option value="山东">山东 </option>
<option value="辽宁">辽宁 </option>
<option value="吉林">吉林 </option>
<option value="云南">云南 </option>
<option value="四川">四川</option>
<option value="安徽">安徽</option>
<option value="江西">江西 </option>
<option value="黑龙江">黑龙江 </option>
<option value="河北">河北 </option>
<option value="陕西">陕西 </option>
<option value="海南">海南 </option>
<option value="河南">河南 </option>
<option value="山西">山西 </option>
<option value="内蒙古">内蒙古 </option>
<option value="广西">广西</option>
<option value="贵州">贵州 </option>
<option value="宁夏">宁夏 </option>
<option value="青海">青海</option>
<option value="新疆">新疆 </option>
<option value="西藏">西藏 </option>
<option value="甘肃">甘肃 </option>
<option value="台湾">台湾 </option>
<option value="香港">香港</option>
<option value="澳门">澳门 </option>
<option value="国外">国外 </option>
</SELECT>
<SELECT NAME="door1"  style="width:100px;"></SELECT> 
<SCRIPT LANGUAGE="JavaScript"> 
setcity(); 
</SCRIPT>
