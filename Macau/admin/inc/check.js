function IsDigit(cCheck)      
 {      
 return (('0'<=cCheck) && (cCheck<='9'));      
 } 
//*********************************************
function check()
{
if(document.form1.mytype.value=="")
  {
  alert("��ѡ�����ͣ�");
  document.form1.mytype.focus();
  return (false);
  }
if(document.form1.width.value=="")
  {
  alert("�������ȣ�");
  document.form1.width.focus();
  return (false);
  }
  width=document.form1.width.value;
  for (nIndex=0; nIndex<width.length; nIndex++)      
  {      
  cCheck = width.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("����д���֣�");      
   document.form1.width.focus();      
   return false;      
   }      
  }
if(document.form1.height.value=="")
  {
  alert("������߶ȣ�");
  document.form1.height.focus();
  return (false);
  }
  height=document.form1.height.value;
  for (nIndex=0; nIndex<height.length; nIndex++)      
  {      
  cCheck = height.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("����д���֣�");      
   document.form1.height.focus();      
   return false;      
   }      
  }  
}
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