     function checkAccount(username)
    {
      var re, r;
    
      re = /\S/;
      r = username.match(re);
      if (!r)
      {
        alert("请输入用户名！");
        return false;
      }
      else
      {
        window.open("AccountCheck.asp?action=cusername&value="+username,"")
      }
    }
   function checkmailbox(username)
    {
      var re, r;
    
      re = /\S/;
      r = username.match(re);
      if (!r)
      {
        alert("请邮箱地址！");
        return false;
      }
      else
      {
        window.open("AccountCheck.asp?action=cmailbox&value="+username,"")
      }
    }

   function is_zw(str)
  {
	exp=/[0-9a-zA-Z_]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
  }

 function check_reg(){
 if (document.reg.username.value==""){
 alert("用户名不能为空！请继续注册...");
 document.reg.username.focus();
 return false;
 }
  if (document.reg.username.value.length<4 || document.reg.username.value.length>20){
 alert("用户名必须是4-20位的字符！请继续注册...");
 document.reg.username.focus();
 return false;
 }
 if (is_zw(document.reg.username.value)){
  alert("用户名不能是中文文字！请继续注册...");
  document.reg.username.focus();
  return false;
 }
 if (document.reg.password.value==""){
 alert("密码不能是空值！请继续注册...");
 document.reg.password.focus();
 return false;
 }

 if (document.reg.password.value.length<6 ){
 alert("密码不能低于6位的符号！请继续注册...");
 document.reg.password.focus();
 return false;
 }
 
 if (document.reg.password2.value==""){
 alert("确认密码不能是空值！请继续注册...");
 document.reg.password2.focus();
 return false;
 }
 
 if (document.reg.password2.value!=document.reg.password.value){
 alert("确认密码与密码不相同！请继续注册...");
 document.reg.password2.focus();
 return false;
 }
 if (document.reg.question.value==""){
 alert("用于找回密码的提示问题不能为空！请继续注册...");
 document.reg.question.focus();
 return false;
 }
 if (document.reg.answer.value==""){
 alert("用于找回密码的问题答案不能为空！请继续注册...");
 document.reg.answer.focus();
 return false;
 }
  
 if (document.reg.mailbox.value==""){
 alert("用户的邮箱必须输入！请继续注册...");
 document.reg.mailbox.focus();
 return false;
 }
 if(document.reg.mailbox.value.indexOf("@")==-1 || document.reg.mailbox.value.indexOf(".")==-1){ 
 alert("用户的邮箱格式不正确！请继续注册...");
 document.reg.mailbox.focus();
 return false;
	}
 }
