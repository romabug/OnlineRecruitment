
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
 if (document.reg.realname.value==""){
 alert("用户真实姓名不能为空值！请继续注册...");
 document.reg.realname.focus();
 return false;
 }
 if (!is_zw(document.reg.realname.value)){
 alert("用户真实姓名必须是中文文字！请继续注册...");
 document.reg.realname.focus();
 return false;
 }
  if (document.reg.realname.value.length<2 || document.reg.realname.value.length>10){
 alert("用户真实姓名必须是2-10个中文文字组成！请继续注册...");
 document.reg.realname.focus();
 return false;
 }
 
 if (document.reg.birthyear.value==""){
 alert("出生年份不能为空值！请继续注册...");
 document.reg.birthyear.focus();
 return false;
 }
 if (document.reg.birthyear.value.match(/\D/)){
 alert("出生年份必须是合法的数字！请继续注册...");
 document.reg.birthyear.focus();
 return false;
 }
 
  if (document.reg.stature.value==""){
 alert("您的身高不能为空值！请继续注册...");
 document.reg.stature.focus();
 return false;
 }
 if (document.reg.stature.value.match(/\D/)){
 alert("您的身高必须是合法的数字！请继续注册...");
 document.reg.stature.focus();
 return false;
 }

  if (document.reg.tizhong.value==""){
 alert("您的体重不能为空值！请继续注册...");
 document.reg.tizhong.focus();
 return false;
 }
 if (document.reg.tizhong.value.match(/\D/)){
 alert("您的体重必须是合法的数字！请继续注册...");
 document.reg.tizhong.focus();
 return false;
 }
 
 if (document.reg.codeid.value==""){
 alert("您的证件号码不能为空值！请继续注册...");
 document.reg.codeid.focus();
 return false;
 }
  if (document.reg.codetype.options[document.reg.codetype.selectedIndex].value=="0"){
  if (document.reg.codeid.value.length<15){
   alert("您的证件号码格式不正确！请继续注册...");
   document.reg.codeid.focus();
   return false;
  }
 }
 if (document.reg.codetype.options[document.reg.codetype.selectedIndex].value=="3"){
  if (document.reg.codeid.value.length<8){
   alert("您的证件号码格式不正确！请继续注册...");
   document.reg.codeid.focus();
   return false;
  }
 }
 
 if (document.reg.lastschool.value==""){
 alert("请填写您的毕业院校！请继续注册...");
 document.reg.lastschool.focus();
 return false;
 }
    if (document.reg.byear.value==""){
 alert("请填写您的毕业年份！请继续注册...");
 document.reg.byear.focus();
 return false;
 }
  if (document.reg.byear.value.match(/\D/)){
 alert("毕业年份必须是合法的数字！请继续注册...");
 document.reg.byear.focus();
 return false;
 }
   if (document.reg.speciality.value==""){
 alert("请填写您的专业名称！请继续注册...");
 document.reg.speciality.focus();
 return false;
 } 
    if (document.reg.personphone.value==""){
 alert("您的联系电话不能为空值！请继续注册...");
 document.reg.personphone.focus();
 return false;
 }
 if (!is_number(document.reg.personphone.value)){
 alert("联系电话只能含有0-9和-！请继续注册...");
 document.reg.personphone.focus();
 return false;
 } 
  if (!is_number(document.reg.mt.value)){
 alert("移动电话只能含有0-9和-！请继续注册...");
 document.reg.mt.focus();
 return false;
 } 
 if (document.reg.zipcode.value==""){
 alert("邮政编码不能为空！请继续注册...");
 document.reg.zipcode.focus();
 return false;
 }
 if (document.reg.zipcode.value.match(/\D/)){
 alert("邮政编码必须是合法的数字！请继续注册...");
 document.reg.zipcode.focus();
 return false;
 }
 if (document.reg.address.value==""){
 alert("通讯地址不能为空！请继续注册...");
 document.reg.address.focus();
 return false;
 }
 }

