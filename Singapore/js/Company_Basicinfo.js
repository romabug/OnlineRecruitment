

function is_zw(str)
  {
	exp=/[0-9a-zA-Z_]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
  }
 
 function is_number(str)
{
	exp=/[^0-9()-]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
}


 function form_check(){
 
  if (document.edit.companyname.value==""){
 alert("��ҵ���Ʋ����ǿ�ֵ��");
 document.edit.companyname.focus();
 return false;
 }

   if (document.edit.set_year.value==""){
 alert("��ҵ����ʱ�䲻���ǿ�ֵ��");
 document.edit.set_year.focus();
 return false;
 }
 if (document.edit.set_year.value.match(/\D/)){
 alert("��ҵ������ݱ��������֣�");
 document.edit.set_year.focus();
 return false;
 }
 if (document.edit.reg_currency.value==""){
 alert("��ҵע���ʽ����ǿ�ֵ��");
 document.edit.reg_currency.focus();
 return false;
 }
  if (document.edit.reg_currency.value.match(/\D/)){
 alert("��ҵע���ʽ���������֣�");
 document.edit.reg_currency.focus();
 return false;
 }

 if (document.edit.company_memo.value==""){
 alert("��ҵ��鲻���ǿ�ֵ��");
 document.edit.company_memo.focus();
 return false;
 }
  if (document.edit.contactperson.value==""){
 alert("��ϵ�˲����ǿ�ֵ��");
 document.edit.contactperson.focus();
 return false;
 }
 if (document.edit.phone.value==""){
 alert("��ϵ�绰�����ǿ�ֵ��");
 document.edit.phone.focus();
 return false;
 }
 if (!is_number(document.edit.phone.value)){
 alert("��ϵ�绰ֻ��������0-9��-��");
 document.edit.phone.focus();
 return false;
 }
 if (!is_number(document.edit.companyfax.value)){
 alert("����ֻ��������0-9��-��");
 document.edit.companyfax.focus();
 return false;
 }
 if (document.edit.email.value==""){
 alert("����������룡");
 document.edit.email.focus();
 return false;
 }

 if(document.edit.email.value.indexOf("@")==-1 || document.edit.email.value.indexOf(".")==-1){ 
 alert("�����ʽ����ȷ��");
 document.edit.email.focus();
 return false;
	}

 if (document.edit.zipcode.value==""){
 alert("��������������룡");
 document.edit.zipcode.focus();
 return false;
 } 
 if (document.edit.zipcode.value.match(/\D/)){
 alert("����������������֣�");
 document.edit.zipcode.focus();
 return false;
 }
 
 if (document.edit.address.value==""){
 alert("ͨѶ��ַ�������룡");
 document.edit.address.focus();
 return false;
 }	
 }


