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
	//把左边的多选框里选中的内容放入右边的多选框
	//formname为form的名字，selfrom为左边多选框的id,selto为右边多选框的id,maxnum为右边框最多可以加的项目数
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
	//首先检查个数是否超过要求
	if(!errflag){
		if(arrleftvalue.length+arrrightvalue.length>maxnum){
			errflag=true;
			window.alert("最多可以选择 "+maxnum+" 个选项！");
			return false;
		}
	}
	//选择不许重复
	if(!errflag){
		for(i=0;i<arrleftvalue.length;i++){
			for(j=0;j<arrrightvalue.length;j++){
				//window.alert(arrleftvalue[i]+" "+arrlefttext[i]+" "+arrrightvalue[j]+" "+arrrighttext[j]);
				
				if(arrleftvalue[i]==arrrightvalue[j]){
					errflag=true;
					window.alert("选择重复:"+arrrighttext[j]);
					return false;
				}
			}
		}
	}
	//如果选了第一个就不许选其他的
	if(!errflag){
		if(arrleftvalue.length+arrrightvalue.length>1){
			for (i=0;i<arrleftvalue.length;i++)
			{
				if(arrleftvalue[i]==objfrom.options[0].value){
					errflag=true;
					window.alert("选择了 "+objfrom.options[0].text+" 就不能够选其他选项！");
					return false;
				}
			}
			for (i=0;i<arrrightvalue.length;i++)
			{
				if(arrrightvalue[i]==objfrom.options[0].value){
					errflag=true;
					window.alert("选择了 "+objfrom.options[0].text+" 就不能够选其他选项！");
					return false;
				}
			}
			
		}
	}
	//将剩下的加入右边的多选框
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
	//将右边多选框选中的内容去掉，formname为多选框所在form的名字,selright为右边多选框的id
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