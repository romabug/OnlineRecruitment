function MD(d){
	//ȡ�����µ��������
	for(var i=31;i>=28;i--){
		var tempDate = new Date(d.getFullYear(),d.getMonth(),i)
		if(tempDate.getFullYear()==d.getFullYear()&&d.getMonth()==tempDate.getMonth())return i;
	}	
}
function WC(d,tobj){
//д��������
	var imgpath="http://127.0.0.1/nl/images/" //ͼƬ·��
	var seldaypath="selday.gif";
	var curdaypath="currentdate.gif";
	var mstr="һ��,����,����,����,����,����,����,����,����,ʮ��,ʮһ��,ʮ����";
	var ccd=new Date();//��������
	if(d==""||typeof(d)=="undefined")d=new Date();
	//������ͷ
	var ss="<table cellpadding=1 bgColor='#021853'><tr><td bgcolor='#ECF2FC'>";
	ss+="<table border=0 cellspacing=0 cellpadding=0 width='' bgColor='#ECF2FC'>";
	ss+="<tr height=22 bgColor='#0A246A'>";
	ss+="<td colspan=2>"
	//item1
	//Year List Mode
	ss+="<select style='heidth:20;width=70px'"
	ss+=" onChange=\"MC(this.value+'-"+(d.getMonth()+1)+"-"+d.getDate()+"','"+tobj+"')\">";
	var yy=parseInt(d.getFullYear());
	for(var j=(yy-50);j<=(yy+50);j++){
		ss+="<option value='"+j+"'";
		ss+=((j==yy)?" selected":"");
		ss+=">"+j+"��</option>";
	}
	ss+="</select>"
	/*
	//innerTable Begin
	//if you want year up and down mode ,please clear this desc flag.
	ss+="<table width=80 border=0 cellspacing=0 cellpadding=0>";
  	ss+="<tr>";
    ss+="<td rowspan=2><input name='yv' type='text' size='8' style='width:64px;height=20px'"
	ss+=" value='"+d.getFullYear()+"'></td>"
    ss+="<td width=16 valign='bottom'><img src='Images/yup.gif' width='16' height='9' onMouseDown=\""
	ss+="MC((parseInt(document.all.yv.value)-1)+'-'+"+(d.getMonth()+1)+"+'-'+"+d.getDate()+",'"+tobj+"')\"></td>";
	ss+="</tr>";
	ss+="<tr>";
    ss+="<td valign='top'><img src='Images/ydown.gif' width='16' height='9' onclick=\"";
	ss+="MC((parseInt(document.all.yv.value)+1)+'-'+"+(d.getMonth()+1)+"+'-'+"+d.getDate()+",'"+tobj+"')\"></td>";
	ss+="</tr>";
	ss+="</table>";
	//inner Table End
	*/
	ss+="</td>";
	ss+="<td colspan=2>";
	//item2
	//Month List
	ss+="<select style='height:20px;width:70px'"
	ss+=" onChange=\"MC('"+d.getFullYear()+"-'+this.value+'-"+d.getDate()+"','"+tobj+"')\">";
	var msa=mstr.split(",");
	for(var i=0;i<12;i++){
		ss+="<option value="+(i+1);
		ss+=(d.getMonth()==i)?" selected ":"";
		ss+=">"+msa[i]+"</option>";
	}
	ss+="</select>";
	//month list end
	ss+="</td>";
	ss+="<td colspan=3 onClick='CC()' style='cursor:hand' align='center'>"
	ss+="<font color='#ffffff' style=font-size=9pt></b>�ر���������</b></font></td></tr>";
	ss+="<tr>";
	ss+="<td align=center><font style='color:#0A246A;font-size:9pt'>������</font></td>";
	ss+="<td align=center><font style='color:#0A246A;font-size:9pt'>����һ</font></td>";
	ss+="<td align=center><font style='color:#0A246A;font-size:9pt'>���ڶ�</font></td>";
	ss+="<td align=center><font style='color:#0A246A;font-size:9pt'>������</font></td>";
	ss+="<td align=center><font style='color:#0A246A;font-size:9pt'>������</font></td>";
	ss+="<td align=center><font style='color:#0A246A;font-size:9pt'>������</font></td>";
	ss+="<td align=center><font style='color:#0A246A;font-size:9pt'>������</font></td>";
	ss+="</tr>";
	ss+="<tr><td colspan=7 bgColor='#0A246A'></td></tr>"
	var mbd = new Date(d.getFullYear(),d.getMonth(),1)//ָ�����ڵ�1��
	var bd=mbd.getDay();//�·ݿ�ʼ������
	maxdate = MD(d);//ָ�����ڵ��µ��������
	var cd=d.getDate();//��ǰ����
	var cr=((maxdate+bd)%7==0)?((maxdate+bd)/7):parseInt((maxdate+bd)/7+1)
	//д��������
	for(var i=0;i<cr;i++){
		ss+="<tr>";
		for(var j=0;j<7;j++){
			var tv=(i*7+j-bd+1);
			if((i==0&&j<bd)||tv>maxdate){ss+="<td>&nbsp;</td>"}else{
				ss+="<td align='center' valign='middle' style='cursor:hand;font-size:9pt;' ";
				if(cd==tv)ss+="background='"+imgpath+seldaypath+"'";
				ss+="onclick=RD("+tobj+",'"+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+tv+"')>";
				if(d.getFullYear()==ccd.getFullYear()&&d.getMonth()==ccd.getMonth()&&ccd.getDate()==tv){
					//��ǰ���ڵ���ʾ
					//ss+="<div style='position:absolute;width:39px;height:22px;z-index:100;background-image: url(Images/currentdate.gif)'>";
					ss+="<font color=red><b>"+tv+"</b></font>";
					//ss+="</div>";	
				}else{
					ss+=((cd==tv)?("<font color='green'><b>"+tv+"</b></font>"):tv);
				}
				ss+="</td>";
			}
		}
		ss+="</tr>";
	}
	//������
	ss+="<tr><td colspan=7 align='center'>&nbsp;<font style=font-size=9pt><b>����:"+ccd.getFullYear()+"-"+(ccd.getMonth()+1)+"-"+ccd.getDate()+"</b></font></td></tr>";
	ss+="</table>";
	ss+="</td></tr></table>"
	return ss;	
}
function SD(sobj,tobj){
	var tt = eval(tobj)
	var ds=tt.value;
	var d;
	if(ds==""){d=new Date()}else{var da=ds.split("-");var d=new Date(da[0],da[1]-1,da[2])}
	if(typeof(document.all.calendar)!="object"){		
			document.body.insertAdjacentHTML("afterBegin","<div id='calendar' style='position:absolute;width:280px;height:160px;display:none;z-index:99'></div>");
	}else{
		document.all.calendar.style.display="none";
	}
	//document.write(WC("",tobj))
	var ttop=sobj.offsetTop;
	if(sobj.clientHeight!="undefined")ttop+=sobj.clientHeight+5;
	var ttleft=sobj.offsetLeft;
	while(sobj=sobj.offsetParent){ttop+=sobj.offsetTop;ttleft+=sobj.offsetLeft;}
	if((ttleft+300)>screen.width)ttleft=screen.width-300;
	document.all.calendar.innerHTML=WC(d,tobj);
	document.all.calendar.style.left=ttleft;
	document.all.calendar.style.top=ttop;
	document.all.calendar.style.display="";
}
function RD(obj,d){
	obj.value = d;
	CC();
}
function CC(){
	document.all.calendar.style.display="none";
}
function MC(dstr,objstr){
	var da=dstr.split("-");var d=new Date(da[0],da[1]-1,da[2]);
	//alert(d.toString())
	document.all.calendar.innerHTML=WC(d,objstr);
}