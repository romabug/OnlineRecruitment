<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action,Param
Dim Ncid,CompanyName

Param  = Replace_Text(Request.QueryString("Param"))
Action = Request.QueryString("action")
If Action = "edit" Then Call Edit_Submit() '����������

'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Dept"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 Rs.Close
 Set Cmd = Nothing
 CloseDB
 Response.write "û���ҵ���Ա���ϣ�"
 Response.End()
End if

Tmp = Rs.GetRows() '//��������䵽����
'//0��ҵ����
'//�� Tmp(0,0) ��ʾ��ҵ����
'//�رռ�¼������
Rs.Close
Set Cmd = Nothing

'//���ܴ���
CompanyName  = Tmp(0,0)

'//������ҵ����������¼
SQL = "Select * From [pH_Company_Searcher] Where Comid='"&Comid&"' And Ncid="&Cstr(Param)
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then
 CloseRs
 CloseDB
 Response.write "û���ҵ������������ϣ�"
 Response.End()
End if
'//��������ֵ
 Searcher_Name   = Rs("Searcher_Name") '����������
 WorkWillClass   = Rs("WorkWillClass") '����ְλ���
 AreaWill        = Rs("AreaWill") '����������
 PublishDate     = Rs("PublishDate")
 Edus            = Rs("Edus")
 Works           = Rs("Works")
 Sex             = Rs("Sex")
 MinAge          = Rs("MinAge")
 MaxAge          = Rs("MaxAge")
 Industry		 = Rs("Industry")
 txtKey			 = Rs("txtKey")
 
 If WorkWillClass = "0-0" Then 
  WorkWillClass_Str = "ְλ�����"
 Else
  WorkWillClass_Str = WorkWillClass
 End if 
Rs.Close
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<SCRIPT language=JavaScript src="../js/Company_Searcher.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/funlib.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ua.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ftiens4.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/persontreeviewnodes.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/areacityselector.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/joball.js"></SCRIPT>


