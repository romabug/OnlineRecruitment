function check_username()
{
document.preview.username.value=document.form1.username.value;
username=document.form1.username.value;
for (nIndex=0; nIndex<username.length; nIndex++)      
  {      
  cCheck = username.charAt(nIndex);      
  if (!(IsDigit(cCheck) || IsAlpha(cCheck) || cCheck=='_' ))      
   {      
   alert("�û��ʺ�ֻ��ʹ����ĸ�����ֺ��»���_�����Ҳ���ʹ������");      
   form1.username.focus();      
   return;      
   }      
  }
	if (fucCheckLength(document.preview.username.value) <6 )
	{
		alert("�û��ʺű�������6λ");
		form1.username.focus();
		return;
	}
//document.preview.email.value=document.theForm.e_mail.value;
var popupWin = window.open('', 'preview_page', 'scrollbars=yes,width=300,height=100');
document.preview.submit()
}