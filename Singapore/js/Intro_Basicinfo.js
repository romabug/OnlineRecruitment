

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
 alert("中介公司名称不能是空值！");
 document.edit.corpname.focus();
 return false;
 }
 if (!is_zw(document.edit.corpname.value)){
 alert("中介公司名称必须是中文文字！");
 document.edit.corpname.focus();
 return false;
 }
 
 if (document.edit.content.value==""){
 alert("中介公司介绍不能是空值！");
 document.edit.content.focus();
 return false;
 }
 
 if (document.edit.contactperson.value==""){
 alert("联系人不能是空值！");
 document.edit.contactperson.focus();
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
 if (!is_number(document.edit.fax.value)){
 alert("传真只能是数字0-9和-！");
 document.edit.fax.focus();
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
 
 if (document.edit.zipcode.value==""){
 alert("邮政编码不能为空！");
 document.edit.zipcode.focus();
 return false;
 } 
 if (document.edit.zipcode.value.match(/\D/)){
 alert("邮政编码必须是数字！");
 document.edit.zipcode.focus();
 return false;
 }
 if (document.edit.address.value==""){
 alert("通讯地址必须输入！");
 document.edit.address.focus();
 return false;
 }	
 }
