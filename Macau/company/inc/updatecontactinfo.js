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
    alert("��������ϵ��!");
    theForm.contact.focus();
    return (false);
  }
  if (theForm.tel.value == "")
  {
    alert("��������ϵ�绰!");
    theForm.tel.focus();
    return (false);
  }
  if (theForm.province.value == "0")
  {
    alert("��ѡ��ʡ��!");
    theForm.province.focus();
    return (false);
  }
  if (theForm.address.value == "")
  {
    alert("�����빫˾��ַ!");
    theForm.address.focus();
    return (false);
  }
}

//����
 //-----------------------------------------------------ѡ���λ
g_citys=new Array(36);
g_citys[1] =  new Array("������","����");
g_citys[2] =  new Array("�����","����");
g_citys[3] =  new Array("�Ϻ���","����");
g_citys[4] =  new Array("������","����");
g_citys[5] =  new Array("������","������","������","������","����","������","������","������","������","������","��ˮ��","̨����","��ɽ��","����");
g_citys[6] =  new Array("������","������","��ݸ��","��ɽ��","��ɽ��","�麣��","������","��ͷ��","տ����","������","ï����","������","÷����","����");
g_citys[7] =  new Array("�Ͼ���","������","������","������","������","����","���Ƹ���","������","̩����","������","�γ���","����");
g_citys[8] =  new Array("������","������","Ȫ����","������","������","��ƽ��","������","������","������","����");
g_citys[9] =  new Array("��ɳ��","��̶��","������","������","�żҽ���","������","������","������","������","¦����","������","������","������","������","����");
g_citys[10] = new Array("�人��","�˲���","������","��ʯ��","������","�Ƹ���","����");
g_citys[11] = new Array("������","�ൺ��","��̨��","�Ͳ���","Ϋ����","������","������","������","����");
g_citys[12] = new Array("������","��˳��","������","��Ϫ��","Ӫ����","������","��ɽ��","������","������","������","����");
g_citys[13] = new Array("������","ͨ����","�Ӽ���","��ƽ��","��̨��","��Դ��","�ػ���","����");
g_citys[14] = new Array("������","������","������","��Ϫ��","������","������","��ɽ��","������","��ɽ��","����");
g_citys[15] = new Array("�ɶ���","�˱���","������","�ڽ���","��֦����","������","������","������","�ϳ���","������","������","�Թ���","����");
g_citys[16] = new Array("�Ϸ���","�ߺ���","��ɽ��","������","ͭ����","������","������","������","������","��ɽ��","������","������","������","������","������","������","����");
g_citys[17] = new Array("�ϲ���","��������","�Ž���","ӥ̶��","�˴���","������","Ƽ����","������","������","����ɽ��","������","������","����");
g_citys[18] = new Array("��������","��ľ˹��","ĵ������","������","���������","�ض���","˫Ѽɽ��","������","����");
g_citys[19] = new Array("ʯ��ׯ��","������","������","�żҿ���","�ػʵ���","������","��̨��","��ɽ��","�ȷ���","��ˮ��","ɳ����","������","�е���","����");
g_citys[20] = new Array("������","������","������","ͭ����","�Ӱ���","����");
g_citys[21] = new Array("������","������","����","ͨʲ��","����");
g_citys[22] = new Array("֣����","������","������","�ױ���","������","�����","פ�����","������","������","ƽ��ɽ��","������","������","����");
g_citys[23] = new Array("̫ԭ��","��ͬ��","������","�ٷ���","��Ȫ��","������","����");
g_citys[24] = new Array("���ͺ���","��ͷ��","����");
g_citys[25] = new Array("������","������","������","������","������","����");
g_citys[26] = new Array("������","������","ͭ����","��ˮ��","����ˮ��","��˳��","����");
g_citys[27] = new Array("������","��ͭϿ��","������","����");
g_citys[28] = new Array("������","���ľ��","�������","����");
g_citys[29] = new Array("��³ľ����","ʯ������","����������","��³����","��ʲ��","����");
g_citys[30] = new Array("������","�տ�����","����");
g_citys[31] = new Array("������","������","������","����");
g_citys[32] = new Array("̨����","̨����","��¡��","̨����","����");
g_citys[33] = new Array("���");
g_citys[34] = new Array("����");
g_citys[35] = new Array("����");
g_citys[36] = new Array("����");

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
			alert("�����ַ��д����ȷ��");
			document.forms[0].elements[4].focus();
			return;
		}
var open_url = "inc/chkemail_modify.asp?email=" + _valueemail;
			var _return = showDialog(open_url, 350, 240, _valueemail);
			document.forms[0].elements[4].value = _return;
			//window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=350,height=200');
	}
//-->