//Design By L.C.H
function checktext(text)
{
			allValid = true;

		for (i = 0;  i < text.length;  i++)
		{
			if (text.charAt(i) != " ")
			{
				allValid = false;
				break;
			}
		}

return allValid;
}
function Juge(theForm)
{
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
  if (theForm.province.value == "0")
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
function check_email()
{
var _valueemail = document.forms[0].elements[4].value.toLowerCase();
if(!_valueemail.strEmail()) {
			alert("邮箱地址填写不正确！");
			document.forms[0].elements[4].focus();
			return;
		}
var open_url = "inc/chkemail_modify.asp?email=" + _valueemail;
			var _return = showDialog(open_url, 350, 240, _valueemail);
			document.forms[0].elements[4].value = _return;
			//window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=350,height=200');
	}
//-->