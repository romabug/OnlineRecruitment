

function is_zw(str)
  {
	exp=/[0-9a-zA-Z_]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
  }
 
 function is_number(str)
{
	exp=/[^0-9()-]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
}


function form_check()
{
 if (document.theForm.slt_selectedjobs.value==""){
 alert("��ѡ��ְλ���");
 document.theForm.slt_category.focus();
 return false;
 }
 
 if (document.theForm.jobname.value==""){
 alert("ְλ���Ʋ����ǿ�ֵ��");
 document.theForm.jobname.focus();
 return false;
 }

 if (document.theForm.number.value==""){
 alert("��Ƹ���������ǿ�ֵ��");
 document.theForm.number.focus();
 return false;
 }
 if (document.theForm.number.value.match(/\D/)){
 alert("��Ƹ�������������֣�");
 document.theForm.number.focus();
 return false;
 }
 
 if (document.theForm.deal.value==""){
 alert("����ˮƽ�����ǿ�ֵ��");
 document.theForm.deal.focus();
 return false;
 }
 if (document.theForm.deal.value.match(/\D/)){
 alert("����ˮƽ���������֣�");
 document.theForm.deal.focus();
 return false;
 }

 if (document.theForm.end_year.value==""){
 alert("��ֹ��ݲ����ǿ�ֵ��");
 document.theForm.end_year.focus();
 return false;
 }
 if (document.theForm.end_year.value.match(/\D/)){
 alert("��ֹ��ݱ��������֣�");
 document.theForm.end_year.focus();
 return false;
 }

 if (document.theForm.slt_selectedplaces.value==""){
 alert("��ѡ����������");
 document.theForm.slt_workplacearea.focus();
 return false;
 }

 if (document.theForm.require.value==""){
 alert("����Ҫ�����ǿ�ֵ��");
 document.theForm.require.focus();
 return false;
 }

 if (document.theForm.contactperson.value==""){
 alert("��ϵ�˲����ǿ�ֵ��");
 document.theForm.contactperson.focus();
 return false;
 }
 if (document.theForm.phone.value==""){
 alert("��ϵ�绰�����ǿ�ֵ��");
 document.theForm.phone.focus();
 return false;
 }
 if (!is_number(document.theForm.phone.value)){
 alert("��ϵ�绰ֻ��������0-9��-��");
 document.theForm.phone.focus();
 return false;
 }
 if (!is_number(document.theForm.companyfax.value)){
 alert("����ֻ��������0-9��-��");
 document.theForm.companyfax.focus();
 return false;
 }
 if (document.theForm.email.value==""){
 alert("����������룡");
 document.theForm.email.focus();
 return false;
 }

 if(document.theForm.email.value.indexOf("@")==-1 || document.theForm.email.value.indexOf(".")==-1){ 
 alert("�����ʽ����ȷ��");
 document.theForm.email.focus();
 return false;
	}

 if (document.theForm.zipcode.value==""){
 alert("��������������룡");
 document.theForm.zipcode.focus();
 return false;
 } 
 if (document.theForm.zipcode.value.match(/\D/)){
 alert("����������������֣�");
 document.theForm.zipcode.focus();
 return false;
 }
 
 if (document.theForm.address.value==""){
 alert("ͨѶ��ַ�������룡");
 document.theForm.address.focus();
 return false;
 }	
 }


