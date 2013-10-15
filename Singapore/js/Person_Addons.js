function edit_check(){
if (document.edit.computer.options[document.edit.computer.selectedIndex].value==0)
{
 alert("请选择你的计算机水平！");
 document.edit.computer.focus();
 return false;
}
if (document.edit.skill_key.value=="")
{ 
 alert("-请输入您所具备的技能关键字!-");
 document.edit.skill_key.focus();
 return false;
 }
if (document.edit.skill_memo.value=="")
{ 
 alert("-请输入您所具备的技能和专长!-");
 document.edit.skill_memo.focus();
 return false;
 }


}