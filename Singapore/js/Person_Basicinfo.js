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
 if (document.edit.realname.value==""){
 alert("�û���ʵ��������Ϊ��ֵ��");
 document.edit.realname.focus();
 return false;
 }
 if (!is_zw(document.edit.realname.value)){
 alert("�û���ʵ�����������������֣�");
 document.edit.realname.focus();
 return false;
 }
  if (document.edit.realname.value.length<2 || document.edit.realname.value.length>10){
 alert("�û���ʵ����������2-10������������ɣ�");
 document.edit.realname.focus();
 return false;
 }
 if (document.edit.birthyear.value==""){
 alert("������ݲ���Ϊ��ֵ��");
 document.edit.birthyear.focus();
 return false;
 }
  if (document.edit.stature.value==""){
 alert("������߲���Ϊ��ֵ��");
 document.edit.stature.focus();
 return false;
 }
 if (document.edit.stature.value.match(/\D/)){
 alert("������߱����ǺϷ������֣�");
 document.edit.stature.focus();
 return false;
 }
   if (document.edit.tizhong.value==""){
 alert("�������ز���Ϊ��ֵ��");
 document.edit.tizhong.focus();
 return false;
 }
 if (document.edit.tizhong.value.match(/\D/)){
 alert("�������ر����ǺϷ������֣�");
 document.edit.tizhong.focus();
 return false;
 }
   if (document.edit.codeid.value==""){
 alert("����֤�����벻��Ϊ��ֵ��");
 document.edit.codeid.focus();
 return false;
 }
if (document.edit.personphone.value==""){
 alert("������ϵ�绰����Ϊ��ֵ��");
 document.edit.personphone.focus();
 return false;
 }
if (!is_number(document.edit.personphone.value)){
 alert("��ϵ�绰ֻ�ܺ���0-9��-��");
 document.edit.personphone.focus();
 return false;
 } 
 
 if (document.edit.msnqq.value!="")
 {
  if (document.edit.msnqq.value.match(/\D/))
  {
   alert("����QQ��������ǺϷ������֣�");
   document.edit.msnqq.focus();
   return false;
  } 
 }
 
  if (document.edit.useremail.value==""){
 alert("����������룡�����ע��...");
 document.edit.useremail.focus();
 return false;
 }

 if(document.edit.useremail.value.indexOf("@")==-1 || document.edit.useremail.value.indexOf(".")==-1){ 
 alert("�����ʽ����ȷ�������ע��...");
 document.edit.useremail.focus();
 return false;
	}

 if (document.edit.zipcode.value==""){
 alert("��������������룡�����ע��...");
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

