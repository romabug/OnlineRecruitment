//Modify By L.C.H
function newuser1_onsubmit(){

	  location_length=form1.elements['seljobplace[]'] .options.length;
	  for (i = 0;i<location_length ; i++) {
  	  if (form1.elements['seljobplace[]'] .options[i].text != "") {
    	  form1.elements['seljobplace[]'] .options[i].selected = true;
    	}
  	}
    document.form1.operate.value="updatePerson";
	document.form1.submit();
	
}

function lefttoright(formname,selfrom,seltto,maxnum){
	//����ߵĶ�ѡ����ѡ�е����ݷ����ұߵĶ�ѡ��
	//formnameΪform�����֣�selfromΪ��߶�ѡ���id,seltoΪ�ұ߶�ѡ���id,maxnumΪ�ұ߿������Լӵ���Ŀ��
	var lengthright,lengthleft,i,j;
	var objfrom=document.forms[formname].elements[selfrom];
	var objto=document.forms[formname].elements[seltto];
	lengthleft=objfrom.options.length;
	lengthright=objto.options.length;
	//window.alert(lengthright);
	var arrleftvalue=new Array();
	var arrlefttext=new Array();
	var arrrightvalue=new Array();
	var arrrighttext=new Array();
	var positon;
	for(i=0,j=0;i<lengthleft;i++){
		if(objfrom.options[i].selected){
			arrleftvalue[j]=objfrom.options[i].value;
			arrlefttext[j++]=objfrom.options[i].text;
			position=i;
			
		}
	}
	
	for(i=0,j=0;i<lengthright;i++){
		arrrightvalue[j]=objto.options[i].value;
		arrrighttext[j++]=objto.options[i].text;
	}
	var errflag=false;
	//���ȼ������Ƿ񳬹�Ҫ��
	if(!errflag){
		if(arrleftvalue.length+arrrightvalue.length>maxnum){
			errflag=true;
			window.alert("������ѡ�� "+maxnum+" ��ѡ�");
			return false;
		}
	}
	//ѡ�����ظ�
	if(!errflag){
		for(i=0;i<arrleftvalue.length;i++){
			for(j=0;j<arrrightvalue.length;j++){
				//window.alert(arrleftvalue[i]+" "+arrlefttext[i]+" "+arrrightvalue[j]+" "+arrrighttext[j]);
				
				if(arrleftvalue[i]==arrrightvalue[j]){
					errflag=true;
					window.alert("ѡ���ظ�:"+arrrighttext[j]);
					return false;
				}
			}
		}
	}
	//���ѡ�˵�һ���Ͳ���ѡ������
	if(!errflag){
		if(arrleftvalue.length+arrrightvalue.length>1){
			for (i=0;i<arrleftvalue.length;i++)
			{
				if(arrleftvalue[i]==objfrom.options[0].value){
					errflag=true;
					window.alert("ѡ���� "+objfrom.options[0].text+" �Ͳ��ܹ�ѡ����ѡ�");
					return false;
				}
			}
			for (i=0;i<arrrightvalue.length;i++)
			{
				if(arrrightvalue[i]==objfrom.options[0].value){
					errflag=true;
					window.alert("ѡ���� "+objfrom.options[0].text+" �Ͳ��ܹ�ѡ����ѡ�");
					return false;
				}
			}
			
		}
	}
	//��ʣ�µļ����ұߵĶ�ѡ��
	if(!errflag){
		j=objto.options.length;
		for (i=0;i<arrleftvalue.length;i++){
			//window.alert(arrlefttext[i]+" "+arrleftvalue[i]);
			objto.options[j++]=new Option(arrlefttext[i],arrleftvalue[i]);
		}
	       if(j>0)  	
		{
	         for(i=0;i<j-1;i++)
		       objto.options[i].selected=false;
	        	objto.options[j-1].selected=true;
         }
	}
	for(i=0;i<objfrom.options.length;i++)
	    objfrom.options[i].selected=false; 
	if(position<objfrom.options.length-1)
	   objfrom.options[position+1].selected=true;
	else objfrom.options[0].selected=true;
	
}

function righttoleft(formname,selright){
	//���ұ߶�ѡ��ѡ�е�����ȥ����formnameΪ��ѡ������form������,selrightΪ�ұ߶�ѡ���id
	var objright=document.forms[formname].elements[selright];
	var i=objright.length;
	var position;
	for(i--;i>=0;i--){
			if(objright[i].selected){
				objright[i]=null;
				position=i;
			}		
	}
	for(i=0;i<objright.length;i++)
	    objright[i].selected=false; 
	if(position>0)
	   objright[position-1].selected=true;
	
	
}

function selectall() {
  for (i = 0;i<form1.elements['seljobplace[]'].options.length ; i++) {
    if (form1.elements['seljobplace[]'].options[i].text != "") {
      form1.elements['seljobplace[]'].options[i].selected = true;   
    }
  }
  document.form1.submit()
  return true;  
}  