		   function works_check(){
		    if (document.works.begin_year.value==""){
			 alert("-请输入起始年份！-");
			 document.works.begin_year.focus();
			 return false;
			}
			if (document.works.begin_year.value.match(/\D/)){
			 alert("-起始年份必须是合法的数字！-");
			 document.works.begin_year.focus();
			 return false;
			}
			 if (document.works.end_year.value==""){
			 alert("-请输入结束年份！-");
			 document.works.end_year.focus();
			 return false;
			}
			if (document.works.end_year.value.match(/\D/)){
			 alert("-结束年份必须是合法的数字！-");
			 document.works.end_year.focus();
			 return false;
			}

			
			 if (document.works.companyname.value==""){
			 alert("-请输入企业名称！-");
			 document.works.companyname.focus();
			 return false;
			}
			if (document.works.workname.value==""){
			 alert("-请输入所担任的职位！-");
			 document.works.workname.focus();
			 return false;
			}
			if (document.works.workmemo.value==""){
			 alert("-请输入工作描述！-");
			 document.works.workmemo.focus();
			 return false;
			}
            
		   }
