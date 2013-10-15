
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
 alert("请填写您的毕业院校！");
 document.edit.lastschool.focus();
 return false;
 }
    if (document.edit.byear.value==""){
 alert("请填写您的毕业年份！");
 document.edit.byear.focus();
 return false;
 }
  if (document.edit.byear.value.match(/\D/)){
 alert("毕业年份必须是合法的数字！");
 document.edit.byear.focus();
 return false;
 }
   if (document.edit.speciality.value==""){
 alert("请填写您的专业名称！");
 document.edit.speciality.focus();
 return false;
 } 
 }

