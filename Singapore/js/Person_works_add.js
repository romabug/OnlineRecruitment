		   function works_check(){
		    if (document.works.begin_year.value==""){
			 alert("-��������ʼ��ݣ�-");
			 document.works.begin_year.focus();
			 return false;
			}
			if (document.works.begin_year.value.match(/\D/)){
			 alert("-��ʼ��ݱ����ǺϷ������֣�-");
			 document.works.begin_year.focus();
			 return false;
			}
			 if (document.works.end_year.value==""){
			 alert("-�����������ݣ�-");
			 document.works.end_year.focus();
			 return false;
			}
			if (document.works.end_year.value.match(/\D/)){
			 alert("-������ݱ����ǺϷ������֣�-");
			 document.works.end_year.focus();
			 return false;
			}

			
			 if (document.works.companyname.value==""){
			 alert("-��������ҵ���ƣ�-");
			 document.works.companyname.focus();
			 return false;
			}
			if (document.works.workname.value==""){
			 alert("-�����������ε�ְλ��-");
			 document.works.workname.focus();
			 return false;
			}
			if (document.works.workmemo.value==""){
			 alert("-�����빤��������-");
			 document.works.workmemo.focus();
			 return false;
			}
            
		   }
