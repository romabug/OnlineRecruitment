function getFileExtension(filePath) { //v1.0
  fileName = ((filePath.indexOf('/') > -1) ? filePath.substring(filePath.lastIndexOf('/')+1,filePath.length) : filePath.substring(filePath.lastIndexOf('\\')+1,filePath.length));
  return fileName.substring(fileName.lastIndexOf('.')+1,fileName.length);
}

function checkFileUpload(form,extensions) { //v1.0
  document.MM_returnValue = true;
  if (extensions && extensions != '') {
    for (var i = 0; i<form.elements.length; i++) {
      field = form.elements[i];
      if (field.type.toUpperCase() != 'FILE') continue;
      if (field.value == '') {
        alert('����ѡ��ͼƬ');
        document.MM_returnValue = false;field.focus();break;
      }
      if (extensions.toUpperCase().indexOf(getFileExtension(field.value).toUpperCase()) == -1) {
        alert('�����ļ����Ͳ������ϴ�!.\nֻ���������͵��ļ��ű������ϴ�: ' + extensions + '.\n��ѡ�����ļ��������ϴ�.');
        document.MM_returnValue = false;field.focus();break;
  } } }
}
function view()
{
document.preview.file1.value=document.form1.file1.value;
if(document.form1.file1.value==""){alert('����ѡ��ͼƬ');form1.file1.focus();return;}
//document.preview.email.value=document.theForm.e_mail.value;
var popupWin = window.open('', 'preview_page', '');
document.preview.submit()
}
function confirmdel(id){
       if (confirm("ȷ��Ҫɾ��������Ƭ?")) 
       window.location.href="uploadpic.asp?action=del&id="+id+""
}
function Mpic(f){
if (pic.style.display=="none"){
pic.style.display='';
f.checked=true;
}else{
pic.style.display='none';
f.checked=false;
}

}