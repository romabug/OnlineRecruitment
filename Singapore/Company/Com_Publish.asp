<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim PhoneKeep,EmailKeep,PublishCount,Publish_Flag,EndDate

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//���ñ������ݵĺ���

'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Publish"
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
'//0��ҵ����1��ϵ��,2�绰,3�绰����,4����,5�ʼ�,6�ʼ�����,7��ַ,8��������,9����ְλ��,10��Ա�з�ͨ�����
'//�� Tmp(0,0) ��ʾ��ҵ����
'//�ر����ݿ����
Rs.Close
Set Cmd = Nothing
'//�жϻ�Ա��û��ͨ�����
Flag           = Tmp(10,0)
'If Flag = False Then
 'Response.redirect "../Public/Error.asp?param=2003"
 'Response.End()
'End if
'//�жϸ���ҵ��Ա�ܷ񷢲�ְλ
Set Re = Conn.Execute("Select Nc_Vip_Jobs From [pH_Company_Base] Where Comid='"&Comid&"'")
Jobs = Re(0)
Re.Close
If Jobs <= 0 Then
 Response.redirect "../Public/Error.asp?param=2001"
End if
'//���ܴ���
EndDate        = DateAdd("m",3,Date())
PhoneKeep      = Tmp(3,0)
EmailKeep      = Tmp(6,0)

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/Company_Publish.js"></script>
<SCRIPT language=JavaScript src="../js/funlib.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ua.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ftiens4.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/persontreeviewnodes.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/areacityselector.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/joball.js"></SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ����ְλ</title>
<style type="text/css">
<!--
.STYLE2 {color: #FF6600}
-->
</style>
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
            <!--#include file="../Lefter/Company_Job.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form action="?action=submit" name="theForm" method="post" onSubmit="return form_check();">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;����д������Ƹְλ����ϸ��Ϣ����־��<STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG>����Ϊ������Ŀ</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="18%" height="25" align="right">&nbsp;</td>
                              <td height="25">&nbsp;</td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ְλ���</td>
                              <td height="25" bgcolor="f9f9f9">&nbsp;</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="40%" height="20"><span class="STYLE2">ѡ����ϣ���㡰��ӡ���ť</span></td>
                                    <td width="15%">&nbsp;</td>
                                    <td width="45%"><FONT 
                              color=#333333>�Ѿ�ѡ���ְλ���</FONT></td>
                                  </tr>
                                  <tr> 
                                    <td><SELECT  id=select5  name=slt_category  style="width:180px">
                                      </SELECT> <br> <select  name=slt_subcategory size="1"  id=select6 style="width:180px">
                                      </select></td>
                                    <td><table width="98%" border="0" cellspacing="0" class="text01">
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit2" value="���&gt;&gt;" onClick="AddItemToList('slt_category','slt_subcategory','slt_selectedjobs',1, 1, '-')"></td>
                                        </tr>
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit3" value="&lt;&lt;�Ƴ�" onClick="DeleteListSelectedItem('slt_selectedjobs', 0)"></td>
                                        </tr>
                                      </table></td>
                                    <td><SELECT  multiple size=3 name=slt_selectedjobs style="width:200px">
                                      </SELECT></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ְλ���ƣ� </td>
                              <td height="25" bgcolor="f9f9f9"><input name="jobname" type="text" id="jobname" maxlength="40" style="width:180px">
                                <input name="jobtype" type="radio" value="1" checked>
ȫְ</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25"><input name="bestflag" type="checkbox" id="bestflag" value="1">
                                ��Ƹ��ְλ ( ��ҵ���û�м�ƸȨ�ޣ����޲������� )</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9">��Ƹ���ţ�</td>
                              <td height="25" bgcolor="f9f9f9"> <select name="deptid" id="deptid" style="width:100px">
                                  <option value="0">-��ѡ��-</option>
                                  <% 
						   SQL = "Select Ncid,DeptName From [pH_Company_Dept] Where Comid='"&Comid&"'"
						   Set Rs = Conn.Execute(SQL)
						   While Not Rs.Eof
						    Response.write "<option value="&Rs(0)&">"&Rs(1)&"</option>"
							Rs.Movenext
						   Wend
						   Rs.Close
						   %>
                                </select> <a href="Com_Dept.asp"><u>������ҵ����</u></a></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">��Ƹ������</td>
                              <td height="25"><input name="number" type="text" style="width:100px" value="0" maxlength="4">
                                �� ( Ĭ��Ϊ0,��ʾ������ )</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9">н�ʴ�����</td>
                              <td height="25" bgcolor="f9f9f9"><input name="deal" type="text" style="width:100px" value="0" maxlength="4">
                                Ԫ/�� ( Ĭ��Ϊ0,��ʾ�������� )</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ֹ���ڣ�</td>
                              <td height="25"><input name="end_year" type="text" size="4" maxlength="4" value="<%= Year(EndDate) %>">
                                �� 
                                <select name=end_month id="end_month">
                                  <%for i=1 to 12%>
                                  <option <%if i=Cint(Month(EndDate)) then%>selected<%end if%> value="<%=i%>"><%=i%></option>
                                  <%next%>
                                </select>
                                �� 
                                <select name=end_day id="end_day">
                                  <%for i=1 to 31%>
                                  <option <%if i=Day(EndDate) then%>selected<%end if%> value="<%=i%>"><%=i%></option>
                                  <%next%>
                                </select>
                                ��</td>
                            </tr>
                            <tr> 
                              <td height="24" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ����������</td>
                              <td height="24" bgcolor="f9f9f9">&nbsp;</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="40%"><span class="STYLE2">ѡ����ϣ���㡰��ӡ���ť</span></td>
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
                                          <td height="25" align="center"><input type="button" name="Submit22" value="���&gt;&gt;" onClick="AddItemToList('slt_workplacearea','slt_workplacecity','slt_selectedplaces',1, 2, '-')"></td>
                                        </tr>
                                        <tr> 
                                          <td height="25" align="center"><input type="button" name="Submit32" value="&lt;&lt;�Ƴ�" onClick="DeleteListSelectedItem('slt_selectedplaces', 0)"></td>
                                        </tr>
                                      </table></td>
                                    <td><SELECT  name=slt_selectedplaces size=3 multiple   id=select8 style="width:200px">
                                      </SELECT></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ����Ҫ��</td>
                              <td height="25" bgcolor="f9f9f9">�򵥲���ְλ����Ҫ��/���� ;</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25"><textarea name="require" cols="50" rows="6" ></textarea></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9">��ְҪ��</td>
                              <td height="25" bgcolor="f9f9f9">����дְλҪ��,�Ա���ְ�������趨��ѯ����ʱ����������������ҵ��ְλ 
                                ;</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">&nbsp;</td>
                              <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="80" height="25" align="right">ѧ 
                                      ����</td>
                                    <td height="25"> <select name="edus" id="edus" style="width:70px;">
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
                                      </select> </td>
                                  </tr>
                                  <tr> 
                                    <td width="80" height="25" align="right">�������ޣ�</td>
                                    <td height="25"> <select name="works" id="works" style="width:70px;">
                                        <option value="0">-����-</option>
                                        <option value="1">һ������</option>
                                        <option value="2">��������</option>
                                        <option value="3">��������</option>
                                        <option value="4">��������</option>
                                        <option value="5">��������</option>
                                        <option value="10">ʮ������</option>
                                        <option value="20">��ʮ������</option>
                                        <option value="30">��ʮ������</option>
                                        <option value="50">������Ա</option>
                                      </select>                                    </td>
                                  </tr>
                                  <tr> 
                                    <td width="80" height="25" align="right">�� 
                                      ��</td>
                                    <td height="25"><select name="sex" size="1"  style="width:70px;">
                                        <option selected value="2">-����-</option>
                                        <option value="1">��</option>
                                        <option value="0">Ů</option>
                                      </select></td>
                                  </tr>
                                  <tr> 
                                    <td width="80" height="25" align="right">�� 
                                      �䣺</td>
                                    <td height="25"> <select name="min_age" size="1" id="min_age"  style="width:70px;">
                                        <option selected value="0">-����-</option>
                                        <% 
								  For i=18 to 60
								   Response.write "<option value="&i&">"&i&"</option>"
								  Next 
								   %>
                                      </select>
                                      �� 
                                      <select name="max_age" size="1" id="max_age"  style="width:70px;">
                                        <option selected value="0">-����-</option>
                                        <% 
								  For i=18 to 60
								   Response.write "<option value="&i&">"&i&"</option>"
								  Next 
								   %>
                                      </select></td>
                                  </tr>
                                  <tr> 
                                    <td width="80" height="25" align="right">�����ڵأ�</td>
                                    <td height="25">
                                      <!--#include file="../Include/Class_Locus3.asp" -->                                    </td>
                                  </tr>
                                </table></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td height="2"></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" >
                            <tr>
                              <td height="46" >&nbsp;</td>
                            </tr>
                            <tr> 
                              <td height="25" bgcolor="f5f5f5"> 
                                <table width="100%" border="0">
                                  <tr>
                                    <td width="18%"></td>
                                    <td width="82%">��ϵ��ʽ</td>
                                  </tr>
                                </table></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="18%" height="25" align="right">��ϵ�ˣ�</td>
                              <td height="25"><input name="contactperson" type="text" size="30" maxlength="30" style="width:120px;" value="<%= Tmp(1,0) %>"> 
                                <font color="#50463d">��������ȷ��ϵ�ˣ��Է�����ְ�����˾��ϵ</font></td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9">��ϵ�绰��</td>
                              <td height="25" bgcolor="f9f9f9"><input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30" value="<%= Tmp(2,0) %>"> 
                                <font color="#50463d">( </font> <font color="#50463d">�̶��绰���룬�磺010-82615888 
                                ) </font></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">������룺</td>
                              <td height="25"><input name="companyfax" type="text" id="companyfax" style="width:120px;" size="30" maxlength="30" value="<%= Tmp(4,0) %>"></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9">&nbsp;</td>
                              <td height="25" bgcolor="f9f9f9"><input name="phonekeep" type="checkbox" value="1" <% If PhoneKeep = True Then Response.write "Checked" %>> 
                                <font color="#333333">���ε绰</font><font color="#50463d">( 
                                ѡ����������ְ��������ҵ��ϵ�绰 )</font></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">�����ʼ���</td>
                              <td height="25"> <input name="email" type="text" style="width:200px;"  value="<%= Tmp(5,0) %>" size="50"></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right" bgcolor="f9f9f9">&nbsp;</td>
                              <td height="25" bgcolor="f9f9f9"> <input name="emailkeep" type="checkbox" value="1" <% If EmailKeep = True Then Response.write "Checked" %>>
                                �������ʼ���ַ</td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">�������룺</td>
                              <td height="25"><input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;" value="<%= Tmp(8,0) %>"></td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="right">���Ե�ַ��</td>
                              <td height="25"> <input name="chat_addr" type="text" id="chat_addr" style="width:260px;" size="100"></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right">ͨѶ��ַ��</td>
                              <td height="25"><input name="address" type="text" size="100" style="width:260px;" value="<%= Tmp(7,0) %>">
                                �磺�����к������ɸ�·������ </td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
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
  </SCRIPT> <input type="submit" name="Submit" value=" ȷ �� �� �� " style="height:35px;"> 
                  </td>
                </tr>
              </form>
            </table></td>
        </tr>
      </table>

<!--#include file="../Include/Footer.asp" -->
	  </td>
  </tr>
</table>

</body>
</html>
<% 
Sub Submit() '������ҵ��������
 Check_Url() '//��վ�ύ���ݼ��
 Comid                  = Session("Company")(2)
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
 '//��ֹ����
 End_Date = End_Year&"-"&End_Month&"-"&End_Day
 
 SQL = "Insert Into [pH_Job_Base] (Comid,JobType,JobClass,JobName,Deal,Number,Work_Area,Work_City,Require,Chat_Addr,Edus,Sex,Works,LastUpdate_Time,ViewClicks,SendClicks,JobFlag,Area,City,Min_Age,Max_Age,TopAll,DeptId,BestFlag,End_Date,ContactPerson,Phone,CompanyFax,PhoneKeep,Email,EmailKeep,Address,ZipCode) Values ('"&Comid&"',"&JobType&",'"&JobClass&"','"&JobName&"',"&Deal&","&Number1&",'"&Work_Area&"','"&Work_City&"','"&Require&"','"&Chat_Addr&"',"&Edus&","&Sex&","&Works&",getdate(),0,0,1,'"&Area&"','"&City&"',"&Min_Age&","&Max_Age&",0,"&DeptId&","&BestFlag&",'"&End_Date&"','"&ContactPerson&"','"&Phone&"','"&CompanyFax&"',"&PhoneKeep&",'"&Email&"',"&EmailKeep&",'"&Address&"','"&ZipCode&"')"
 Conn.Execute(SQL)
 
 '//������ҵ����ְλ��
 SQL = "UpDate [pH_Company_Base] Set PublishCount=PublishCount+1,Nc_Vip_Jobs=Nc_Vip_Jobs-1 Where Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 '//ͬ��������ҵ����������ְλ����ϵ��ʽ
 If AllEdit = "1" Then
    SQL = "UpDate [pH_Job_Base] Set ContactPerson='"&ContactPerson&"',Phone='"&Phone&"',CompanyFax='"&CompanyFax&"',PhoneKeep="&PhoneKeep&",Email='"&Email&"',EmailKeep="&EmailKeep&",Address='"&Address&"',ZipCode='"&ZipCode&"',Chat_Addr='"&Chat_Addr&"' Where Comid='"&Comid&"'"
    Conn.Execute(SQL)
 End if
 '//�ر����ݿ�����
 CloseDB
 
 Response.redirect "Com_JobManage.asp"
End Sub

'//�ر����ݿ�����
CloseDB
 %>
