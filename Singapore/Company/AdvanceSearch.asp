<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style>
.c101 
{
	background-color:#255DA6;
	color: #ffffff;
} 
.c102 
{
	background-color:#efefef;
}
</style>
<SCRIPT language=JavaScript src="../js/funlib.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ua.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ftiens4.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/persontreeviewnodes.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/areacityselector.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/joball.js"></SCRIPT>
<script language="JavaScript">
 function login_check()
 {

 if (document.login.username.value==""){
  alert("-�������û���-");
  document.login.username.focus();
  return false;
 }
  if (document.login.password.value==""){
  alert("-�������½����-");
  document.login.password.focus();
  return false;
 }
 }
 function search_check(){
 if (document.theForm.key.value=="������ؼ���"){
  alert("-������ؼ���-");
  document.theForm.key.focus();
  return false;
 }
 }
</script>
<script language="JavaScript">
function csecBoard(n) 
{ 
    for(i=1;i<5;i++) 
    { 
        eval("document.getElementById('cl0"+i+"').className='c102'"); 
        eval("cbx0"+i+".style.display='none'"); 
    } 
    eval("document.getElementById('cl0"+n+"').className='c101'"); 
    eval("cbx0"+n+".style.display='block'"); 
} 
</script>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> - �������� - �߼�����</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_Search.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr valign="top"> 
          <td width="180" bgcolor="#FFFFFF"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25" align="left" valign="bottom" background="../Images/company/left10_bg.jpg" style="padding-left:10px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>��Ա��¼</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;">
                  <!--#include file="../Public/Com_MemberSession.asp" -->
                </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25" align="left" valign="bottom" background="../Images/company/left10_bg.jpg" style="padding-left:10px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>HR��Ѷ</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><table width="98%" border="0" align="center" cellpadding="0" cellspacing="1">
                          <tr align="center"> 
                            <td width="25%" height="23" class="c101" id="cl01" onMouseOver="csecBoard(1);"><strong>����</strong></td>
                            <td width="25%" height="23" class="c102" id="cl02" onMouseOver="csecBoard(2);"><strong>ҵ��</strong></td>
                            <td width="25%" height="23" class="c102" id="cl03" onMouseOver="csecBoard(3);"><strong>н��</strong></td>
                            <td width="25%" height="23" class="c102" id="cl04" onMouseOver="csecBoard(4);"><strong>����</strong></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td> <div style="display:" id="cbx01"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% 
SQL = "Select Top 8 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=14) And Flag=1 Order By DateAndTime Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof					
%>
                            <tr> 
                              <td height="24">&middot;<a href="../<%= Rs("Path") %>/<%= Rs("FileName") %>" target="_blank"><font color="<%= Rs("t_Color") %>"><%= Left(Rs("Title"),13) %></font></a></td>
                            </tr>
                            <% 
 Rs.Movenext
Wend
Rs.Close
 %>
                          </table>
                        </div>
                        <div style="display:none;" id="cbx02"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% 
SQL = "Select Top 8 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=15) And Flag=1 Order By DateAndTime Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof					
%>
                            <tr> 
                              <td height="24">&middot;<a href="../<%= Rs("Path") %>/<%= Rs("FileName") %>" target="_blank"><font color="<%= Rs("t_Color") %>"><%= Left(Rs("Title"),13) %></font></a></td>
                            </tr>
                            <% 
 Rs.Movenext
Wend
Rs.Close
 %>
                          </table>
                        </div>
                        <div style="display:none;" id="cbx03"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% 
SQL = "Select Top 8 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=16) And Flag=1 Order By DateAndTime Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof					
%>
                            <tr> 
                              <td height="24">&middot;<a href="../<%= Rs("Path") %>/<%= Rs("FileName") %>" target="_blank"><font color="<%= Rs("t_Color") %>"><%= Left(Rs("Title"),13) %></font></a></td>
                            </tr>
                            <% 
 Rs.Movenext
Wend
Rs.Close
 %>
                          </table>
                        </div>
                        <div style="display:none;" id="cbx04"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <% 
