function edit_check(){
if (document.edit.computer.options[document.edit.computer.selectedIndex].value==0)
{
 alert("��ѡ����ļ����ˮƽ��");
 document.edit.computer.focus();
 return false;
}
if (document.edit.skill_key.value=="")
{ 
 alert("-�����������߱��ļ��ܹؼ���!-");
 document.edit.skill_key.focus();
 return false;
 }
if (document.edit.skill_memo.value=="")
{ 
 alert("-�����������߱��ļ��ܺ�ר��!-");
 document.edit.skill_memo.focus();
 return false;
 }


}