function theForm_check()
{

if (document.theForm.slt_selectedjobs.value=="")
{
 alert("��ѡ����ϣ���Ĺ�����λ��");
 document.theForm.slt_selectedjobs.focus();
 return false;
}
if (document.theForm.slt_selectedplaces.value=="")
{
 alert("��ѡ����ϣ���Ĺ���������");
 document.theForm.slt_selectedplaces.focus();
 return false;
}

if (document.theForm.deal.value=="")
{ 
 alert("-���������Ĵ���Ҫ��!-");
 document.theForm.deal.focus();
 return false;
 }
if (document.theForm.deal.value.match(/\D/))
{ 
 alert("-����Ҫ����������ָ�ʽ!-");
 document.theForm.deal.focus();
 return false;
 }
 
if (document.theForm.develop.value=="")
{ 
 alert("-���������ķ�չ����!-");
 document.theForm.develop.focus();
 return false;
 }
 
if (document.theForm.jobcontent.value=="")
{ 
 alert("-������������ְ��!-");
 document.theForm.jobcontent.focus();
 return false;
 }

}