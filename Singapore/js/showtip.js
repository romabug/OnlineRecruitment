// JavaScript Document

document.write("<div id=tip style='position:absolute; width:200px;  z-index:1;  background-color: #FEFAFA; border: 1px solid gray; overflow: visible;visibility: hidden;font-size:12px;padding:12px;color:#471717'></div>")

function showtip(w){
	var x=event.x;
	var y=event.y;
	tip.innerHTML=w;
	tip.style.visibility="visible";
	tip.style.left=x+10;
	  tip.style.pixelTop=y+document.body.scrollTop+10;

}

function hidetip(){
	tip.style.innerHTML=""
	tip.style.visibility="hidden";
	
}