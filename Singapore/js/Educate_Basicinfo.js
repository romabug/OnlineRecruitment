

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


 function check_edit(){
 
  if (document.edit.schoolname.value==""){
 alert("��ѵ�������Ʋ����ǿ�ֵ�������ע��...");
 document.edit.schoolname.focus();
 return false;
 }
 
  if (!is_zw(document.edit.schoolname.value)){
 alert("��ѵ�������Ʊ������������֣������ע��...");
 document.edit.schoolname.focus();
 return false;
 }
   if (document.edit.set_year.value==""){
 alert("�������ڲ����ǿ�ֵ�������ע��...");
 document.edit.set_year.focus();
 return false;
 }
 if (document.edit.set_year.value.match(/\D/)){
 alert("������ݱ��������֣������ע��...");
 document.edit.set_year.focus();
 return false;
 }


 if (document.edit.school_memo.value==""){
 alert("������鲻���ǿ�ֵ�������ע��...");
 document.edit.school_memo.focus();
 return false;
 }
  if (document.edit.contactperson.value==""){
 alert("��ϵ�˲����ǿ�ֵ�������ע��...");
 document.edit.contactperson.focus();
 return false;
 }
 if (document.edit.phone.value==""){
 alert("��ϵ�绰�����ǿ�ֵ�������ע��...");
 document.edit.phone.focus();
 return false;
 }
 if (!is_number(document.edit.phone.value)){
 alert("��ϵ�绰ֻ��������0-9��-�������ע��...");
 document.edit.phone.focus();
 return false;
 }
  if (!is_number(document.edit.fax.value)){
 alert("����ֻ��������0-9��-�������ע��...");
 document.edit.fax.focus();
 return false;
 }
 if (document.edit.email.value==""){
 alert("����������룡�����ע��...");
 document.edit.email.focus();
 return false;
 }

 if(document.edit.email.value.indexOf("@")==-1 || document.edit.email.value.indexOf(".")==-1){ 
 alert("�����ʽ����ȷ�������ע��...");
 document.edit.email.focus();
 return false;
 }
 
 if (document.edit.zipcode.value==""){
 alert("�������벻��Ϊ�գ������ע��...");
 document.edit.zipcode.focus();
 return false;
 } 
 if (document.edit.zipcode.value.match(/\D/)){
 alert("����������������֣������ע��...");
 document.edit.zipcode.focus();
 return false;
 }
 if (document.edit.address.value==""){
 alert("ͨѶ��ַ�������룡�����ע��...");
 document.edit.address.focus();
 return false;
 }	
 }
