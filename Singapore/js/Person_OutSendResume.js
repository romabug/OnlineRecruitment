function theForm_check()
{
if (document.theForm.emailurl.value=="")
{
 alert("��ѡ����������ʼ������ʼ���ַ��");
 document.theForm.emailurl.focus();
 return false;
}
if (document.theForm.emailurl.value.indexOf("@")==-1 || document.theForm.emailurl.value.indexOf(".")==-1)
{
 alert("�ʼ���ַ����ʽ��ȷ��");
 document.theForm.emailurl.focus();
 return false;
}

if (document.theForm.title.value=="")
{
 alert("��ѡ�������ʼ��ı��⣡");
 document.theForm.title.focus();
 return false;
}

if (document.theForm.memo.value=="")
{
 alert("��ѡ�������ʼ������ݣ�");
 document.theForm.memo.focus();
 return false;
}
}