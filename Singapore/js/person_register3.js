
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
 if (document.reg.realname.value==""){
 alert("�û���ʵ��������Ϊ��ֵ�������ע��...");
 document.reg.realname.focus();
 return false;
 }
 if (!is_zw(document.reg.realname.value)){
 alert("�û���ʵ�����������������֣������ע��...");
 document.reg.realname.focus();
 return false;
 }
  if (document.reg.realname.value.length<2 || document.reg.realname.value.length>10){
 alert("�û���ʵ����������2-10������������ɣ������ע��...");
 document.reg.realname.focus();
 return false;
 }
 
 if (document.reg.birthyear.value==""){
 alert("������ݲ���Ϊ��ֵ�������ע��...");
 document.reg.birthyear.focus();
 return false;
 }
 if (document.reg.birthyear.value.match(/\D/)){
 alert("������ݱ����ǺϷ������֣������ע��...");
 document.reg.birthyear.focus();
 return false;
 }
 
  if (document.reg.stature.value==""){
 alert("������߲���Ϊ��ֵ�������ע��...");
 document.reg.stature.focus();
 return false;
 }
 if (document.reg.stature.value.match(/\D/)){
 alert("������߱����ǺϷ������֣������ע��...");
 document.reg.stature.focus();
 return false;
 }

  if (document.reg.tizhong.value==""){
 alert("�������ز���Ϊ��ֵ�������ע��...");
 document.reg.tizhong.focus();
 return false;
 }
 if (document.reg.tizhong.value.match(/\D/)){
 alert("�������ر����ǺϷ������֣������ע��...");
 document.reg.tizhong.focus();
 return false;
 }
 
 if (document.reg.codeid.value==""){
 alert("����֤�����벻��Ϊ��ֵ�������ע��...");
 document.reg.codeid.focus();
 return false;
 }
  if (document.reg.codetype.options[document.reg.codetype.selectedIndex].value=="0"){
  if (document.reg.codeid.value.length<15){
   alert("����֤�������ʽ����ȷ�������ע��...");
   document.reg.codeid.focus();
   return false;
  }
 }
 if (document.reg.codetype.options[document.reg.codetype.selectedIndex].value=="3"){
  if (document.reg.codeid.value.length<8){
   alert("����֤�������ʽ����ȷ�������ע��...");
   document.reg.codeid.focus();
   return false;
  }
 }
 
 if (document.reg.lastschool.value==""){
 alert("����д���ı�ҵԺУ�������ע��...");
 document.reg.lastschool.focus();
 return false;
 }
    if (document.reg.byear.value==""){
 alert("����д���ı�ҵ��ݣ������ע��...");
 document.reg.byear.focus();
 return false;
 }
  if (document.reg.byear.value.match(/\D/)){
 alert("��ҵ��ݱ����ǺϷ������֣������ע��...");
 document.reg.byear.focus();
 return false;
 }
   if (document.reg.speciality.value==""){
 alert("����д����רҵ���ƣ������ע��...");
 document.reg.speciality.focus();
 return false;
 } 
    if (document.reg.personphone.value==""){
 alert("������ϵ�绰����Ϊ��ֵ�������ע��...");
 document.reg.personphone.focus();
 return false;
 }
 if (!is_number(document.reg.personphone.value)){
 alert("��ϵ�绰ֻ�ܺ���0-9��-�������ע��...");
 document.reg.personphone.focus();
 return false;
 } 
  if (!is_number(document.reg.mt.value)){
 alert("�ƶ��绰ֻ�ܺ���0-9��-�������ע��...");
 document.reg.mt.focus();
 return false;
 } 
 if (document.reg.zipcode.value==""){
 alert("�������벻��Ϊ�գ������ע��...");
 document.reg.zipcode.focus();
 return false;
 }
 if (document.reg.zipcode.value.match(/\D/)){
 alert("������������ǺϷ������֣������ע��...");
 document.reg.zipcode.focus();
 return false;
 }
 if (document.reg.address.value==""){
 alert("ͨѶ��ַ����Ϊ�գ������ע��...");
 document.reg.address.focus();
 return false;
 }
 }

