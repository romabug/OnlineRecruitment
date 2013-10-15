

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
 
  if (document.reg.schoolname.value==""){
 alert("培训机构名称不能是空值！请继续注册...");
 document.reg.schoolname.focus();
 return false;
 }
 
  if (!is_zw(document.reg.schoolname.value)){
 alert("培训机构名称必须是中文文字！请继续注册...");
 document.reg.schoolname.focus();
 return false;
 }
   if (document.reg.set_year.value==""){
 alert("成立日期不能是空值！请继续注册...");
 document.reg.set_year.focus();
 return false;
 }
 if (document.reg.set_year.value.match(/\D/)){
 alert("成立年份必须是数字！请继续注册...");
 document.reg.set_year.focus();
 return false;
 }


 if (document.reg.school_memo.value==""){
 alert("机构简介不能是空值！请继续注册...");
 document.reg.school_memo.focus();
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
