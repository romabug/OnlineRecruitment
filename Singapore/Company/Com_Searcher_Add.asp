<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,CompanyName

Action = Request.QueryString("action")
If Action = "add" Then Call Add_Submit() '����������

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
<title><%= Cls_WebName %> -- ��Ƹ���� -- ����������</title>
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
			<form action="?action=add" method="post" name="theForm" onSubmit="return theForm_check()">
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
                              <td height="25"><input name="name" type="text" id="name" size="25" maxlength="25" style="width:180px;"></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ְλ���</td>
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
                                    <td><SELECT  multiple size=3 name=slt_selectedjobs style="width:200px">
                                      </SELECT></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ����������</td>
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
                                    <td><SELECT  name=slt_selectedplaces size=3 multiple   id=select8 style="width:200px">
                                      </SELECT></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right" bgcolor="f9f9f9">�С���ҵ��</td>
                              <td height="25" bgcolor="f9f9f9"><select name="industry" id="industry" style="width:180px;">
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
                              <td width="20%" height="25" align="right">ѧ��������</td>
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
                              <td width="20%" height="25" align="right" bgcolor="f9f9f9">�������飺</td>
                              <td height="25" bgcolor="f9f9f9"><select name="works" id="works" style="width:70px;">
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
                              <td width="20%" height="25" align="right">�ԡ�����</td>
                              <td height="25"><select name="sex" size="1"  style="width:70px;">
                                  <option selected value="2">-����-</option>
                                  <option value="1">��</option>
                                  <option value="0">Ů</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="20%" height="25" align="right" bgcolor="f9f9f9">�ꡡ���䣺</td>
                              <td height="25" bgcolor="f9f9f9"><select name="min_age" size="1" id="min_age"  style="width:70px;">
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
                            <tr bgcolor="#FFFFFF"> 
                              <td height="25" align="right">�������ڣ�</td>
                              <td height="25"> <select style="width:180px;"  name=publishdate>
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
                              <td height="25" align="right" bgcolor="f9f9f9">�� 
                                �� �֣�</td>
                              <td height="25" bgcolor="f9f9f9"><input name="txtKey" type="text" id="txtKey" style="width:180px;"></td>
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
                <td height="40" align="center"><input type="submit" name="Submit" value="����������" style="height:30px;" >
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
Sub Add_Submit() '������ҵ��������
 Check_Url() '//��վ�ύ���ݼ��
 Username               = Session("Company")(0)
 Comid                  = Session("Company")(2)
 '//�����û����������Ƿ�ﵽ3��
 SQL = "Select Count(Ncid) From [pH_Company_Searcher] Where Comid='"&Comid&"'"
 Set Rs = Conn.Execute(SQL)
 If Rs(0) >= 3 Then
   Response.Write "<script>alert('�Բ������Ѿ�������3��������...');location.href='Com_Searcher.asp';</script>"
   Response.End()
 End if
 Rs.Close
 
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
 '//�����ݲ��뵽���ݿ�
 SQL = "Insert Into [pH_Company_Searcher]  (Comid,UserName,Searcher_Name,txtKey,PublishDate,AreaWill,Industry,Edus,Sex,MinAge,MaxAge,Works,WorkWillClass) Values ('"&Comid&"','"&Username&"','"&Searcher_Name&"','"&txtKey&"',"&PublishDate&",'"&AreaWill&"',"&Industry&","&Edus&","&Sex&","&MinAge&","&MaxAge&","&Works&",'"&WorkWillClass&"')"
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
