//Designed By L.C.H
 //-----------------------------------------------------�ж�����Ϊ������֤
function IsDigit(cCheck)      
 {      
 return (('0'<=cCheck) && (cCheck<='9'));      
 } 
 //-----------------------------------------------------��д��ϸ����ʱ��֤
function Juge(theForm)
{
	
	   
  if (theForm.maincatelog.value == "0")
  {
    alert("��ѡ������ӦƸ��λ!");
    theForm.maincatelog.focus();
    return (false);
  }
  if (theForm.jobname.value == "")
  {
    alert("��������Ƹְλ����!");
    theForm.jobname.focus();
    return (false);
  }
  neednum=theForm.neednum.value;
  if (neednum == "")
  {
    alert("��������Ƹ����!");
    theForm.neednum.focus();
    return (false);
  }
    for (nIndex=0; nIndex<neednum.length; nIndex++)      
  {      
  cCheck = neednum.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("��Ƹ������д���֣�");      
   theForm.neednum.focus();      
   return false;      
   }      
  }
  
  if (theForm.jobcity.value == "")
  {
    alert("�����빤������!");
    theForm.jobcity.focus();
    return (false);
  }
  
  Salary=theForm.Salary.value;
  if (Salary == "")
  {
    alert("��������н!");
    theForm.Salary.focus();
    return (false);
  }
    for (nIndex=0; nIndex<Salary.length; nIndex++)      
  {      
  cCheck = Salary.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("��н��д���֣�");      
   theForm.Salary.focus();      
   return false;      
   } 
   
      var  Juget=true;
      for(var j=0;j<theForm.fangfa.length;j++){

 if (theForm.fangfa[j].checked) {
		 Juget=false;
		break;
        }	
       }
          if (Juget){
          alert("��ѡȡ��ϵ��ʽ��");
          theForm.fangfa[1].focus();
          return (false);
       }
	   
     if (theForm.zpyear.value == "")
  {
    alert("��ѡ����Ч�ڼ���!");
    theForm.zpyear.focus();
    return (false);
  }
  
     if (theForm.zpmonth.value == "")
  {
    alert("��ѡ����Ч�ڼ���!");
    theForm.zpmonth.focus();
    return (false);
  }
     if (theForm.zpday.value == "")
  {
    alert("��ѡ����Ч�ڼ���!");
    theForm.zpday.focus();
    return (false);
  }
    if (theForm.demand.value == "")
  {
    alert("���������Ҫ��!");
    theForm.demand.focus();
    return (false);
  }

  

  }
}
 //-----------------------------------------------------ѡ���λ
g_jobs=new Array(25);
g_jobs[1] =  new Array(  "�߼���ʦ","������","����","���","��๤","����Ա","���/����","����ʦ","������Ա");

g_jobs[2] =  new Array(  "���","����","����","�곤","ӪҵԱ","����������Ա");

g_jobs[3] =  new Array(  "����Ա","����Ա","�ʷ�","����","����","����Ա","����Ա","����","�豸ά��","����/����","������Ա");

g_jobs[4] =  new Array(  "˾��","�ʵ���Ա","����","��ʦ","�ճ���Ա","������Ա","����Ա","����","��Ա","������Ա","������Ա");

g_jobs[5] =  new Array(  "�������Ա","����ά��","����Ա","���ݿ����","��Ŀ����","��վ�༭","��ҳ���/����","������Ա","��ý�����","������Ա","������Ա");

g_jobs[6] =  new Array(  "������","ƽ�����","�����ư�","Ӱ�����","��Ӱʦ","�İ��߻�","��ý�����","������Ա","������Ա");

g_jobs[7] =  new Array(  "ˮ�ܹ�","�繤","ȼ����","�յ���","���ݹ�","������Ա","�ۺϼ���","������Ա");

g_jobs[8] =  new Array(   "����ά��","��������","ϴ��","������װ","��������","������Ա","������Ա");

g_jobs[9] =  new Array(  "����/�纸��","���Ṥ","��������","ˮ�繤","��ů/����","װ�����","װ�޹�","������Ա");

g_jobs[10] =  new Array(  "��ͥ��ķ","������Ա","��๤","Ӷ��","�߼���ķ","����","������Ա");

g_jobs[11] =  new Array(  "�������","�߼���ʦ","һ����ʦ","����/����ʦ","�㰴/����Ա","��ױʦ","������Ա","�����˲�","������Ա");

g_jobs[12] =  new Array(  "�赸","����","ʱװ/���ģ��","����ʦ","��������","����Ա","��ѵԱ","�����˲�","������Ա","������Ա");

g_jobs[13] =  new Array(  "�߻���Ա","��Ŀ����","��չ�﹤","��չ���","��չ����","������Ա");

g_jobs[14] =  new Array(  "���¹�","����Ա","��������","�豸ά��","�ֿ����","����/����Ա","������Ա");

g_jobs[15] =  new Array(  "����","����ά��","��ʩά��","��������","������Ա","������Ա");

g_jobs[16] =  new Array(  "��ó/ó�׾���","��ó/ó��רԱ","��óQC","�ɹ�רԱ/����","����Ա","��֤רԱ","�ֹ�","������Ա");

g_jobs[17] =  new Array(  "ͬ������/Ӣ��","Ӣ��","�Ϲ���","��������","����","����","����","��������","����","����","�ͻ�˹̹��","��������");

g_jobs[18] =  new Array(  "֤ȯ/�����˲�","����/����ʦ","��ƹ���","���չ���","���տ���","������Ա","������Ա");

g_jobs[19] =  new Array(  "��ѧ��ʦ","��ѧ��ʦ","Сѧ/�׶���ʦ","�ҽ�","���Խ�ʦ","������ʦ","�赸��ʦ","�滭��ʦ","������Ա");

g_jobs[20] =  new Array(  "��/��ҽʦ","��ʿ/����Ա","ҩ��ʦ","����ҽʦ","����ʦ","��ҽ/����ҽ��","��������","������Ա");

g_jobs[21] =  new Array(  "�����н�","ְҵ������","���ɹ���","������ѯ","������Ա");

g_jobs[22] =  new Array(  "����Ա","�칫��Ա","��������","������Ա","����ά��Ա","������Ա");

g_jobs[23] =  new Array(  "Ʒ�ƾ���","�г��ܼ�","�����ܼ�","�����ܼ�","������Դ�ܼ�","�����ܼ�","ְҵ/�߼�������","�߼�����","������Ա");

g_jobs[24] =  new Array(  "�߼��豸ά�޹�","��¯��","ǯ��","�纸��","��е��","������������");


function selectjob(selPro, selCity) {
	p = parseInt(selPro.value);
	if(p <= 0 || p > 24) return;
	for(i = selCity.length - 1; i >= 0; i--) {
		selCity.options[i] = null;
	}
	for(i = 0; i < g_jobs[p].length; i++) {
		selCity.options[selCity.length] = new Option(g_jobs[p][i], g_jobs[p][i]);
	}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}