<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,CompanyName


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

<SCRIPT language=JavaScript src="../js/funlib.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ua.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ftiens4.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/persontreeviewnodes.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/areacityselector.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/joball.js"></SCRIPT>


<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ����</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_manage.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" bgcolor="#FFFFFF">
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="175" valign="top">
            <!--#include file="../Lefter/Company_Part.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form action="../Part/Com_Search_Base.asp" method="post" target="_blank" name="theForm">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��ѯ��ְ�˲�&nbsp;</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
                            <tr> 
                              <td width="18%" height="27" align="right" bgcolor="f9f9f9">�������</td>
                              <td height="27" bgcolor="f9f9f9"><select name="typeid" id="select2">
                                  <option value="0">����</option>
                                  <option value="1">�ҽ�</option>
                                  <option value="2">����������Ʒ������</option>
                                  <option value="3">ҵ��ֱ��������</option>
                                  <option value="4">У��</option>
                                  <option value="5">����</option>
                                  <option value="6">��Ա��¼��</option>
                                  <option value="7">��������</option>
                                  <option value="8">�������㻤</option>
                                  <option value="9">��˾���ڡ�����</option>
                                  <option value="10">����</option>
                                  <option value="11">���̡�����������</option>
                                  <option value="12">��ҳ����</option>
                                  <option value="13">�������</option>
                                  <option value="14">�߻����İ�</option>
                                  <option value="15">׫�塢�ɱ�</option>
                                  <option value="16">�ƻᡢ����</option>
                                  <option value="99">����</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right">����������</td>
                              <td height="25"><select  style="width:140px;" id=select3 
                  name=slt_workplacearea>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9">&nbsp;</td>
                              <td height="25" bgcolor="f9f9f9"><select style="width:140px;" id=select4 
                  name=slt_workplacecity>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right">�������ڣ�</td>
                              <td height="25"><select style="width:140px;"  name=publishdate>
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
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9">�ؼ��֣�</td>
                              <td height="25" bgcolor="f9f9f9"><input 
                  name=key style="width:140px;"  id=key size="16" maxlength=50 onClick="this.value='';"> 
                              </td>
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
                  <td height="40" align="center"><input type="submit" name="Submit" value="��ʼ����" style="height:30px;" > 
                    <SCRIPT language=JavaScript>
  var objJobCPSelector, objJobCCSelector, objAreaSelector, objCitySelector

  objAreaSelector = new PlaceAssociateList(document.theForm.slt_workplacearea, null, document.theForm.slt_workplacecity, ALOptions);
  objAreaSelector.addedOptions   = new Array("����-|����ʡ�ݲ���");
  objAreaSelector.init();
  objCitySelector = new PlaceAssociateList(document.theForm.slt_workplacecity, document.theForm.slt_workplacearea, null, CLOptions);
  objCitySelector.incPValue = true;
  objCitySelector.incPValueFormat = "%PText%������"
  objCitySelector.addedOptions   = new Array("����-����|�������в���");
  objCitySelector.init();
 
                    </SCRIPT> </td>
                </tr>
              </form>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td align="center"> 
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
