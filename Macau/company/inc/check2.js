//Design By L.C.H
 //-----------------------------------------------------�ж�����Ϊ������֤
function IsDigit(cCheck)      
 {      
 return (('0'<=cCheck) && (cCheck<='9'));      
 } 
 //-----------------------------------------------------��д��ϸ����ʱ��֤
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
    alert("�����빫˾����!");
    theForm.companyname.focus();
    return (false);
  }
  u_year=theForm.u_year.value;
  if (u_year == "")
  {
    alert("���������!");
    theForm.u_year.focus();
    return (false);
  }
  if (u_year<1800||u_year>=2007)
  {
  alert("����д��ȷ�����!");
  theForm.u_year.focus();
  return (false);
  }
  for (nIndex=0; nIndex<u_year.length; nIndex++)      
  {      
  cCheck = u_year.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("�������д���֣�");      
   theForm.u_year.focus();      
   return false;      
   }      
  }
  if (theForm.u_month.value == "")
  {
    alert("��ѡ���·�!");
    theForm.u_month.focus();
    return (false);
  }
  if (theForm.u_day.value == "")
  {
    alert("��ѡ������!");
    theForm.u_day.focus();
    return (false);
  }
 // fund=theForm.fund.value;
  //if (fund == "")
  //{
 //   alert("������ע���ʽ�!");
//    theForm.fund.focus();
//    return (false);
//  }
//    for (nIndex=0; nIndex<fund.length; nIndex++)      
 // {      
 // cCheck = fund.charAt(nIndex);      
 // if (!IsDigit(cCheck))     
//   {      
//   alert("ע���ʽ�����д���֣�");      
////   theForm.fund.focus();      
//   return false;      
//   }      
//  }
//  if (theForm.legal.value == "")
 // {
  //  alert("�����뷨�˴���!");
  //  theForm.legal.focus();
//    return (false);
//  }

  if (theForm.intro.value == "")
  {
    alert("�����빫˾���!");
    theForm.intro.focus();
    return (false);
  }
    if (fucCheckLength(theForm.intro.value) >5000 )
	{
		alert("��˾��鲻�ܳ���5000��");
		theForm.intro.focus();
		return (false);
	}
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
  if (theForm.province.value == "")
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
  if (theForm.knowfrom[0].checked || theForm.knowfrom[1].checked || theForm.knowfrom[2].checked || theForm.knowfrom[3].checked || theForm.knowfrom[4].checked || theForm.knowfrom[5].checked || theForm.knowfrom[6].checked || theForm.knowfrom[7].checked || theForm.knowfrom[8].checked || theForm.knowfrom[9].checked || theForm.knowfrom[10].checked || theForm.knowfrom[11].checked)
  {
  return true;
  }
  else
  {
  alert("������ѡ��һ��Ӻδ���֪�����͹���Ƹ��");
  theForm.knowfrom[0].focus();
  return false;  
  }
}
/**�����ҵ���������б���*/
function writeNature()
{
	with(document)
	{
		write("<option value='1'>������ҵ</option>");
		write("<option value='2'>������ҵ</option>");
		write("<option value='3'>������ҵ</option>");
		write("<option value='4'>˽Ӫ��ҵ</option>");
		write("<option value='5'>��Ӫ��ҵ</option>");
		write("<option value='6'>�ɷ�����ҵ</option>");
		write("<option value='7'>������ҵ</option>");
		write("<option value='8'>������ҵ</option>");
		write("<option value='9'>������ҵ</option>");
		write("<option value='10'>��������</option>");
		write("<option value='11'>�������</option>");
		write("<option value='12'>��ҵ��λ</option>");
		write("<option value='13'>�����˾(����)</option>");
		write("<option value='14'>����</option>");
	}	
}
//--��ҵ�б�
function writeTrade()
{
	with(document)
	{
		write("<option value='1'>����������������</option>");
		write("<option value='2'>�����ҵ����������ݿ⡢ϵͳ���ɣ�</option>");
		write("<option value='3'>�����ҵ��Ӳ���������豸��</option>");
		write("<option value='4'>���ӡ�΢���Ӽ���</option>");
		write("<option value='5'>ͨѶ������ҵ</option>");
		write("<option value='6'>�ҵ�ҵ</option>");
		write("<option value='7'>��������(�ٻ������С��������ġ�ר���ꡭ)</option>");
		write("<option value='8'>ó�ס����񡢽�����</option>");
		write("<option value='9'>����</option>");
		write("<option value='10'>��������Դ�����ҵ</option>");
		write("<option value='11'>ʯ�͡�����ҵ</option>");
		write("<option value='12'>���﹤�̡���ҩ������</option>");
		write("<option value='13'>��е���졢�����豸���ع�ҵ</option>");
		write("<option value='14'>������Ħ�г�</option>");
		write("<option value='15'>�����Ǳ��繤�豸</option>");
		write("<option value='16'>��桢���ء����</option>");
		write("<option value='17'>�������Ļ�������ý�塢Ӱ�����������ų���</option>");
		write("<option value='18'>��������Ʒ��ʳƷ�����ϡ����͡���ױƷ���̾ơ���</option>");
		write("<option value='19'>��֯Ʒҵ�����Ρ�Ь�ࡢ�ҷ���Ʒ��Ƥ�ߡ���</option>");
		write("<option value='20'>��ѯҵ�����ʡ����ʦ�����ʦ�����ɣ�</option>");
		write("<option value='21'>����ҵ��Ͷ�ʡ����ա�֤ȯ�����С�����</option>");
		write("<option value='22'>���������ز�����ҵ����װ��</option>");
		write("<option value='23'>���䡢���������</option>");
		write("<option value='24'>����ҵ�����������֡��Ƶ�</option>");
		write("<option value='25'>�칫�豸���Ļ�����������Ʒ���Ҿ���Ʒ</option>");
		write("<option value='26'>ӡˢ����װ����ֽ</option>");
		write("<option value='27'>���������졢�ӹ�</option>");
		write("<option value='28'>��������ѵ������Ժ��</option>");
		write("<option value='29'>ҽ�ơ���������������</option>");
		write("<option value='30'>�˲Ž������н�</option>");
		write("<option value='31'>Э�ᡢ���š�����������ҵ����������</option>");
		write("<option value='32'>ũ���֡�����������ҵ</option>");
		write("<option value='33'>����</option>");					//����
		write("<option value='34'>����</option>");
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