SQL = "Select Top 8 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=17) And Flag=1 Order By DateAndTime Desc"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof					
%>
                            <tr> 
                              <td height="24">&middot;<a href="../<%= Rs("Path") %>/<%= Rs("FileName") %>" target="_blank"><font color="<%= Rs("t_Color") %>"><%= Left(Rs("Title"),13) %></font></a></td>
                            </tr>
                            <% 
 Rs.Movenext
Wend
Rs.Close
 %>
                          </table>
                        </div></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            
          </td>
          <td width="5">&nbsp;</td>
          <td> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="22" style="padding-left:2px;"><img src="../Images/Company/icon10.gif" width="5" height="16" align="absmiddle"> 
                  <strong><font color="#333333">�߼�����</font></strong> </td>
              </tr>
              <tr> 
                <td height="2" bgcolor="#4273B2"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="4">
            <form action="Com_Search_AdvanceSearch.asp" method="post" name="theForm" target="_blank">
			  <tr>
                  <td width="15%">ְ�����ƣ�</td>
                <td><select style="width:180px;"  id=select10 name=slt_category>
                    </select></td>
              </tr>
              <tr>
                <td width="15%">&nbsp;</td>
                <td><select style="width:180px;"  id=select11 name=slt_subcategory>
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">����������</td>
                <td><select style="width:180px"  name=slt_workplacearea>
                    </select></td>
              </tr>
              <tr>
                <td width="15%">&nbsp;</td>
                <td><select name=slt_workplacecity size="1" style="width:180px">
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">�С���ҵ��</td>
                <td><select name="industry" id="industry" style="width:180px;">
                      <option value="0">����</option>
                      <option value="1">����������������</option>
                      <option value="2">�����ҵ����������ݿ⡢ϵͳ���ɣ�</option>
                      <option value="3">�����ҵ��Ӳ���������豸��</option>
                      <option value="4">���ӡ�΢���Ӽ���</option>
                      <option value="5">ͨѶ������ҵ</option>
                      <option value="6">�ҵ�ҵ</option>
                      <option value="7">��������(�ٻ������С�ר����)</option>
                      <option value="8">ó�ס����񡢽�����</option>
                      <option value="9">����</option>
                      <option value="10">��������Դ�����ҵ</option>
                      <option value="11">ʯ�͡�����ҵ</option>
                      <option value="12">���﹤�̡���ҩ������</option>
                      <option value="13">��е���졢�����豸���ع�ҵ</option>
                      <option value="14">������Ħ�г�</option>
                      <option value="15">�����Ǳ��繤�豸</option>
                      <option value="16">��桢���ء����</option>
                      <option value="17">ý�塢Ӱ�����������ų���</option>
                      <option value="18">�������Ļ�����</option>
                      <option value="19">��������Ʒ��ʳƷ�����ϡ����͡���ױƷ���̾ƣ�</option>
                      <option value="20">��֯Ʒҵ�����Ρ�Ь�ࡢ�ҷ���Ʒ��Ƥ�ߣ�</option>
                      <option value="21">��ѯҵ�����ʡ����ʦ�����ʦ�����ɣ�</option>
                      <option value="22">����ҵ��Ͷ�ʡ����ա�֤ȯ�����С�����</option>
                      <option value="23">���������ز�����ҵ����װ��</option>
                      <option value="24">���������֡��Ƶ�</option>
                      <option value="25">���䡢���������</option>
                      <option value="26">����ҵ</option>
                      <option value="27">�칫�豸���Ļ�����������Ʒ���Ҿ���Ʒ</option>
                      <option value="28">ӡˢ����װ����ֽ</option>
                      <option value="29">���������졢�ӹ�</option>
                      <option value="30">��������ѵ������Ժ��</option>
                      <option value="31">ҽ�ơ���������������</option>
                      <option value="32">�˲Ž������н�</option>
                      <option value="33">Э�ᡢ���š�����������ҵ����������</option>
                      <option value="34">ũ���֡�����������ҵ</option>
                      <option value="35">����</option>
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">�ԡ�����</td>
                <td><select name="sex" size="1"  style="width:70px;">
                      <option selected value="2">-����-</option>
                      <option value="1">��</option>
                      <option value="0">Ů</option>
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">�ꡡ���䣺</td>
                <td><select name="min_age" size="1" id="select12"  style="width:70px;">
                      <option selected value="0">-����-</option>
                      <% 
								  For i=18 to 60
								   Response.write "<option value="&i&">"&i&"</option>"
								  Next 
								   %>
                    </select>
                    �� 
                    <select name="max_age" size="1" id="select13"  style="width:70px;">
                      <option selected value="0">-����-</option>
                      <% 
								  For i=18 to 60
								   Response.write "<option value="&i&">"&i&"</option>"
								  Next 
								   %>
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">ѧ��������</td>
                <td><select name="edus" id="select15" style="width:70px;">
                      <option value="0" selected>-����-</option>
                      <option value="10">Сѧ</option>
                      <option value="20">����</option>
                      <option value="30">����</option>
                      <option value="40">��ר</option>
                      <option value="50">ר��</option>
                      <option value="60">����</option>
                      <option value="70">˶ʿ</option>
                      <option value="80">��ʿ</option>
                      <option value="90">��ʿ��</option>
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">�������ޣ�</td>
                <td><select name="works" id="select14" style="width:70px;">
                      <option value="0" selected>-����-</option>
                      <option value="1">һ������</option>
                      <option value="2">��������</option>
                      <option value="3">��������</option>
                      <option value="4">��������</option>
                      <option value="5">��������</option>
                      <option value="10">ʮ������</option>
                      <option value="20">��ʮ������</option>
                      <option value="30">��ʮ������</option>
                      <option value="50">������Ա</option>
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">�������ڣ�</td>
                <td><select style="width:180px;"  name=publishdate>
                      <option value=0>����</option>
                      <option value=1>��һ��</option>
                      <option value=2>������</option>
                      <option value=3>������</option>
                      <option value=7>��һ��</option>
                      <option value=14>������</option>
                      <option value=30>��һ��</option>
                      <option value=60>������</option>
                      <option value=90>������</option>
                    </select></td>
              </tr>
              <tr>
                  <td width="15%">�� �� �֣�</td>
                <td><input name="key" type="text" id="key" style="width:180px;"></td>
              </tr>
              <tr>
                <td width="15%"><SCRIPT language=JavaScript>
  var objJobCPSelector, objJobCCSelector, objAreaSelector, objCitySelector

  objAreaSelector = new PlaceAssociateList(document.theForm.slt_workplacearea, null, document.theForm.slt_workplacecity, ALOptions);
  objAreaSelector.addedOptions   = new Array("����-|������������");
  objAreaSelector.init();
  objCitySelector = new PlaceAssociateList(document.theForm.slt_workplacecity, document.theForm.slt_workplacearea, null, CLOptions);
  objCitySelector.incPValue = true;
  objCitySelector.incPValueFormat = "%PText%������"
  objCitySelector.addedOptions   = new Array("����-����|����");
  objCitySelector.init();
  
  objJobCPSelector = new JobCategoryAssociateList(document.theForm.slt_category, null, document.theForm.slt_subcategory, PCLOptions);
  objJobCPSelector.addedOptions   = new Array("0-|ְ�����Ʋ���");
  objJobCPSelector.init();
  objJobCCSelector = new JobCategoryAssociateList(document.theForm.slt_subcategory, document.theForm.slt_category, null, CCLOptions);
  objJobCCSelector.incPValue = true;
  objJobCCSelector.incPValueFormat = "%PText%������"
  objJobCCSelector.addedOptions   = new Array("0-0|����");
  objJobCCSelector.init();  
                    </SCRIPT></td>
                <td><input type="submit" name="Submit" value=" ��ʼ���� "  ></td>
              </tr></form>
            </table>
            
          </td>
        </tr>
      </table>
      <!--#include file="../Include/Footer.asp" -->
	  </td>
  </tr>
</table>

</body>
</html>
<% 
'//�ر����ݿ�����
CloseDB
 %>
