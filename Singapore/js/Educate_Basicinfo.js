

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
 
  if (document.edit.schoolname.value==""){
 alert("培训机构名称不能是空值！请继续注册...");
 document.edit.schoolname.focus();
 return false;
 }
 
  if (!is_zw(document.edit.schoolname.value)){
 alert("培训机构名称必须是中文文字！请继续注册...");
 document.edit.schoolname.focus();
 return false;
 }
   if (document.edit.set_year.value==""){
 alert("成立日期不能是空值！请继续注册...");
 document.edit.set_year.focus();
 return false;
 }
 if (document.edit.set_year.value.match(/\D/)){
 alert("成立年份必须是数字！请继续注册...");
 document.edit.set_year.focus();
 return false;
 }


 if (document.edit.school_memo.value==""){
 alert("机构简介不能是空值！请继续注册...");
 document.edit.school_memo.focus();
 return false;
 }
  if (document.edit.contactperson.value==""){
 alert("联系人不能是空值！请继续注册...");
 document.edit.contactperson.focus();
 return false;
 }
 if (document.edit.phone.value==""){
 alert("联系电话不能是空值！请继续注册...");
 document.edit.phone.focus();
 return false;
 }
 if (!is_number(document.edit.phone.value)){
 alert("联系电话只能是数字0-9和-！请继续注册...");
 document.edit.phone.focus();
 return false;
 }
  if (!is_number(document.edit.fax.value)){
 alert("传真只能是数字0-9和-！请继续注册...");
 document.edit.fax.focus();
 return false;
 }
 if (document.edit.email.value==""){
 alert("邮箱必须输入！请继续注册...");
 document.edit.email.focus();
 return false;
 }

 if(document.edit.email.value.indexOf("@")==-1 || document.edit.email.value.indexOf(".")==-1){ 
 alert("邮箱格式不正确！请继续注册...");
 document.edit.email.focus();
 return false;
 }
 
 if (document.edit.zipcode.value==""){
 alert("邮政编码不能为空！请继续注册...");
 document.edit.zipcode.focus();
 return false;
 } 
 if (document.edit.zipcode.value.match(/\D/)){
 alert("邮政编码必须是数字！请继续注册...");
 document.edit.zipcode.focus();
 return false;
 }
 if (document.edit.address.value==""){
 alert("通讯地址必须输入！请继续注册...");
 document.edit.address.focus();
 return false;
 }	
 }
