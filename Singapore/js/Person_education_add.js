
function edus_check(){
		    if (document.edus.begin_year.value==""){
			 alert("-请输入入学时间！-");
			 document.edus.begin_year.focus();
			 return false;
			}
		    if (document.edus.begin_year.value.match(/\D/)){
			 alert("-入学时间必须是数字！-");
			 document.edus.begin_year.focus();
			 return false;
			}
						
			 if (document.edus.end_year.value==""){
			 alert("-请输入毕业时间！-");
			 document.edus.end_year.focus();
			 return false;
			}
			 if (document.edus.end_year.value.match(/\D/)){
			 alert("-毕业时间必须是数字！-");
			 document.edus.end_year.focus();
			 return false;
			}			
			
			 if (document.edus.schoolname.value==""){
			 alert("-请输入毕业院校名称！-");
			 document.edus.schoolname.focus();
			 return false;
			}
			
		   }
		   
		   
function trains_check(){
		    if (document.edus.begin_year.value==""){
			 alert("-请输入开始学习时间！-");
			 document.edus.begin_year.focus();
			 return false;
			}
		    if (document.edus.begin_year.value.match(/\D/)){
			 alert("-开始学习必须是数字！-");
			 document.edus.begin_year.focus();
			 return false;
			}
						
			 if (document.edus.end_year.value==""){
			 alert("-请输入毕业时间！-");
			 document.edus.end_year.focus();
			 return false;
			}
			 if (document.edus.end_year.value.match(/\D/)){
			 alert("-毕业时间必须是数字！-");
			 document.edus.end_year.focus();
			 return false;
			}			
			
			 if (document.edus.schoolname.value==""){
			 alert("-请输入培训机构的名称！-");
			 document.edus.schoolname.focus();
			 return false;
			}

			 if (document.edus.speciality.value==""){
			 alert("-请输入培训课程的名称！-");
			 document.edus.speciality.focus();
			 return false;
			}		
		   }