
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
 alert("工作过的企业数必须是合法的数字！");
 document.edit.workcompanys.focus();
 return false;
 }
 
  if (document.edit.workcompanys.value>100){
 alert("工作过的企业数不合法！");
 document.edit.workcompanys.focus();
 return false;
 }
 }

