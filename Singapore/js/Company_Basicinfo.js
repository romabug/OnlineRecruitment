

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
 
  if (document.edit.companyname.value==""){
 alert("企业名称不能是空值！");
 document.edit.companyname.focus();
 return false;
 }

   if (document.edit.set_year.value==""){
 alert("企业成立时间不能是空值！");
 document.edit.set_year.focus();
 return false;
 }
 if (document.edit.set_year.value.match(/\D/)){
 alert("企业成立年份必须是数字！");
 document.edit.set_year.focus();
 return false;
 }
 if (document.edit.reg_currency.value==""){
 alert("企业注册资金不能是空值！");
 document.edit.reg_currency.focus();
 return false;
 }
  if (document.edit.reg_currency.value.match(/\D/)){
 alert("企业注册资金必须是数字！");
 document.edit.reg_currency.focus();
 return false;
 }

 if (document.edit.company_memo.value==""){
 alert("企业简介不能是空值！");
 document.edit.company_memo.focus();
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
 if (!is_number(document.edit.companyfax.value)){
 alert("传真只能是数字0-9和-！");
 document.edit.companyfax.focus();
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
 alert("邮政编码必须输入！");
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


