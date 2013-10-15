

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


 function check_reg(){
 
  if (document.reg.corpname.value==""){
 alert("中介公司名称不能是空值！请继续注册...");
 document.reg.corpname.focus();
 return false;
 }
 if (!is_zw(document.reg.corpname.value)){
 alert("中介公司名称必须是中文文字！请继续注册...");
 document.reg.corpname.focus();
 return false;
 }
 
 if (document.reg.content.value==""){
 alert("中介公司介绍不能是空值！请继续注册...");
 document.reg.content.focus();
 return false;
 }
 
 if (document.reg.contactperson.value==""){
 alert("联系人不能是空值！请继续注册...");
 document.reg.contactperson.focus();
 return false;
 }
 if (document.reg.phone.value==""){
 alert("联系电话不能是空值！请继续注册...");
 document.reg.phone.focus();
 return false;
 }
 if (!is_number(document.reg.phone.value)){
 alert("联系电话只能是数字0-9和-！请继续注册...");
 document.reg.phone.focus();
 return false;
 }
 if (!is_number(document.reg.fax.value)){
 alert("传真只能是数字0-9和-！请继续注册...");
 document.reg.fax.focus();
 return false;
 }
 if (document.reg.email.value==""){
 alert("邮箱必须输入！请继续注册...");
 document.reg.email.focus();
 return false;
 }

 if(document.reg.email.value.indexOf("@")==-1 || document.reg.email.value.indexOf(".")==-1){ 
 alert("邮箱格式不正确！请继续注册...");
 document.reg.email.focus();
 return false;
 }
 
 if (document.reg.zipcode.value==""){
 alert("邮政编码不能为空！请继续注册...");
 document.reg.zipcode.focus();
 return false;
 } 
 if (document.reg.zipcode.value.match(/\D/)){
 alert("邮政编码必须是数字！请继续注册...");
 document.reg.zipcode.focus();
 return false;
 }
 if (document.reg.address.value==""){
 alert("通讯地址必须输入！请继续注册...");
 document.reg.address.focus();
 return false;
 }	
 }
