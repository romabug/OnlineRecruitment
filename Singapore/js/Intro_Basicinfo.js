

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
 
  if (document.edit.corpname.value==""){
 alert("�н鹫˾���Ʋ����ǿ�ֵ��");
 document.edit.corpname.focus();
 return false;
 }
 if (!is_zw(document.edit.corpname.value)){
 alert("�н鹫˾���Ʊ������������֣�");
 document.edit.corpname.focus();
 return false;
 }
 
 if (document.edit.content.value==""){
 alert("�н鹫˾���ܲ����ǿ�ֵ��");
 document.edit.content.focus();
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
 if (!is_number(document.edit.fax.value)){
 alert("����ֻ��������0-9��-��");
 document.edit.fax.focus();
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
 alert("�������벻��Ϊ�գ�");
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
