
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
 
 if (document.edit.lastschool.value==""){
 alert("����д���ı�ҵԺУ��");
 document.edit.lastschool.focus();
 return false;
 }
    if (document.edit.byear.value==""){
 alert("����д���ı�ҵ��ݣ�");
 document.edit.byear.focus();
 return false;
 }
  if (document.edit.byear.value.match(/\D/)){
 alert("��ҵ��ݱ����ǺϷ������֣�");
 document.edit.byear.focus();
 return false;
 }
   if (document.edit.speciality.value==""){
 alert("����д����רҵ���ƣ�");
 document.edit.speciality.focus();
 return false;
 } 
 }

