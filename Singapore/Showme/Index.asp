<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim SQL,Rs,i,CompanyName,Comid
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- �Լ��˲�</title>
</head>
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

<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Header/Company_Showme.asp" --></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
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
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>�Լ�����</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <form action="../Showme/Shm_Search_Base.asp" method="post" target="_blank" name="theForm" onSubmit="return search_check()">
                      <tr> 
                        <td height="5" colspan="2" align="center"></td>
                      </tr>
                      <tr> 
                        <td width="55" height="27" align="right">ְ��λ��</td>
                        <td height="27" align="left"> 
                          <select style="width:115px;"  id=select8 
                  name=slt_category>
                          </select></td>
                      </tr>
                      <tr> 
                        <td width="55" height="27" align="right">&nbsp;</td>
                        <td height="27" align="left"> 
                          <select style="width:115px;"  id=select9 
                  name=slt_subcategory>
                          </select></td>
                      </tr>
                      <tr> 
                        <td width="55" height="27" align="right">�ء�����</td>
                        <td height="27" align="left"> 
                          <select  style="width:115px;" id=select10 
                  name=slt_workplacearea>
                          </select></td>
                      </tr>
                      <tr> 
                        <td width="55" height="27" align="right">&nbsp;</td>
                        <td height="27" align="left"> 
                          <select style="width:115px;" id=select11 
                  name=slt_workplacecity>
                          </select></td>
                      </tr>
                      <tr> 
                        <td width="55" height="27" align="right">�ա��ڣ� </td>
                        <td height="27" align="left"> 
                          <select style="width:115px;"  name=publishdate>
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
                        <td width="55" height="27" align="right">�ؼ��֣�</td>
                        <td height="27" align="left"> 
                          <input 
                  name=key style="width:115px;"  id=key2 size="16" maxlength=50 value="������ؼ���" onClick="this.value='';"></td>
                      </tr>
                     
                      <tr> 
                        <td height="27" colspan="2" align="center">
<input type="submit" name="Submit3" value=" �� ʼ �� �� "> 
                          <SCRIPT language=JavaScript>
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
  objJobCPSelector.addedOptions   = new Array("0-|ְλ���Ʋ���");
  objJobCPSelector.init();
  objJobCCSelector = new JobCategoryAssociateList(document.theForm.slt_subcategory, document.theForm.slt_category, null, CCLOptions);
  objJobCCSelector.incPValue = true;
  objJobCCSelector.incPValueFormat = "%PText%������"
  objJobCCSelector.addedOptions   = new Array("0-0|����");
  objJobCCSelector.init();  
                    </SCRIPT></td>
                      </tr>
                    </form>
                  </table></td>
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
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>�������</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;"><table width="90%"  border="0" align="center" cellpadding="2" cellspacing="0">
                    <%
	  
Set Rs1 = Conn.Execute("Select Top 6 LinkName,LinkUrl From [pH_FriendLink] Where State=1 And Class=0 And Cityid=0 Order By ordernum Asc")
  if not rs1.eof then
  do while not rs1.eof %>
                    <tr> 
                      <td height="15" align="left"> <a href="<%=rs1("LinkUrl")%>" target="_blank"><%=rs1("LinkName")%></a></td>
                    </tr>
                    <%rs1.movenext

