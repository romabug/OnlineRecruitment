function IsDigit(cCheck)      
 {      
 return (('0'<=cCheck) && (cCheck<='9'));      
 } 
//*********************************************
function check()
{
if(document.form1.mytype.value=="")
  {
  alert("请选择类型！");
  document.form1.mytype.focus();
  return (false);
  }
if(document.form1.width.value=="")
  {
  alert("请输入宽度！");
  document.form1.width.focus();
  return (false);
  }
  width=document.form1.width.value;
  for (nIndex=0; nIndex<width.length; nIndex++)      
  {      
  cCheck = width.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("请填写数字！");      
   document.form1.width.focus();      
   return false;      
   }      
  }
if(document.form1.height.value=="")
  {
  alert("请输入高度！");
  document.form1.height.focus();
  return (false);
  }
  height=document.form1.height.value;
  for (nIndex=0; nIndex<height.length; nIndex++)      
  {      
  cCheck = height.charAt(nIndex);      
  if (!IsDigit(cCheck))     
   {      
   alert("请填写数字！");      
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
        alert('请先选择图片');
        document.MM_returnValue = false;field.focus();break;
      }
      if (extensions.toUpperCase().indexOf(getFileExtension(field.value).toUpperCase()) == -1) {
        alert('这种文件类型不允许上传!.\n只有以下类型的文件才被允许上传: ' + extensions + '.\n请选择别的文件并重新上传.');
        document.MM_returnValue = false;field.focus();break;
  } } }
}