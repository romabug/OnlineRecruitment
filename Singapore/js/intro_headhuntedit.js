 function is_number(str)
{
	exp=/[^0-9().]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
}

function edit_check()
{
if (document.edit.jobname.value=="")
{
 alert("��������ͷְλ�����ƣ�");
 document.edit.jobname.focus();
 return false;
}
if (document.edit.require.value=="")
{
 alert("������ְλ�ľ���������");
 document.edit.require.focus();
 return false;
}

}