loop
end if
rs1.close
%>
                  </table></td>
              </tr>
            </table></td>
          <td width="5">&nbsp;</td>
          <td> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <% 
		SQL = "Select Top 5 Adurl,ad_Width,ad_Height,AdFile,AdClass From [pH_Web_Ad] Where WebName=5 And ad_Width=760 And ad_Height=90 And DateDiff(d,BeginDate,GetDate())>=0 And DateDiff(d,EndDate,GetDate())<=0 And Cityid=0 Order By ad_Sort Asc"
		Set Rs_ads = Conn.Execute(SQL)
		While Not Rs_ads.Eof
		 If Rs_ads("AdClass") = 1 Then
		 %>
              <tr> 
                <td align="center"><a href="<%= "http://"&Rs_ads("AdUrl") %>" target="_blank"><img src="../Uploadfiles/AdFile/<%= Rs_ads("AdFile") %>" width="<%= Rs_ads("ad_Width") %>" height="<%= Rs_ads("ad_Height") %>" border="0"></a></td>
              </tr>
              <% Else %>
              <tr> 
                <td align="center"> <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="<%= Rs_ads("ad_Width") %>" height="<%= Rs_ads("ad_Height") %>">
                    <param name="movie" value="../Uploadfiles/AdFile/<%= Rs_ads("AdFile") %>">
                    <param name=quality value=high>
                    <embed src="../Uploadfiles/AdFile/<%= Rs_ads("AdFile") %>" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="435" height="75"></embed> 
                  </object></td>
              </tr>
              <% 
		 End if
		 Rs_ads.Movenext
		Wend
		Rs_ads.Close 
		 %>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="17"><img src="../Images/company/right1_left.jpg" width="17" height="24"></td>
                <td background="../Images/company/right1_bg.jpg"><strong><font color="#333333">�Լ��˲�</font></strong></td>
                <td width="11"><img src="../Images/company/right1_right.jpg" width="11" height="24"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">
                    <tr align="center"> 
                      <td width="15%" height="25" bgcolor="f3f3f3">����</td>
                      <td width="10%" height="24" bgcolor="f3f3f3">�Ա�</td>
                      <td width="12%" height="24" bgcolor="f3f3f3">ѧ��</td>
                      <td width="27%" height="24" bgcolor="f3f3f3">��ְĿ��</td>
                      <td height="24" bgcolor="f3f3f3">�Լ�����</td>
                    </tr>
                    <% 
SQL = "Select Top 10 I.Perid,I.RealName,I.Sex,I.Edus,I.ResumeMode,I.WorkWill1,B.Nc_Best_Ads From pH_Person_Base As B,pH_Person_Info As I  Where B.Perid=I.Perid And Len(I.RealName)>0 And I.ResumeKeep<>1 And B.Flag=1 And B.Nc_Best_Flag=1 And DateDiff(d,Nc_Best_Date,Getdate())>=0 And DateDiff(d,Nc_Best_EndDate,Getdate())<=0 Order By B.LastUpdate_Time Desc"
Set Rs = Conn.Execute(SQL)
For i = 1 to 10 
 If Rs.Eof Then Exit For
 Perid           = Rs(0)
 RealName        = Rs(1)
 Sex             = Rs(2)
 Edus            = Rs(3)
 ResumeMode      = Rs(4)
 WorkWillClass	 = Rs(5)
 Best_Ads		 = Left(Rs(6),12)
 If ResumeMode = null Then ResumeMode = 1
 If WorkWillClass <> "" Then 
  WorkWillClass = Left(WorkWillClass,10)
 Else
  WorkWillClass = "--"
 End if
 
 %>
                    <tr <% If i mod 2 = 0 Then %>bgcolor="#f9f9f9"<% End if %>> 
                      <td height="25" align="center"><a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a></td>
                      <td height="23" align="center"><%= Cls_Sex(Sex) %></td>
                      <td height="23" align="center"><%= Cls_Edus(Edus) %></td>
                      <td height="23"><a href="#" title="<%= Rs(5) %>"><%= WorkWillClass %></a></td>
                      <td height="23"><a href="#" title="<%= Rs(6) %>"><%= Best_Ads %></a></td>
                    </tr>
                    <% 
 Rs.Movenext
