function theForm_check()
{
if (document.theForm.name.value=="")
{
 alert("��ѡ���������������ƣ�");
 document.theForm.name.focus();
 return false;
}

if (document.theForm.slt_selectedjobs.value=="")
{
 alert("��ѡ������ְλ���");
 document.theForm.slt_selectedjobs.focus();
 return false;
}
if (document.theForm.slt_selectedplaces.value=="")
{
 alert("��ѡ��������������");
 document.theForm.slt_selectedplaces.focus();
 return false;
}

}