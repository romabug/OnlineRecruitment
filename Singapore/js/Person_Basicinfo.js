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
 if (document.edit.realname.value==""){
 alert("用户真实姓名不能为空值！");
 document.edit.realname.focus();
 return false;
 }
 if (!is_zw(document.edit.realname.value)){
 alert("用户真实姓名必须是中文文字！");
 document.edit.realname.focus();
 return false;
 }
  if (document.edit.realname.value.length<2 || document.edit.realname.value.length>10){
 alert("用户真实姓名必须是2-10个中文文字组成！");
 document.edit.realname.focus();
 return false;
 }
 if (document.edit.birthyear.value==""){
 alert("出生年份不能为空值！");
 document.edit.birthyear.focus();
 return false;
 }
  if (document.edit.stature.value==""){
 alert("您的身高不能为空值！");
 document.edit.stature.focus();
 return false;
 }
 if (document.edit.stature.value.match(/\D/)){
 alert("您的身高必须是合法的数字！");
 document.edit.stature.focus();
 return false;
 }
   if (document.edit.tizhong.value==""){
 alert("您的体重不能为空值！");
 document.edit.tizhong.focus();
 return false;
 }
 if (document.edit.tizhong.value.match(/\D/)){
 alert("您的体重必须是合法的数字！");
 document.edit.tizhong.focus();
 return false;
 }
   if (document.edit.codeid.value==""){
 alert("您的证件号码不能为空值！");
 document.edit.codeid.focus();
 return false;
 }
if (document.edit.personphone.value==""){
 alert("您的联系电话不能为空值！");
 document.edit.personphone.focus();
 return false;
 }
if (!is_number(document.edit.personphone.value)){
 alert("联系电话只能含有0-9和-！");
 document.edit.personphone.focus();
 return false;
 } 
 
 if (document.edit.msnqq.value!="")
 {
  if (document.edit.msnqq.value.match(/\D/))
  {
   alert("您的QQ号码必须是合法的数字！");
   document.edit.msnqq.focus();
   return false;
  } 
 }
 
  if (document.edit.useremail.value==""){
 alert("邮箱必须输入！请继续注册...");
 document.edit.useremail.focus();
 return false;
 }

 if(document.edit.useremail.value.indexOf("@")==-1 || document.edit.useremail.value.indexOf(".")==-1){ 
 alert("邮箱格式不正确！请继续注册...");
 document.edit.useremail.focus();
 return false;
	}

 if (document.edit.zipcode.value==""){
 alert("邮政编码必须输入！请继续注册...");
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

