

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


 function check_reg(){
 
  if (document.reg.schoolname.value==""){
 alert("��ѵ�������Ʋ����ǿ�ֵ�������ע��...");
 document.reg.schoolname.focus();
 return false;
 }
 
  if (!is_zw(document.reg.schoolname.value)){
 alert("��ѵ�������Ʊ������������֣������ע��...");
 document.reg.schoolname.focus();
 return false;
 }
   if (document.reg.set_year.value==""){
 alert("�������ڲ����ǿ�ֵ�������ע��...");
 document.reg.set_year.focus();
 return false;
 }
 if (document.reg.set_year.value.match(/\D/)){
 alert("������ݱ��������֣������ע��...");
 document.reg.set_year.focus();
 return false;
 }


 if (document.reg.school_memo.value==""){
 alert("������鲻���ǿ�ֵ�������ע��...");
 document.reg.school_memo.focus();
 return false;
 }
  if (document.reg.contactperson.value==""){
 alert("��ϵ�˲����ǿ�ֵ�������ע��...");
 document.reg.contactperson.focus();
 return false;
 }
 if (document.reg.phone.value==""){
 alert("��ϵ�绰�����ǿ�ֵ�������ע��...");
 document.reg.phone.focus();
 return false;
 }
 if (!is_number(document.reg.phone.value)){
 alert("��ϵ�绰ֻ��������0-9��-�������ע��...");
 document.reg.phone.focus();
 return false;
 }
  if (!is_number(document.reg.fax.value)){
 alert("����ֻ��������0-9��-�������ע��...");
 document.reg.fax.focus();
 return false;
 }
 if (document.reg.email.value==""){
 alert("����������룡�����ע��...");
 document.reg.email.focus();
 return false;
 }

 if(document.reg.email.value.indexOf("@")==-1 || document.reg.email.value.indexOf(".")==-1){ 
 alert("�����ʽ����ȷ�������ע��...");
 document.reg.email.focus();
 return false;
 }
 
 if (document.reg.zipcode.value==""){
 alert("�������벻��Ϊ�գ������ע��...");
 document.reg.zipcode.focus();
 return false;
 } 
 if (document.reg.zipcode.value.match(/\D/)){
 alert("����������������֣������ע��...");
 document.reg.zipcode.focus();
 return false;
 }
 if (document.reg.address.value==""){
 alert("ͨѶ��ַ�������룡�����ע��...");
 document.reg.address.focus();
 return false;
 }	
 }
