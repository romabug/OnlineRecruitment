

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
 alert("请选择职位类别！");
 document.theForm.slt_category.focus();
 return false;
 }
 
 if (document.theForm.jobname.value==""){
 alert("职位名称不能是空值！");
 document.theForm.jobname.focus();
 return false;
 }

 if (document.theForm.number.value==""){
 alert("招聘人数不能是空值！");
 document.theForm.number.focus();
 return false;
 }
 if (document.theForm.number.value.match(/\D/)){
 alert("招聘人数必须是数字！");
 document.theForm.number.focus();
 return false;
 }
 
 if (document.theForm.deal.value==""){
 alert("待遇水平不能是空值！");
 document.theForm.deal.focus();
 return false;
 }
 if (document.theForm.deal.value.match(/\D/)){
 alert("待遇水平必须是数字！");
 document.theForm.deal.focus();
 return false;
 }

 if (document.theForm.end_year.value==""){
 alert("截止年份不能是空值！");
 document.theForm.end_year.focus();
 return false;
 }
 if (document.theForm.end_year.value.match(/\D/)){
 alert("截止年份必须是数字！");
 document.theForm.end_year.focus();
 return false;
 }

 if (document.theForm.slt_selectedplaces.value==""){
 alert("请选择工作地区！");
 document.theForm.slt_workplacearea.focus();
 return false;
 }

 if (document.theForm.require.value==""){
 alert("具体要求不能是空值！");
 document.theForm.require.focus();
 return false;
 }

 if (document.theForm.contactperson.value==""){
 alert("联系人不能是空值！");
 document.theForm.contactperson.focus();
 return false;
 }
 if (document.theForm.phone.value==""){
 alert("联系电话不能是空值！");
 document.theForm.phone.focus();
 return false;
 }
 if (!is_number(document.theForm.phone.value)){
 alert("联系电话只能是数字0-9和-！");
 document.theForm.phone.focus();
 return false;
 }
 if (!is_number(document.theForm.companyfax.value)){
 alert("传真只能是数字0-9和-！");
 document.theForm.companyfax.focus();
 return false;
 }
 if (document.theForm.email.value==""){
 alert("邮箱必须输入！");
 document.theForm.email.focus();
 return false;
 }

 if(document.theForm.email.value.indexOf("@")==-1 || document.theForm.email.value.indexOf(".")==-1){ 
 alert("邮箱格式不正确！");
 document.theForm.email.focus();
 return false;
	}

 if (document.theForm.zipcode.value==""){
 alert("邮政编码必须输入！");
 document.theForm.zipcode.focus();
 return false;
 } 
 if (document.theForm.zipcode.value.match(/\D/)){
 alert("邮政编码必须是数字！");
 document.theForm.zipcode.focus();
 return false;
 }
 
 if (document.theForm.address.value==""){
 alert("通讯地址必须输入！");
 document.theForm.address.focus();
 return false;
 }	
 }


