

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
 
  if (document.edit.name.value==""){
 alert("��ʵ��������Ϊ��!");
 document.edit.name.focus();
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
  if (!is_number(document.edit.mt.value)){
 alert("�ֻ�����ֻ��������0-9��-��");
 document.edit.mt.focus();
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
 
 if (document.edit.zipcode.value.match(/\D/)){
 alert("����������������֣�");
 document.edit.zipcode.focus();
 return false;
 }
 }
