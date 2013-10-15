

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
 if (document.edit.phone.value==""){
 alert("联系电话不能是空值！");
 document.edit.phone.focus();
 return false;
 }
 if (!is_number(document.edit.phone.value)){
 alert("联系电话只能是数字0-9和-！");
 document.edit.phone.focus();
 return false;
 }
  if (!is_number(document.edit.mt.value)){
 alert("手机号码只能是数字0-9和-！");
 document.edit.mt.focus();
 return false;
 }
 if (document.edit.email.value==""){
 alert("邮箱必须输入！");
 document.edit.email.focus();
 return false;
 }

 if(document.edit.email.value.indexOf("@")==-1 || document.edit.email.value.indexOf(".")==-1){ 
 alert("邮箱格式不正确！");
 document.edit.email.focus();
 return false;
 }
 
 if (document.edit.zipcode.value.match(/\D/)){
 alert("邮政编码必须是数字！");
 document.edit.zipcode.focus();
 return false;
 }
 }
