
 function form_check()
 {
 
 if (document.edit.deptname.value==""){
 alert("��������ҵ�������ƣ�");
 document.edit.deptname.focus();
 return false;
 }

 if (document.edit.burden.value==""){
 alert("�����벿�����ܵ�������");
 document.edit.burden.focus();
 return false;
 }
 
 if (document.edit.email.value==""){
 alert("�������ʼ���ַ��");
 document.edit.email.focus();
 return false;
 }
 if(document.edit.email.value.indexOf("@")==-1 || document.edit.email.value.indexOf(".")==-1){ 
 alert("�ʼ���ʽ����ȷ��");
 document.edit.email.focus();
 return false;
	}
 }


