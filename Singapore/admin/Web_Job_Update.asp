<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Comid,PageNo

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"150") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//���ñ������ݵĺ���
Jobid = Replace_Text(Request.QueryString("Jobid"))
Comid = Replace_Text(Request.QueryString("Comid"))

'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_JobEdit"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Jobid",3,1,4)
Cmd.Parameters("@Jobid") = Jobid
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 Rs.Close
 Set Cmd = Nothing
 CloseDB
 Response.write "û���ҵ�ְλ��Ϣ��"
 Response.End()
End if

Tmp = Rs.GetRows() '//��������䵽����

'//0ְλ����,1���,2����,3����,4��Ƹ����,5��������ʡ,6��,7����Ҫ��,8���Ե�ַ,9�Ա�,10��������,11����ʱ��,12��ʾ����,13ӦƸ����,14ְλ״̬,15Ҫ����ְ�����ڵ�ʡ,16��,17��С����,18�������,19�̶�,20��ҵ����,21��Ƹ,22��ֹ����,23��ϵ��,24�绰,25����,26�绰����,27�ʼ�,28�ʼ�����,29��˾��ַ,30��������,31ѧ��
'//�� Tmp(0,0) ��ʾְλ����
'//�ر����ݿ����
Rs.Close
Set Cmd = Nothing

'//���ܴ���
JobType             = Tmp(0,0)
JobClass            = Tmp(1,0)
BestFlag            = Tmp(21,0)
DeptId              = Tmp(20,0)
Require             = Tmp(7,0)
Edus                = Tmp(31,0)
Works               = Tmp(10,0)
Sex                 = Tmp(9,0)
Min_Age             = Tmp(17,0)
Max_Age             = Tmp(18,0)
Locus_Area          = Tmp(15,0) '//Ҫ����ְ������ʡ��
Locus_City          = Tmp(16,0) '//Ҫ����ְ�����ڳ���
PhoneKeep           = Tmp(26,0)
EmailKeep           = Tmp(28,0) 

End_Year            = Year(Tmp(22,0))
End_Month           = Month(Tmp(22,0))
End_Day             = Day(Tmp(22,0))