<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- �������༭</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_manage.asp" -->
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
        <tr> 
          <td width="175" valign="top">
            <!--#include file="../Lefter/Company_Search.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<form action="?action=edit" method="post" name="theForm" onSubmit="return theForm_check()">
              <tr> 
                <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                    <tr> 
                      <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="2"></td>
                          </tr>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                          <tr> 
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;������</font></b> 
                                [�������Խ�������ְλ������]</td>
                          </tr>
                        </table>
                          <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1">
                            <tr> 
                              <td width="20%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ���������ƣ�</td>
                              <td height="25"><input name="name" type="text" id="name" size="25" maxlength="25" style="width:180px;" value="<%= Searcher_Name %>"></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ����ְλ���</td>
                              <td height="25" bgcolor="f9f9f9"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="40%" height="20"><FONT 
                              color=#333333>ѡ��ְλ���</FONT></td>
                                    <td width="15%">&nbsp;</td>
                                    <td width="45%"><FONT 
                              color=#333333>�Ѿ�ѡ���ְλ���</FONT></td>
                                  </tr>
                                  <tr> 
                                    <td><select style="width:180px;"  id=select3 name=slt_category>
                                      </select> <select style="width:180px;"  id=select4 name=slt_subcategory>
                                      </select></td>
                                    <td><table width="98%" border="0" cellspacing="0" class="text01">
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit2" value="���&gt;&gt;" onclick="AddItemToList('slt_category','slt_subcategory','slt_selectedjobs',1, 1, '-')"></td>
                                        </tr>
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit3" value="&lt;&lt;�Ƴ�" onclick="DeleteListSelectedItem('slt_selectedjobs', 0)"></td>
                                        </tr>
                                      </table></td>
                                    <td> <SELECT  multiple size=3 name=slt_selectedjobs style="width:200px">
                                        <option value="<%= WorkWillClass %>" selected><%= WorkWillClass_Str %></option>
                                      </SELECT></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ������������</td>
                              <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="40%"><FONT 
                              color=#333333>ѡ�����ص�</FONT></td>
                                    <td width="15%">&nbsp;</td>
                                    <td width="45%"><FONT 
                              color=#333333>�Ѿ�ѡ��Ĺ����ص�</FONT></td>
                                  </tr>
                                  <tr> 
                                    <td><select style="width:180px"  name=slt_workplacearea>
                                      </select> <select name=slt_workplacecity size="1" style="width:180px">
                                      </select></td>
                                    <td><table width="98%" border="0" cellspacing="0" class="text01">
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit22" value="���&gt;&gt;" onclick="AddItemToList('slt_workplacearea','slt_workplacecity','slt_selectedplaces',1, 2, '-')"></td>
                                        </tr>
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit32" value="&lt;&lt;�Ƴ�" onclick="DeleteListSelectedItem('slt_selectedplaces', 0)"></td>
                                        </tr>
                                      </table></td>
                                    <td> <SELECT  name=slt_selectedplaces size=3 multiple   id=select8 style="width:200px">
                                        <option value="<%= AreaWill %>" selected><%= AreaWill %></option>
                                      </SELECT></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9">�С���ҵ��</td>
                              <td height="25" bgcolor="f9f9f9"><select name="industry" id="select" style="width:180px;">
                                  <option value="0" <% If Industry = 0 Then Response.write "Selected" %>>����</option>
                                  <option value="1" <% If Industry = 1 Then Response.write "Selected" %>>����������������</option>
                                  <option value="2" <% If Industry = 2 Then Response.write "Selected" %>>�����ҵ����������ݿ⡢ϵͳ���ɣ�</option>
                                  <option value="3" <% If Industry = 3 Then Response.write "Selected" %>>�����ҵ��Ӳ���������豸��</option>
                                  <option value="4" <% If Industry = 4 Then Response.write "Selected" %>>���ӡ�΢���Ӽ���</option>
                                  <option value="5" <% If Industry = 5 Then Response.write "Selected" %>>ͨѶ������ҵ</option>
                                  <option value="6" <% If Industry = 6 Then Response.write "Selected" %>>�ҵ�ҵ</option>
                                  <option value="7" <% If Industry = 7 Then Response.write "Selected" %>>��������(�ٻ������С�ר����)</option>
                                  <option value="8" <% If Industry = 8 Then Response.write "Selected" %>>ó�ס����񡢽�����</option>
                                  <option value="9" <% If Industry = 9 Then Response.write "Selected" %>>����</option>
                                  <option value="10" <% If Industry = 10 Then Response.write "Selected" %>>��������Դ�����ҵ</option>
                                  <option value="11" <% If Industry = 11 Then Response.write "Selected" %>>ʯ�͡�����ҵ</option>
                                  <option value="12" <% If Industry = 12 Then Response.write "Selected" %>>���﹤�̡���ҩ������</option>
                                  <option value="13" <% If Industry = 13 Then Response.write "Selected" %>>��е���졢�����豸���ع�ҵ</option>
                                  <option value="14" <% If Industry = 14 Then Response.write "Selected" %>>������Ħ�г�</option>
                                  <option value="15" <% If Industry = 15 Then Response.write "Selected" %>>�����Ǳ��繤�豸</option>
                                  <option value="16" <% If Industry = 16 Then Response.write "Selected" %>>��桢���ء����</option>
                                  <option value="17" <% If Industry = 17 Then Response.write "Selected" %>>ý�塢Ӱ�����������ų���</option>
                                  <option value="18" <% If Industry = 18 Then Response.write "Selected" %>>�������Ļ�����</option>
                                  <option value="19" <% If Industry = 19 Then Response.write "Selected" %>>��������Ʒ��ʳƷ�����ϡ����͡���ױƷ���̾ƣ�</option>
                                  <option value="20" <% If Industry = 20 Then Response.write "Selected" %>>��֯Ʒҵ�����Ρ�Ь�ࡢ�ҷ���Ʒ��Ƥ�ߣ�</option>
                                  <option value="21" <% If Industry = 21 Then Response.write "Selected" %>>��ѯҵ�����ʡ����ʦ�����ʦ�����ɣ�</option>
                                  <option value="22" <% If Industry = 22 Then Response.write "Selected" %>>����ҵ��Ͷ�ʡ����ա�֤ȯ�����С�����</option>
                                  <option value="23" <% If Industry = 23 Then Response.write "Selected" %>>���������ز�����ҵ����װ��</option>
                                  <option value="24" <% If Industry = 24 Then Response.write "Selected" %>>���������֡��Ƶ�</option>
                                  <option value="25" <% If Industry = 25 Then Response.write "Selected" %>>���䡢���������</option>
                                  <option value="26" <% If Industry = 26 Then Response.write "Selected" %>>����ҵ</option>
                                  <option value="27" <% If Industry = 27 Then Response.write "Selected" %>>�칫�豸���Ļ�����������Ʒ���Ҿ���Ʒ</option>
                                  <option value="28" <% If Industry = 28 Then Response.write "Selected" %>>ӡˢ����װ����ֽ</option>
                                  <option value="29" <% If Industry = 29 Then Response.write "Selected" %>>���������졢�ӹ�</option>
                                  <option value="30" <% If Industry = 30 Then Response.write "Selected" %>>��������ѵ������Ժ��</option>
                                  <option value="31" <% If Industry = 31 Then Response.write "Selected" %>>ҽ�ơ���������������</option>
                                  <option value="32" <% If Industry = 32 Then Response.write "Selected" %>>�˲Ž������н�</option>
                                  <option value="33" <% If Industry = 33 Then Response.write "Selected" %>>Э�ᡢ���š�����������ҵ����������</option>
                                  <option value="34" <% If Industry = 34 Then Response.write "Selected" %>>ũ���֡�����������ҵ</option>
                                  <option value="35" <% If Industry = 35 Then Response.write "Selected" %>>����</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right">ѧ ����</td>
                              <td height="25"> <select name="edus" id="edus" style="width:70px;">
                                  <option value="0" <% If Edus = 0 Then Response.write "Selected" %>>-����-</option>
                                  <option value="10" <% If Edus = 10 Then Response.write "Selected" %>>Сѧ</option>
                                  <option value="20" <% If Edus = 20 Then Response.write "Selected" %>>����</option>
                                  <option value="30" <% If Edus = 30 Then Response.write "Selected" %>>����</option>
                                  <option value="40" <% If Edus = 40 Then Response.write "Selected" %>>��ר</option>
                                  <option value="50" <% If Edus = 50 Then Response.write "Selected" %>>ר��</option>
                                  <option value="60" <% If Edus = 60 Then Response.write "Selected" %>>����</option>
                                  <option value="70" <% If Edus = 70 Then Response.write "Selected" %>>˶ʿ</option>
                                  <option value="80" <% If Edus = 80 Then Response.write "Selected" %>>��ʿ</option>
                                  <option value="90" <% If Edus = 90 Then Response.write "Selected" %>>��ʿ��</option>
                                </select> </td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right" bgcolor="f9f9f9">�������飺</td>
                              <td height="25" bgcolor="f9f9f9"><select name="works" id="works" style="width:70px;">
                                  <option value="0" <% If Works = 0 Then Response.write "Selected" %>>-����-</option>
                                  <option value="1" <% If Works = 1 Then Response.write "Selected" %>>һ������</option>
                                  <option value="2" <% If Works = 2 Then Response.write "Selected" %>>��������</option>
                                  <option value="3" <% If Works = 3 Then Response.write "Selected" %>>��������</option>
                                  <option value="4" <% If Works = 4 Then Response.write "Selected" %>>��������</option>
                                  <option value="5" <% If Works = 5 Then Response.write "Selected" %>>��������</option>
                                  <option value="10" <% If Works = 10 Then Response.write "Selected" %>>ʮ������</option>
                                  <option value="20" <% If Works = 20 Then Response.write "Selected" %>>��ʮ������</option>
                                  <option value="30" <% If Works = 30 Then Response.write "Selected" %>>��ʮ������</option>
                                  <option value="50" <% If Works = 50 Then Response.write "Selected" %>>������Ա</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right">�� ��</td>
                              <td height="25"><select name="sex" size="1"  style="width:70px;">
                                  <option value="2" <% If Sex = 2 Then Response.write "Selected" %>>-����-</option>
                                  <option value="1" <% If Sex = 1 Then Response.write "Selected" %>>��</option>
                                  <option value="0" <% If Sex = 0 Then Response.write "Selected" %>>Ů</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right" bgcolor="f9f9f9">�� 
                                �䣺</td>
                              <td height="25" bgcolor="f9f9f9"><select name="min_age" size="1" id="min_age"  style="width:70px;">
                                  <option selected value="0">-����-</option>
                                  <% 
								  For i=18 to 60%>
                                  <option value="<%=i%>" <% If i = MinAge Then Response.write "Selected" %>><%=i%></option>
                                  <%Next 
								   %>
                                </select>
                                �� 
                                <select name="max_age" size="1" id="max_age"  style="width:70px;">
                                  <option selected value="0">-����-</option>
                                  <% 
								  For i=18 to 60%>
                                  <option value="<%=i%>" <% If i = MaxAge Then Response.write "Selected" %>><%=i%></option>
                                  <% 
								  Next 
								   %>
                                </select></td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td height="25" align="right">�������ڣ�</td>
                              <td height="25"> <select style="width:180px;"  name=publishdate>
                                  <option value=0 <% If PublishDate = 0 Then Response.write "Selected" %>>�������ڲ���</option>
                                  <option value=1 <% If PublishDate = 1 Then Response.write "Selected" %>>��һ��</option>
                                  <option value=2 <% If PublishDate = 2 Then Response.write "Selected" %>>������</option>
                                  <option value=3 <% If PublishDate = 3 Then Response.write "Selected" %>>������</option>
                                  <option value=7 <% If PublishDate = 7 Then Response.write "Selected" %>>��һ��</option>
                                  <option value=14 <% If PublishDate = 14 Then Response.write "Selected" %>>������</option>
                                  <option value=30 <% If PublishDate = 30 Then Response.write "Selected" %>>��һ��</option>
                                  <option value=60 <% If PublishDate = 60 Then Response.write "Selected" %>>������</option>
                                  <option value=90 <% If PublishDate = 90 Then Response.write "Selected" %>>������</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9">�� 
                                �� �֣�</td>
                              <td height="25" bgcolor="f9f9f9"><input name="txtKey" type="text" id="txtKey" style="width:180px;" value=<%= txtKey %>></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="2"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="40" align="center"><input name="ncid" type="hidden" id="ncid" value="<%= Param %>">
                    <input type="submit" name="Submit" value="����������" style="height:30px;" >
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
  objJobCPSelector.addedOptions   = new Array("0-|ְλ�����");
  objJobCPSelector.init();
  objJobCCSelector = new JobCategoryAssociateList(document.theForm.slt_subcategory, document.theForm.slt_category, null, CCLOptions);
  objJobCCSelector.incPValue = true;
  objJobCCSelector.incPValueFormat = "%PText%������"
  objJobCCSelector.addedOptions   = new Array("0-0|����");
  objJobCCSelector.init();  
                    </SCRIPT> </td>
              </tr>
			  </form>
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
Sub Edit_Submit() '������ҵ����������
 Check_Url() '//��վ�ύ���ݼ��
 Username        = Session("Company")(0)
 Comid           = Session("Company")(2)
 
 Ncid            = Replace_Text(Request.Form("ncid")) 
 Searcher_Name   = Replace_Text(Request.Form("Name")) '����������
 WorkWillClass   = Replace_Text(Request.Form("slt_selectedjobs")) '����ְλ���
 AreaWill        = Replace_Text(Request.Form("slt_selectedplaces")) '����������
 PublishDate     = Replace_Text(Request.Form("PublishDate"))
 Edus            = Replace_Text(Request.Form("Edus"))
 Works           = Replace_Text(Request.Form("Works"))
 Sex             = Replace_Text(Request.Form("Sex"))
 MinAge          = Replace_Text(Request.Form("Min_Age"))
 MaxAge          = Replace_Text(Request.Form("Max_Age"))
 Industry		 = Replace_Text(Request.Form("Industry"))
 txtKey			 = Replace_Text(Request.Form("txtKey"))
 
 AreaWill        = Replace(AreaWill,"-","")
 
 '//�����ݱ��浽���ݿ�
 SQL = "Update [pH_Company_Searcher] Set Searcher_Name='"&Searcher_Name&"',PublishDate="&PublishDate&",AreaWill='"&AreaWill&"',Industry="&Industry&",txtKey='"&txtKey&"',Edus="&Edus&",Sex="&Sex&",MinAge="&MinAge&",MaxAge="&MaxAge&",Works="&Works&",WorkWillClass='"&WorkWillClass&"' Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid)
 Conn.Execute(SQL)
 
 '//����������ʱ��
 SQL = "Update [pH_Company_Base] Set LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 '//�ر����ݿ�����
 CloseDB
 
 Response.redirect "Com_Searcher.asp"
End Sub

'//�ر����ݿ�����
CloseDB
 %>
