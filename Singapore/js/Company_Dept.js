
 function form_check()
 {
 
 if (document.edit.deptname.value==""){
 alert("请输入企业部门名称！");
 document.edit.deptname.focus();
 return false;
 }

 if (document.edit.burden.value==""){
 alert("请输入部门主管的姓名！");
 document.edit.burden.focus();
 return false;
 }
 
 if (document.edit.email.value==""){
 alert("请输入邮件地址！");
 document.edit.email.focus();
 return false;
 }
 if(document.edit.email.value.indexOf("@")==-1 || document.edit.email.value.indexOf(".")==-1){ 
 alert("邮件格式不正确！");
 document.edit.email.focus();
 return false;
	}
 }


