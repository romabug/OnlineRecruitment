      function checkaccount(username)
    {
      var re, r;
    
      re = /\S/;
      r = username.match(re);
      if (!r)
      {
        alert("�������û�����");
        return false;
      }
      else
      {
        window.open("Accountcheck.asp?action=cusername&value="+username,"")
      }
    }
   function checkuseremail(username)
    {
      var re, r;
    
      re = /\S/;
      r = username.match(re);
      if (!r)
      {
        alert("�������ַ��");
        return false;
      }
      else
      {
        window.open("Accountcheck.asp?action=cuseremail&value="+username,"")
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
 alert("�û�������Ϊ�գ������ע��...");
 document.reg.username.focus();
 return false;
 }
  if (document.reg.username.value.length<4 || document.reg.username.value.length>20){
 alert("�û���������4-20λ���ַ��������ע��...");
 document.reg.username.focus();
 return false;
 }
 if (is_zw(document.reg.username.value)){
  alert("�û����������������֣������ע��...");
  document.reg.username.focus();
  return false;
 }
 if (document.reg.password.value==""){
 alert("���벻���ǿ�ֵ�������ע��...");
 document.reg.password.focus();
 return false;
 }
 if (document.reg.password.value==document.reg.username.value ){
 alert("���벻�����û�����ͬ�������ע��...");
 document.reg.password.focus();
 return false;
 } 
 if (document.reg.password.value.length<6 ){
 alert("���벻�ܵ���6λ�ķ��ţ������ע��...");
 document.reg.password.focus();
 return false;
 }
 if (document.reg.password2.value==""){
 alert("ȷ�����벻���ǿ�ֵ�������ע��...");
 document.reg.password2.focus();
 return false;
 }
 if (document.reg.password2.value!=document.reg.password.value){
 alert("ȷ�����������벻��ͬ�������ע��...");
 document.reg.password2.focus();
 return false;
 }
 
  if (document.reg.question.value==""){
  alert("������ʾ����������룡�����ע��...");
  document.reg.question.focus();
  return false;
 }
  if (document.reg.answer.value==""){
  alert("��ʾ�𰸱������룡�����ע��...");
  document.reg.answer.focus();
  return false;
 }
 
 if (document.reg.useremail.value==""){
 alert("�û�������������룡�����ע��...");
 document.reg.useremail.focus();
 return false;
 }
 if(document.reg.useremail.value.indexOf("@")==-1 || document.reg.useremail.value.indexOf(".")==-1){ 
 alert("�û��������ʽ����ȷ�������ע��...");
 document.reg.useremail.focus();
 return false;
	}
 }