Next
Rs.Close
 %>
                  </table>
                  <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="right"><a href="../Showme/Shm_Search_New.asp" target="_blank">����</a>&gt;&gt;</td>
                    </tr>
                  </table>
                  
                </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="22" style="padding-left:2px;"><img src="../Images/Company/icon10.gif" width="5" height="16" align="absmiddle"> 
                  <strong><font color="#333333">�˲ŷ���</font></strong> </td>
              </tr>
              <tr> 
                <td height="2" bgcolor="#4273B2"></td>
              </tr>
            </table>
            <TABLE cellSpacing=0 cellPadding=2 width=100% align=center border=0>
              <TBODY>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=�����Ӳ��"  target="_blank">�����Ӳ��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=��������"  target="_blank">��������</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=������������Ӧ��"  target="_blank">������������Ӧ��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=IT-����"  target="_blank">IT-����</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26" bgcolor="#f5f5f5"><A 
      href="../Showme/Shm_Search_Class.asp?Param=IT-Ʒ��/����֧�ּ�����"  target="_blank">IT-Ʒ��/����֧��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=ͨ�ż���"  target="_blank">ͨ�ż���</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����/����/�뵼��/�����Ǳ�"  target="_blank">����/����/�����Ǳ�</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=���۹���"  target="_blank">���۹���</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=������Ա"  target="_blank">������Ա</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=��������������"  target="_blank">��������������</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=�ͷ�������֧��"  target="_blank">�ͷ�������֧��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����/���/˰��"  target="_blank">����/���/˰��</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=֤ȯ/����/Ͷ��"  target="_blank">֤ȯ/����/Ͷ��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����"  target="_blank">����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����"  target="_blank">����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����/Ӫ��" >����/Ӫ��</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����/��ȫ����"  target="_blank">����/��ȫ����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����/��е/��Դ"  target="_blank">����/��е/��Դ</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����"  target="_blank">����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=��װ/��֯/Ƥ��"  target="_blank">��װ/��֯/Ƥ��</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=�ɹ�"  target="_blank">�ɹ�</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=ó��"  target="_blank">ó��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����/�ִ�"  target="_blank">����/�ִ�</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����/����/��ҩ/ҽ����е"  target="_blank">����/����/ҽ����е</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=ҽԺ/ҽ��/����"  target="_blank">ҽԺ/ҽ��/����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=���"  target="_blank">���</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����/ý��"  target="_blank">����/ý��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=�г�/Ӫ��"  target="_blank">�г�/Ӫ��</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=4400"  target="_blank">Ӱ��/ý��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=4500"  target="_blank">����ý��/д��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=0900"  target="_blank">����/���</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=2100"  target="_blank">��������</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=���ز�"  target="_blank">���ز�</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=��ҵ����"  target="_blank">��ҵ����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=������Դ"  target="_blank">������Դ</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=�߼�����"  target="_blank">�߼�����</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����/����"  target="_blank">����/����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=��ѯ/����"  target="_blank">��ѯ/����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=��ʦ/����"  target="_blank">��ʦ/����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=��ʦ"  target="_blank">��ʦ</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=������Ա"  target="_blank">������Ա</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����/����"  target="_blank">����/����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=�Ƶ�/����"  target="_blank">�Ƶ�/����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����/����"  target="_blank">����/����</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=�ٻ�/����/���۷���"  target="_blank">�ٻ�/����/���۷���</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=��ͨ�������"  target="_blank">��ͨ�������</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����/����/��������"  target="_blank">����/����/��������</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����Ա"  target="_blank">����Ա</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=����"  target="_blank">����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=��Уѧ��"  target="_blank">��Уѧ��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=�����ɲ�/��ѵ��/ʵϰ��"  target="_blank">�����ɲ�/��ѵ��/ʵϰ��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Showme/Shm_Search_Class.asp?Param=��ְ"  target="_blank">��ְ</A></TD>
                </TR>
              </TBODY>
            </TABLE> </td>
        </tr>
      </table>
     
	  </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Include/Footer.asp" --></td>
  </tr>
</table>
</body>
</html>
<% 
Call CloseDB
 %>
