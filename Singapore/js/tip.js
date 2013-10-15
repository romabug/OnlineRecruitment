/**
auther xurun
date 2006-8-16
*/

document.write("<div id='pup' style='position:absolute; border: 1px solid gray;z-index:10;color:#FFFFFF;line-height=16px;background: #FFFFE1; width:149px;overflow: visible;visibility: hidden;font-size:12px;padding:2px;text-align: left'></div>")

var displayObj = null;

var a=0;
function showpup(e,str){
	showpupCommon(null,e,str);
}
function showpupCommon(divWidth,e,str)
{	
	var disObj = null;
	if(displayObj==str)return;
	var left=-21,top=e.height+5;
	var x,y;
	while (e.offsetParent){
		left += e.offsetLeft;
		top  += e.offsetTop;
		e     = e.offsetParent;
	}

	left += e.offsetLeft;
	top  += e.offsetTop;
	x = left;
	y = top;
	if (document.layers){
		disObj = document.layers['pup'];
        disObj.left = x;
        disObj.top = y;
    }
    else if (document.all){
		disObj = document.all['pup'];
		disObj.style.left=x;
        disObj.style.top=y;
    }
    else if (document.getElementById){
        disObj = document.getElementById('pup');
		disObj.style.left=x+"px";
       	disObj.style.top=y+"px";
    }

	disObj.style.visibility="visible";
	if(divWidth!=null && divWidth!=""){
		disObj.style.width=divWidth+"px";
	}else{
		disObj.style.width="143px";
	}
	disObj.innerHTML=str;
	displayObj = str;
	a=0;
	checkBrowserForVersion4();
}

function showpupindex(imgObj,val){
	showpupCommon(264,imgObj,val);
}

function hidepup()
{
  pup.style.innerHTML=""
  pup.style.visibility="hidden";
  displayObj = null;
}


function  hidepupTip(){
	var div = document.all.pup;
	var div1 = document.all.searchInput;
	if(div.componentFromPoint(event.clientX,event.clientY)=="outside" && div1.componentFromPoint(event.clientX,event.clientY)=="outside")
	{
		div.style.visibility='hidden'
	}		
}

function checkBrowserForVersion4(){
	var	x=navigator.appVersion;
	y=x.substring(0,4);
	if(y>=4) Effect();
}

var	isNav=(navigator.appName.indexOf("Netscape")!=-1);
var	colors=new Array	("FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","F9F9F9","F1F1F1","E9E9E9","E1E1E1","D9D9D9","D1D1D1","C9C9C9","C1C1C1","B9B9B9","B1B1B1","A9A9A9","A1A1A1","999999","919191","898989","818181","797979","717171","696969","616161","595959","515151","494949","414141","393939","313131","292929","212121","191919","111111","090909","000000");

function Effect(){
	color=colors[a];
	pup.style.color = color;
	
	if(a<colors.length){
		a++;
		xx=setTimeout("Effect()",30);
	}
}