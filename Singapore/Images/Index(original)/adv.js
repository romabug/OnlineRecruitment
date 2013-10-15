document.writeln("<script language=\"JavaScript\">");
document.writeln("lastScrollY=0;");
document.writeln("function heartBeat(){ ");
document.writeln("diffY=document.body.scrollTop; ");
document.writeln("percent=.1*(diffY-lastScrollY); ");
document.writeln("if(percent>0)percent=Math.ceil(percent); ");
document.writeln("else percent=Math.floor(percent); ");
document.writeln("document.all.lovexin10.style.pixelTop+=percent;");
document.writeln("document.all.lovexin3.style.pixelTop+=percent;");
document.writeln("lastScrollY=lastScrollY+percent; ");
document.writeln("} ");
document.writeln("suspendcode10=\"<DIV id=lovexin10 style=\'left:10px;POSITION:absolute;TOP:60px;\'><a href=Public/Contact.asp><img src=Images_Index/adv.jpg border=0><\/a><\/div>\"");
document.writeln("document.write(suspendcode10); ");
document.writeln("suspendcode3=\"<DIV id=lovexin3 style=\'right:10px;POSITION:absolute;TOP:60px;\'><a href=Public/Contact.asp><img src=Images_Index/adv2.jpg border=0><\/a><\/div>\"");
document.writeln("document.write(suspendcode3); ");
document.writeln("window.setInterval(\"heartBeat()\",1); ");
document.writeln("<\/script>")

