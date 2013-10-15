function close_float_left(){
myleft.style.visibility='hidden';
}
function close_float_right(){
myright.style.visibility='hidden';
}
 
//×ó±ß
var left_img='<table id=myleft><tr><td height=110></td></tr><tr><td align=left><a href="javascript:close_float_left();void(0);"class=closefloat><b><font color=#039800>¹Ø±Õ</font></b></a></td></tr><tr><td><a target=_blank href="http://www.macau69.cn/personadmin/h_reg_first.asp"><img src=../banner/lefthot.gif border=0></a></td></tr></table>';

//ÓÒ±ß
var right_img='<table id=myright><tr><td height=110></td></tr><tr><td align=right><a href="javascript:close_float_right();void(0);"class=closefloat><b><font color=#039800>¹Ø±Õ</font></b></a></td></tr><tr><td><a target=_blank href="http://news.qq.com/zt/2008/dizhen/"><img src=../banner/righthot.gif border=0></a></td></tr></table>';
	var delta=0.6
	var collection;
	function floaters() {
		this.items	= [];
		this.addItem	= function(id,x,y,content)
				  {
					document.write('<DIV id='+id+' style="Z-INDEX: 10; POSITION: absolute;  width:80px; height:60px;left:'+(typeof(x)=='string'?eval(x):x)+';top:'+(typeof(y)=='string'?eval(y):y)+'">'+content+'</DIV>');
					
					var newItem				= {};
					newItem.object			= document.getElementById(id);
					newItem.x				= x;
					newItem.y				= y;

					this.items[this.items.length]		= newItem;
				  }
		this.play	= function()
				  {
					collection				= this.items
					setInterval('play()',10);
				  }
		}
		function play()
		{

			for(var i=0;i<collection.length;i++)
			{
				var followObj		= collection[i].object;
				var followObj_x		= (typeof(collection[i].x)=='string'?eval(collection[i].x):collection[i].x);
				var followObj_y		= (typeof(collection[i].y)=='string'?eval(collection[i].y):collection[i].y);

				if(followObj.offsetLeft!=(document.documentElement.scrollLeft+followObj_x)) {
					var dx=(document.documentElement.scrollLeft+followObj_x-followObj.offsetLeft)*delta;
					dx=(dx>0?1:-1)*Math.ceil(Math.abs(dx));
					followObj.style.left=followObj.offsetLeft+dx;
					}

				if(followObj.offsetTop!=(document.documentElement.scrollTop+followObj_y)) {
					var dy=(document.documentElement.scrollTop+followObj_y-followObj.offsetTop)*delta;
					dy=(dy>0?1:-1)*Math.ceil(Math.abs(dy));
					followObj.style.top=followObj.offsetTop+dy;
					}
				followObj.style.display	= '';
			}
		}	
		
	var theFloaters		= new floaters();
	theFloaters.addItem('followDiv1','document.documentElement.clientWidth-97',10,''+right_img+'');
	theFloaters.addItem('followDiv2',0,10,''+left_img+'');
	theFloaters.play();