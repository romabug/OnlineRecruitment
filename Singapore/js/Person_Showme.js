function theForm_check()
{

if (document.theForm.slt_selectedjobs.value=="")
{
 alert("��ѡ����ϣ���Ĺ�����λ��");
 document.theForm.slt_selectedjobs.focus();
 return false;
}
if (document.theForm.ads.value=="")
{ 
 alert("-�����������Լ�����!-");
 document.theForm.ads.focus();
 return false;
 }
 
}