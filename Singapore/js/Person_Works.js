
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
 
  if (document.edit.workcompanys.value.match(/\D/)){
 alert("����������ҵ�������ǺϷ������֣�");
 document.edit.workcompanys.focus();
 return false;
 }
 
  if (document.edit.workcompanys.value>100){
 alert("����������ҵ�����Ϸ���");
 document.edit.workcompanys.focus();
 return false;
 }
 }

