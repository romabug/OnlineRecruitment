

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
 alert("真实姓名不能为空!");
 document.edit.name.focus();
 return false;
 }

 if (document.edit.content.value==""){
 alert("留言信息不能是空值！");
 document.edit.content.focus();
 return false;
 }

 }
