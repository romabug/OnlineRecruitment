 function is_number(str)
{
	exp=/[^0-9().]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
}

function check_reg()
{
if (document.reg.bookname.value=="")
{
 alert("�������鼮�����ƣ�");
 document.reg.bookname.focus();
 return false;
}

if (document.reg.price.value=="")
{
 alert("�������鼮�ļ۸�");
 document.reg.price.focus();
 return false;
}
if (!is_number(document.reg.price.value))
{
 alert("�鼮�۸���������ֺ�.������ɣ�");
 document.reg.price.focus();
 return false;
}

if (document.reg.pubname.value=="")
{
 alert("��������������ƣ�");
 document.reg.pubname.focus();
 return false;
}
if (document.reg.pubdate.value=="")
{
 alert("������������ڣ�");
 document.reg.pubdate.focus();
 return false;
}

if (document.reg.content.value=="")
{
 alert("�������鼮����ϸ��Ϣ��");
 document.reg.content.focus();
 return false;
}
if (document.reg.memo.value=="")
{
 alert("���������ݽ��ܣ�");
 document.reg.memo.focus();
 return false;
}
if (document.reg.auther.value=="")
{
 alert("���������߽��ܣ�");
 document.reg.auther.focus();
 return false;
}

}

