 function is_number(str)
{
	exp=/[^0-9().]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
}

function reg_check()
{
if (document.reg.jobname.value=="")
{
 alert("��������ͷְλ�����ƣ�");
 document.reg.jobname.focus();
 return false;
}
if (document.reg.require.value=="")
{
 alert("������ְλ�ľ���������");
 document.reg.require.focus();
 return false;
}

}

