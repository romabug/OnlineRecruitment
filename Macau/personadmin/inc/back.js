function check_username()
{
document.preview.username.value=document.form1.username.value;
username=document.form1.username.value;
for (nIndex=0; nIndex<username.length; nIndex++)      
  {      
  cCheck = username.charAt(nIndex);      
  if (!(IsDigit(cCheck) || IsAlpha(cCheck) || cCheck=='_' ))      
   {      
   alert("用户帐号只能使用字母、数字和下划线_，并且不能使用中文");      
   form1.username.focus();      
   return;      
   }      
  }
	if (fucCheckLength(document.preview.username.value) <6 )
	{
		alert("用户帐号必须至少6位");
		form1.username.focus();
		return;
	}
//document.preview.email.value=document.theForm.e_mail.value;
var popupWin = window.open('', 'preview_page', 'scrollbars=yes,width=300,height=100');
document.preview.submit()
}