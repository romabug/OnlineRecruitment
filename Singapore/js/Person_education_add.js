
function edus_check(){
		    if (document.edus.begin_year.value==""){
			 alert("-��������ѧʱ�䣡-");
			 document.edus.begin_year.focus();
			 return false;
			}
		    if (document.edus.begin_year.value.match(/\D/)){
			 alert("-��ѧʱ����������֣�-");
			 document.edus.begin_year.focus();
			 return false;
			}
						
			 if (document.edus.end_year.value==""){
			 alert("-�������ҵʱ�䣡-");
			 document.edus.end_year.focus();
			 return false;
			}
			 if (document.edus.end_year.value.match(/\D/)){
			 alert("-��ҵʱ����������֣�-");
			 document.edus.end_year.focus();
			 return false;
			}			
			
			 if (document.edus.schoolname.value==""){
			 alert("-�������ҵԺУ���ƣ�-");
			 document.edus.schoolname.focus();
			 return false;
			}
			
		   }
		   
		   
function trains_check(){
		    if (document.edus.begin_year.value==""){
			 alert("-�����뿪ʼѧϰʱ�䣡-");
			 document.edus.begin_year.focus();
			 return false;
			}
		    if (document.edus.begin_year.value.match(/\D/)){
			 alert("-��ʼѧϰ���������֣�-");
			 document.edus.begin_year.focus();
			 return false;
			}
						
			 if (document.edus.end_year.value==""){
			 alert("-�������ҵʱ�䣡-");
			 document.edus.end_year.focus();
			 return false;
			}
			 if (document.edus.end_year.value.match(/\D/)){
			 alert("-��ҵʱ����������֣�-");
			 document.edus.end_year.focus();
			 return false;
			}			
			
			 if (document.edus.schoolname.value==""){
			 alert("-��������ѵ���������ƣ�-");
			 document.edus.schoolname.focus();
			 return false;
			}

			 if (document.edus.speciality.value==""){
			 alert("-��������ѵ�γ̵����ƣ�-");
			 document.edus.speciality.focus();
			 return false;
			}		
		   }