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
if (document.reg.com_name.value=="")
{
 alert("�����뵥λ�����ƣ�");
 document.reg.com_name.focus();
 return false;
}
if (document.reg.com_property.options[document.reg.com_property.selectedIndex].value=="")
{
 alert("��ѡ��λ�����ʣ�");
 document.reg.com_property.focus();
 return false;
}
if (document.reg.jobname.value=="")
{
 alert("��������Ƹְλ�����ƣ�");
 document.reg.jobname.focus();
 return false;
}
if (document.reg.require.value=="")
{
 alert("������ְλ�ľ���Ҫ��");
 document.reg.require.focus();
 return false;
}

}