If Require <> "" Then Require = Replace(Require,"<br>",Chr(13))
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/Company_Publish.js"></script>
<SCRIPT language=JavaScript src="../js/funlib.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ua.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ftiens4.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/persontreeviewnodes.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/areacityselector.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/joball.js"></SCRIPT>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>�༭ְλ</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="80%" border="0" cellspacing="0" cellpadding="0">
        <form action="?action=submit" name="theForm" method="post" onSubmit="return form_check();">
          <tr> 
            <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#f1b5a1">
                <tr> 
                  <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <TABLE cellSpacing=0 cellPadding=0 width=99% align=center 
            border=0>
                      <TBODY>
                        <TR> 
                          <TD class=font-14 height=3></TD>
                        </TR>
                        <TR> 
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>ְλ��Ϣ</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ְλ���ͣ�</td>
                        <td height="25"> <input name="jobtype" type="radio" value="1" <% If JobType = 1 Then Response.write "Checked" %>>
                          ȫְ 
                          <input type="radio" name="jobtype" value="2" <% If JobType = 2 Then Response.write "Checked" %>>
                          ��ְ 
						  <input type="radio" name="jobtype" value="3" <% If JobType = 3 Then Response.write "Checked" %>>
                          У԰��Ƹ 
						  </td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ְλ���</td>
                        <td height="25" bgcolor="#fff7f0">��ѡ�����ŵĴ��࣬��������ѡ����Ӧ�����࣬Ȼ�����<br>
                          �����Ҫɾ��ѡ�õĹ�����λ������ѡ�и��Ȼ���Ƴ�</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">&nbsp;</td>
                        <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="40%" height="20"><FONT 
                              color=#333333>ѡ��ְλ���</FONT></td>
                              <td width="15%">&nbsp;</td>
                              <td width="45%"><FONT 
                              color=#333333>�Ѿ�ѡ���ְλ���</FONT></td>
                            </tr>
                            <tr> 
                              <td><SELECT  id=select5  name=slt_category  style="width:180px">
                                </SELECT> <br> <select  name=slt_subcategory size="1"  id=select6 style="width:180px">
                                </select></td>
                              <td><table width="100%" border="0" cellspacing="0" class="text01">
                                  <tr> 
                                    <td height="25" align="center"><input type="button" name="Submit2" value="���&gt;&gt;" onclick="AddItemToList('slt_category','slt_subcategory','slt_selectedjobs',1, 1, '-')"></td>
                                  </tr>
                                  <tr> 
                                    <td height="25" align="center"><input type="button" name="Submit3" value="&lt;&lt;�Ƴ�" onclick="DeleteListSelectedItem('slt_selectedjobs', 0)"></td>
                                  </tr>
                                </table></td>
                              <td><SELECT  multiple size=3 name=slt_selectedjobs style="width:200px">
                                  <option value="<%= JobClass %>" selected><%= JobClass %></option>
                                </SELECT></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ְλ���ƣ�</td>
                        <td height="25" bgcolor="#fff7f0"><input name="jobname" type="text" id="jobname" maxlength="40" style="width:180px" value="<%= Tmp(2,0) %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">&nbsp;</td>
                        <td height="25"><input name="bestflag" type="checkbox" id="bestflag" value="1"  <% If BestFlag = True Then Response.write "Checked" %>>
                          ��Ƹ��ְλ ( ��ҵ���û�м�ƸȨ�ޣ����޲������� )</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0">��Ƹ���ţ�</td>
                        <td height="25" bgcolor="#fff7f0"> <select name="deptid" id="deptid" style="width:100px">
                            <option value="0">-��ѡ��-</option>
                            <% 
						   SQL = "Select Ncid,DeptName From [pH_Company_Dept] Where Comid='"&Comid&"'"
						   Set Rs = Conn.Execute(SQL)
						   While Not Rs.Eof
						   %>
                            <option value="<%= Rs(0) %>" <% If DeptId = Rs(0)  Then Response.write "Selected" %>><%= Rs(1) %></option>
                            <%
						    Rs.Movenext
						   Wend
						   Rs.Close
						   %>
                          </select> <a href="Com_Dept.asp"><u>������ҵ����</u></a></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��Ƹ������</td>
                        <td height="25"><input name="number" type="text" style="width:100px" maxlength="4"  value="<%= Tmp(4,0) %>">
                          �� ( Ĭ��Ϊ0,��ʾ������ )</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> н�ʴ�����</td>
                        <td height="25" bgcolor="#fff7f0"><input name="deal" type="text" style="width:100px" maxlength="4"  value="<%= Tmp(3,0) %>">
                          Ԫ/�� ( Ĭ��Ϊ0,��ʾ�������� )</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ֹ���ڣ�</td>
                        <td height="25"><input name="end_year" type="text" size="4" maxlength="4" value="<%= End_Year %>">
                          �� 
                          <select name=end_month id="end_month">
                            <%for i=1 to 12%>
                            <option <%if i=End_month then%>selected<%end if%> value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          �� 
                          <select name=end_day id="end_day">
                            <%for i=1 to 31%>
                            <option <%if i=End_day then%>selected<%end if%> value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          ��</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ����������</td>
                        <td height="25" bgcolor="#fff7f0">��ѡ�����ŵ�ʡ������������ѡ����Ӧ�ĳ��У�Ȼ�����<br>
                          �����Ҫɾ��ѡ�õĹ����ص㣬����ѡ�и��Ȼ���Ƴ�</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">&nbsp;</td>
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
                              <td><table width="100%" border="0" cellspacing="0" class="text01">
                                  <tr> 
                                    <td height="25" align="center"><input type="button" name="Submit22" value="���&gt;&gt;" onclick="AddItemToList('slt_workplacearea','slt_workplacecity','slt_selectedplaces',1, 2, '-')"></td>
                                  </tr>
                                  <tr> 
                                    <td height="25" align="center"><input type="button" name="Submit32" value="&lt;&lt;�Ƴ�" onclick="DeleteListSelectedItem('slt_selectedplaces', 0)"></td>
                                  </tr>
                                </table></td>
                              <td><SELECT  name=slt_selectedplaces size=3 multiple   id=select8 style="width:200px">
                                  <option value="<%= Tmp(5,0)&"-"&Tmp(6,0) %>" selected><%= Tmp(5,0)&Tmp(6,0) %></option>
                                </SELECT></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ����Ҫ��</td>
                        <td height="25" bgcolor="#fff7f0">�򵥲���ְλ����Ҫ��/���� ;</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">&nbsp;</td>
                        <td height="25"><textarea name="require" cols="50" rows="6" ><%= Require %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ְҪ��</td>
                        <td height="25" bgcolor="#fff7f0">����дְλҪ��,�Ա���ְ�������趨��ѯ����ʱ����������������ҵ��ְλ 
                          ;</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">&nbsp;</td>
                        <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="80" height="25" align="right">ѧ ����</td>
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
                              <td width="80" height="25" align="right">�������ޣ�</td>
                              <td height="25"> <select name="works" id="works" style="width:70px;">
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
                                </select> </td>
                            </tr>
                            <tr> 
                              <td width="80" height="25" align="right">�� ��</td>
                              <td height="25"><select name="sex" size="1"  style="width:70px;">
                                  <option value="2" <% If Sex = 2 Then Response.write "Selected" %>>-����-</option>
                                  <option value="1" <% If Sex = 1 Then Response.write "Selected" %>>��</option>
                                  <option value="0" <% If Sex = 0 Then Response.write "Selected" %>>Ů</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="80" height="25" align="right">�� �䣺</td>
                              <td height="25"> <select name="min_age" size="1" id="min_age"  style="width:70px;">
                                  <option value="0">-����-</option>
                                  <% 
								  For i=18 to 60
								  %>
                                  <option value="<%=i%>" <% If i=Tmp(17,0) Then %>selected<% End if %>><%= i %></option>
                                  <%
								  Next 
								   %>
                                </select>
                                �� 
                                <select name="max_age" size="1" id="max_age"  style="width:70px;">
                                  <option value="0">-����-</option>
                                  <% 
								  For i=18 to 60
								  %>
                                  <option value="<%=i%>" <% If i=Max_Age Then %>Selected<% End if %>><%= i %></option>
                                  <%
								  Next 
								   %>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="80" height="25" align="right">�����ڵأ�</td>
                              <td height="25"> 
                                <!--#include file="../Include/Class_Locus4.asp" -->
                              </td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <TABLE cellSpacing=0 cellPadding=0 width=99% align=center 
            border=0>
                      <TBODY>
                        <TR> 
                          <TD class=font-14 height=3></TD>
                        </TR>
                        <TR> 
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>��ϵ��ʽ</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ�ˣ�</td>
                        <td height="25"><input name="contactperson" type="text" size="30" maxlength="30" style="width:120px;" value="<%= Tmp(23,0) %>"> 
                          <font color="#50463d">��������ȷ��ϵ�ˣ��Է�����ְ�����˾��ϵ</font></td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ�绰��</td>
                        <td height="25" bgcolor="#fff7f0"><input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30" value="<%= Tmp(24,0) %>"> 
                          <font color="#50463d">( </font> <font color="#50463d">�̶��绰���룬�磺010-82615888 
                          ) </font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">������룺</td>
                        <td height="25"><input name="companyfax" type="text" id="companyfax" style="width:120px;" size="30" maxlength="30" value="<%= Tmp(25,0) %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0">&nbsp;</td>
                        <td height="25" bgcolor="#fff7f0"><input name="phonekeep" type="checkbox" value="1" <% If PhoneKeep = True Then Response.write "Checked" %>> 
                          <font color="#333333">���ε绰</font><font color="#50463d">( 
                          ѡ����������ְ��������ҵ��ϵ�绰 )</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �����ʼ���</td>
                        <td height="25"> <input name="email" type="text" style="width:200px;"  value="<%= Tmp(27,0) %>" size="50"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0">&nbsp;</td>
                        <td height="25" bgcolor="#fff7f0"> <input name="emailkeep" type="checkbox" value="1" <% If EmailKeep = True Then Response.write "Checked" %>>
                          �������ʼ���ַ</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> �������룺</td>
                        <td height="25"><input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;" value="<%= Trim(Tmp(30,0)) %>"></td>
                      </tr>
                      <tr bgcolor="#fff7f0"> 
                        <td height="25" align="right">���Ե�ַ��</td>
                        <td height="25"> <input name="chat_addr" type="text" id="chat_addr" style="width:260px;" size="100" value="<%= Tmp(8,0) %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ͨѶ��ַ��</td>
                        <td height="25"><input name="address" type="text" size="100" style="width:260px;" value="<%= Tmp(29,0) %>">
                          �磺�����к������ɸ�·������ </td>
                      </tr>
                      <tr bgcolor="#fff7f0"> 
                        <td height="25" align="right">&nbsp;</td>
                        <td height="25"> <input name="alledit" type="checkbox" id="alledit" value="1">
                          ����������Ƹ��Ϣ�е���ϵ��ʽ</td>
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
            <td height="40" align="center"><SCRIPT language=JavaScript>
  var objJobCPSelector, objJobCCSelector, objAreaSelector, objCitySelector

  objAreaSelector = new PlaceAssociateList(document.theForm.slt_workplacearea, null, document.theForm.slt_workplacecity, ALOptions);
  objAreaSelector.init();
  objCitySelector = new PlaceAssociateList(document.theForm.slt_workplacecity, document.theForm.slt_workplacearea, null, CLOptions);
  objCitySelector.incPValue = true;
  objCitySelector.incPValueFormat = "%PText%������"
  objCitySelector.init();

  
  objJobCPSelector = new JobCategoryAssociateList(document.theForm.slt_category, null, document.theForm.slt_subcategory, PCLOptions);
  objJobCPSelector.init();
  objJobCCSelector = new JobCategoryAssociateList(document.theForm.slt_subcategory, document.theForm.slt_category, null, CCLOptions);
  objJobCCSelector.incPValue = true;
  objJobCCSelector.incPValueFormat = "%PText%������"
  objJobCCSelector.init();
  </SCRIPT> <input type="submit" name="Submit" value=" ����ְλ��Ϣ  " style="height:35px;"> 
              <input name="jobid" type="hidden" id="jobid" value="<%= Jobid %>">
			  <input name="comid" type="hidden" id="comid" value="<%= Comid %>">
			   </td>
          </tr>
        </form>
      </table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Submit()
 'Check_Url() '//��վ�ύ���ݼ��
 Comid                  = Replace_Text(Request.Form("comid"))
 Jobid                  = Replace_Text(Request.Form("jobid"))
 JobType                = Replace_Text(Request.Form("JobType"))
 JobClass               = Replace_Text(Request.Form("slt_selectedjobs"))
 JobName                = Replace_Text(Request.Form("JobName"))
 Deal                   = Replace_Text(Request.Form("Deal"))
 Number1                = Replace_Text(Request.Form("Number"))
 Require                = Replace_Text(Request.Form("Require"))
 Chat_Addr              = Replace_Text(Request.Form("Chat_Addr"))
 Edus                   = Replace_Text(Request.Form("Edus"))
 Sex                    = Replace_Text(Request.Form("Sex"))
 Works                  = Replace_Text(Request.Form("Works"))
 Area                   = Replace_Text(Request.Form("x_Suozaidi"))
 City                   = Replace_Text(Request.Form("x_Suozaidi1"))
 Min_Age                = Replace_Text(Request.Form("Min_Age"))
 Max_Age                = Replace_Text(Request.Form("Max_Age"))
 DeptId                 = Replace_Text(Request.Form("DeptId"))
 BestFlag               = Replace_Text(Request.Form("BestFlag"))
 End_Year               = Replace_Text(Request.Form("End_Year"))
 End_Month              = Replace_Text(Request.Form("End_Month"))
 End_Day                = Replace_Text(Request.Form("End_Day"))
 ContactPerson          = Replace_Text(Request.Form("ContactPerson"))
 Phone                  = Replace_Text(Request.Form("Phone"))
 CompanyFax             = Replace_Text(Request.Form("CompanyFax"))
 PhoneKeep              = Replace_Text(Request.Form("PhoneKeep"))
 Email                  = Replace_Text(Request.Form("Email"))
 EmailKeep              = Replace_Text(Request.Form("EmailKeep"))
 Address                = Replace_Text(Request.Form("Address"))
 ZipCode                = Replace_Text(Request.Form("ZipCode"))
 AllEdit                = Replace_Text(Request.Form("AllEdit"))
 Work                   = Replace_Text(Request.Form("slt_selectedplaces")) '//��������
 Work         = Split(Work,"-")
 Work_Area    = Trim(Work(0))  
 Work_City    = Trim(Work(1))

 
 If BestFlag  = "" Then BestFlag  = 0
 If PhoneKeep = "" Then PhoneKeep = 0
 If EmailKeep = "" Then EmailKeep = 0
 If Require <> "" Then Require = Replace(Require,Chr(13),"<br>")
 '//��û�з�����Ƹְλ��Ȩ���Ǽ�Ƹ��������
 If Session("Nc_Vip") = 0 or Session("Nc_Vip") = 2 Then
  BestFlag = 0
 End if
 End_Date  = End_Year&"-"&End_Month&"-"&End_Day
 
 SQL = "Update [pH_Job_Base] Set JobType="&JobType&",JobClass='"&JobClass&"',JobName='"&JobName&"',Deal="&Deal&",Number="&Number1&",Work_Area='"&Work_Area&"',Work_City='"&Work_City&"',Require='"&Require&"',Chat_Addr='"&Chat_Addr&"',Edus="&Edus&",Sex="&Sex&",Works="&Works&",LastUpdate_Time=getdate(),Area='"&Area&"',City='"&City&"',Min_Age="&Min_Age&",Max_Age="&Max_Age&",DeptId="&DeptId&",BestFlag="&BestFlag&",End_Date='"&End_Date&"',ContactPerson='"&ContactPerson&"',Phone='"&Phone&"',CompanyFax='"&CompanyFax&"',PhoneKeep="&PhoneKeep&",Email='"&Email&"',EmailKeep="&EmailKeep&",Address='"&Address&"',ZipCode='"&ZipCode&"' Where Jobid="&Jobid&" And Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 
 '//ͬ��������ҵ����������ְλ����ϵ��ʽ
 If AllEdit = "1" Then
    SQL = "UpDate [pH_Job_Base] Set ContactPerson='"&ContactPerson&"',Phone='"&Phone&"',CompanyFax='"&CompanyFax&"',PhoneKeep="&PhoneKeep&",Email='"&Email&"',EmailKeep="&EmailKeep&",Address='"&Address&"',ZipCode='"&ZipCode&"',Chat_Addr='"&Chat_Addr&"' Where Comid='"&Comid&"'"
    Conn.Execute(SQL)
 End if

 '�������
 Response.write "<script language=JavaScript>alert('������ɣ�');location.href='Web_Job_All.asp';</script>"
 Response.End()
End Sub

 %>

