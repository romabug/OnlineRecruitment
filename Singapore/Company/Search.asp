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
<title><%= Cls_WebName %> - ��������</title>
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
    <td><!--#include file="../Header/Company_Search.asp" --></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="5"></td>
        </tr>
      </table> 
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr valign="top"> 
          <td width="180" bgcolor="#FFFFFF"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;"><!--#include file="../Public/Com_MemberSession.asp" --></td>
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
                      <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>�Լ��˲�</strong></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td style="BORDER-RIGHT: #4273B2 1px solid; BORDER-LEFT: #4273B2 1px solid;BORDER-bottom: #4273B2 1px solid;padding-top:2px;padding-bottom:2px;padding-left:5px;"> 
                  <div id=demo style=overflow:hidden;height:176> 
                    <div id=demo1> 
                      <TABLE width=100% border="0" align=center cellPadding=0 cellSpacing=0 id=news>
                        <% 
SQL = "Select Top 30 I.Perid,I.RealName,I.Sex,I.Edus,I.WorkWill1 From pH_Person_Base As B,pH_Person_Info As I  Where B.Perid=I.Perid And Len(I.RealName)>0 And I.ResumeKeep<>1 And B.Flag=1 And B.Nc_Best_Flag=1 And DateDiff(d,Nc_Best_Date,Getdate())>=0 And DateDiff(d,Nc_Best_EndDate,Getdate())<=0 Order By B.LastUpdate_Time Desc"
				  Set Rs = Conn.Execute(SQL)
				  While Not Rs.Eof
				   Perid           = Rs(0)
				   RealName        = Rs(1)
				   WorkWill1       = "--"
				   If Rs(4) <> "" Then WorkWill1 = Left(Rs(4),8)
				   %>
                        <TR> 
                          <TD width="60" height=22 vAlign=center><A  href="../Company/Com_Resume.asp?Param=<%= Perid %>" target=_blank><%= RealName %></A></TD>
                          <TD vAlign=center><font color="#333333"><%= WorkWill1 %></font></TD>
                        </TR>
                        <% 
				    Rs.Movenext
				   Wend
				   Rs.Close	
				    %>
                      </TABLE>
                    </div>
                    <div id=demo2></div>
                  </div>
                  <script>
<!--
  var speed		= 15;//�����ٶ�
  var rows		= 22;//ÿ�и߶�
  var stim		= 80; //ͣ��ʱ�䱶�� * speed
  var stop		= 0; //��ʼ��ֵ������
  demo2.innerHTML	= demo1.innerHTML
  function Marquee(){
    if(demo.scrollTop%rows==0 && stop<=stim){
      stop++;
      return;
    }
    stop = 0;
    if(demo2.offsetTop-demo.scrollTop<=0)
      demo.scrollTop-=demo1.offsetHeight
    else{
      demo.scrollTop++
    }
  }
  var MyMar	   = setInterval(Marquee,speed)
  demo.onmouseover = function() {clearInterval(MyMar)}
  demo.onmouseout  = function() {MyMar=setInterval(Marquee,speed)}
-->
</script> </td>
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
SQL = "Select Top 6 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=14) And Flag=1 Order By DateAndTime Desc"
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
SQL = "Select Top 6 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=15) And Flag=1 Order By DateAndTime Desc"
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
SQL = "Select Top 6 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=16) And Flag=1 Order By DateAndTime Desc"
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
SQL = "Select Top 6 Title,FileName,Path,t_Color From [pH_New_Info] Where Title <>'' And (Typeid=17) And Flag=1 Order By DateAndTime Desc"
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
            </table>
            
          </td>
          <td width="5">&nbsp;</td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="5" bgcolor="#255DA7"></td>
                      <td height="26" background="../Images/Index/right10_bg.jpg" style="padding-left:7px;padding-top:2px;"><strong><font color="#333333">��������</font></strong></td>
                      <td width="3"><img src="../Images/Index/right10_right.jpg" width="3" height="26"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td valign="top" style="BORDER-RIGHT: #d3d3d3 1px solid; BORDER-LEFT: #d3d3d3 1px solid;BORDER-bottom: #d3d3d3 1px solid;padding-top:3px;"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="2">
                    <form action="../Company/Com_Search_Base.asp" method="post" target="_blank" name="theForm" onSubmit="return search_check()">
					<tr>
                        <td width="60" align="center">ְ���ܣ�</td>
                        <td width="205"> 
                          <select style="width:200px;"  id=select 
                  name=slt_category>
                          </select></td>
                        <td width="60" align="center">ְ��λ��</td>
                        <td>
<select style="width:200px;"  id=select4 
                  name=slt_subcategory>
                          </select></td>
                    </tr>
                    <tr>
                        <td width="60" align="center">ʡ���ݣ�</td>
                        <td width="205"> 
                          <select  style="width:200px;" id=select5 
                  name=slt_workplacearea>
                          </select></td>
                        <td width="60" align="center">�ء�����</td>
                        <td>
<select style="width:200px;" id=select6 
                  name=slt_workplacecity>
                          </select></td>
                    </tr>
                    <tr>
                        <td width="60" align="center">�С�ҵ��</td>
                        <td width="205"> 
                          <select name="industry" id="industry" style="width:200px;">
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
                        <td width="60" align="center">�ա��ڣ�</td>
                        <td>
<select style="width:200px;"  name=publishdate>
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
                        <td width="60" align="center">�ؼ��֣�</td>
                        <td width="205"> 
                          <input 
                  name=key style="width:200px;"  id=txt_keyword2 size="16" maxlength=50 value="������ؼ���" onClick="this.value='';"></td>
                        <td width="60" align="center">
<SCRIPT language=JavaScript>
  var objJobCPSelector, objJobCCSelector, objAreaSelector, objCitySelector

  objAreaSelector = new PlaceAssociateList(document.theForm.slt_workplacearea, null, document.theForm.slt_workplacecity, ALOptions);
  objAreaSelector.addedOptions   = new Array("����-|ʡ�ݲ���");
  objAreaSelector.init();
  objCitySelector = new PlaceAssociateList(document.theForm.slt_workplacecity, document.theForm.slt_workplacearea, null, CLOptions);
  objCitySelector.incPValue = true;
  objCitySelector.incPValueFormat = "%PText%������"
  objCitySelector.addedOptions   = new Array("����-����|��������");
  objCitySelector.init();
  
  objJobCPSelector = new JobCategoryAssociateList(document.theForm.slt_category, null, document.theForm.slt_subcategory, PCLOptions);
  objJobCPSelector.addedOptions   = new Array("0-|ְ�ܲ���");
  objJobCPSelector.init();
  objJobCCSelector = new JobCategoryAssociateList(document.theForm.slt_subcategory, document.theForm.slt_category, null, CCLOptions);
  objJobCCSelector.incPValue = true;
  objJobCCSelector.incPValueFormat = "%PText%������"
  objJobCCSelector.addedOptions   = new Array("0-0|ְλ����");
  objJobCCSelector.init();  
                    </SCRIPT></td>
                        <td> <input name="imageField2" type="image" src="../Images/Company/Search10_t.gif" width="100" height="22" border="0" align="absbottom"> &gt;&gt; <a href="AdvanceSearch.asp"><u>�߼�����</u></a></td>
                    </tr></form>
                  </table> </td>
              </tr>
            </table> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="22" style="padding-left:2px;"><img src="../Images/Company/icon10.gif" width="5" height="16" align="absmiddle"> 
                  <strong><font color="#333333">ְ������</font></strong> <a name="a"></a></td>
              </tr>
              <tr> 
                <td height="2" bgcolor="#4273B2"></td>
              </tr>
            </table>
            <TABLE cellSpacing=0 cellPadding=2 width=100% align=center border=0>
              <TBODY>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=�����Ӳ��"  target="_blank">�����Ӳ��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=��������"  target="_blank">��������</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=������������Ӧ��"  target="_blank">������������Ӧ��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=IT-����"  target="_blank">IT-����</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_JobClass.asp?Param=IT-Ʒ��/����֧�ּ�����"  target="_blank">IT-Ʒ��/����֧��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=ͨ�ż���"  target="_blank">ͨ�ż���</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����/����/�뵼��/�����Ǳ�"  target="_blank">����/����/�����Ǳ�</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=���۹���"  target="_blank">���۹���</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=������Ա"  target="_blank">������Ա</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=��������������"  target="_blank">��������������</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=�ͷ�������֧��"  target="_blank">�ͷ�������֧��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����/���/˰��"  target="_blank">����/���/˰��</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=֤ȯ/����/Ͷ��"  target="_blank">֤ȯ/����/Ͷ��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����"  target="_blank">����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����"  target="_blank">����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����/Ӫ��" >����/Ӫ��</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����/��ȫ����"  target="_blank">����/��ȫ����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����/��е/��Դ"  target="_blank">����/��е/��Դ</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����"  target="_blank">����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=��װ/��֯/Ƥ��"  target="_blank">��װ/��֯/Ƥ��</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=�ɹ�"  target="_blank">�ɹ�</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=ó��"  target="_blank">ó��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����/�ִ�"  target="_blank">����/�ִ�</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����/����/��ҩ/ҽ����е"  target="_blank">����/����/ҽ����е</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=ҽԺ/ҽ��/����"  target="_blank">ҽԺ/ҽ��/����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=���"  target="_blank">���</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����/ý��"  target="_blank">����/ý��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=�г�/Ӫ��"  target="_blank">�г�/Ӫ��</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=4400"  target="_blank">Ӱ��/ý��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=4500"  target="_blank">����ý��/д��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=0900"  target="_blank">����/���</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=2100"  target="_blank">��������</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=���ز�"  target="_blank">���ز�</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=��ҵ����"  target="_blank">��ҵ����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=������Դ"  target="_blank">������Դ</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=�߼�����"  target="_blank">�߼�����</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����/����"  target="_blank">����/����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=��ѯ/����"  target="_blank">��ѯ/����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=��ʦ/����"  target="_blank">��ʦ/����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=��ʦ"  target="_blank">��ʦ</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=������Ա"  target="_blank">������Ա</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����/����"  target="_blank">����/����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=�Ƶ�/����"  target="_blank">�Ƶ�/����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����/����"  target="_blank">����/����</A></TD>
                </TR>
                <TR bgColor=#f5f5f5> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=�ٻ�/����/���۷���"  target="_blank">�ٻ�/����/���۷���</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=��ͨ�������"  target="_blank">��ͨ�������</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����/����/��������"  target="_blank">����/����/��������</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����Ա"  target="_blank">����Ա</A></TD>
                </TR>
                <TR> 
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=����"  target="_blank">����</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=��Уѧ��"  target="_blank">��Уѧ��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=�����ɲ�/��ѵ��/ʵϰ��"  target="_blank">�����ɲ�/��ѵ��/ʵϰ��</A></TD>
                  <TD width="25%" height="26"><A 
      href="../Company/Com_Search_JobClass.asp?Param=��ְ"  target="_blank">��ְ</A></TD>
                </TR>
              </TBODY>
            </TABLE>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="22"><img src="../Images/Company/icon10.gif" width="5" height="16" align="absmiddle"> 
                  <strong><font color="#333333">��ҵ����</font></strong> <a name="b"></a></td>
              </tr>
              <tr> 
                <td height="2" bgcolor="#4273B2"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><TABLE cellSpacing=0 cellPadding=2 width=100% align=center border=0>
                    <TBODY>
                      <TR> 
                        <TD width="25%" height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=1"  target="_blank">������/��������</A></TD>
                        <TD width="25%" height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=2"  target="_blank">�����ҵ(���)</A></TD>
                        <TD width="25%" height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=3"  target="_blank">�����ҵ(Ӳ��)</A></TD>
                        <TD width="25%" height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=4"  target="_blank">����/΢���Ӽ���</A></TD>
                      </TR>
                      <TR> 
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=5"  target="_blank">ͨѶ/����ҵ</A></TD>
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=6"  target="_blank">�ҵ�ҵ</A></TD>
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=7"  target="_blank">��������(�ٻ�/����)</A></TD>
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=8"  target="_blank">ó��/����/������</A></TD>
                      </TR>
                      <TR> 
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=9"  target="_blank">����</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=10"  target="_blank">����/��Դ/���ҵ</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=11"  target="_blank">ʯ��/����ҵ</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=12"  target="_blank">���﹤��/��ҩ/����</A></TD>
                      </TR>
                      <TR> 
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=13"  target="_blank">��е����/�����豸</A></TD>
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=14"  target="_blank">����/Ħ�г�</A></TD>
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=15"  target="_blank">�����Ǳ�/�繤�豸</A></TD>
                        <TD height="26" bgcolor="#f5f5f5"><A 
      href="../Company/Com_Search_Industry.asp?Param=16"  target="_blank">���/����/���</A></TD>
                      </TR>
                      <TR> 
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=17"  target="_blank">ý��/Ӱ������/���ų���</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=18"  target="_blank">����/�Ļ�����</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=19"  target="_blank">��������Ʒ</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=20"  target="_blank">��֯Ʒҵ</A></TD>
                      </TR>
                      <TR bgcolor="#f5f5f5"> 
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=21"  target="_blank">��ѯҵ</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=22"  target="_blank">����ҵ(Ͷ��/����/֤ȯ)</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=23"  target="_blank">����/���ز�/��ҵ����</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=24"  target="_blank">����/����/�Ƶ�</A></TD>
                      </TR>
                      <TR> 
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=25"  target="_blank">����/����/���</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=26"  target="_blank">����ҵ</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=27"  target="_blank">�칫�豸/�Ļ�����</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=28"  target="_blank">ӡˢ/��װ/��ֽ</A></TD>
                      </TR>
                      <TR bgcolor="#f5f5f5"> 
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=29"  target="_blank">����/����/�ӹ�</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=30"  target="_blank">����/��ѵ/����Ժ��</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=31"  target="_blank">ҽ��/����/��������</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=32"  target="_blank">�˲Ž���/�н�</A></TD>
                      </TR>
                      <TR> 
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=33"  target="_blank">Э��/����/����/����</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=34"  target="_blank">ũ/��/��/��/��ҵ</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param=35"  target="_blank">����</A></TD>
                        <TD height="26"><A 
      href="../Company/Com_Search_Industry.asp?Param="  target="_blank"></A></TD>
                      </TR>
                    </TBODY>
                  </TABLE></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="22"><img src="../Images/Company/icon10.gif" width="5" height="16" align="absmiddle"> 
                  <strong><font color="#333333">��������</font></strong> <a name="c"></a></td>
              </tr>
              <tr> 
                <td height="2" bgcolor="#4273B2"></td>
              </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
              <tr align="center"> 
                <td width="14%" height="25"><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td width="14%"><a href="Com_Search_Area.asp?Param=���" target="_blank" >���</a></td>
                <td width="14%"><a href="Com_Search_Area.asp?Param=�Ϻ�" target="_blank" >�Ϻ�</a></td>
                <td width="14%"><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td width="14%"><a href="Com_Search_Area.asp?Param=�㶫" target="_blank" >�㶫</a></td>
                <td width="14%"><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td width="14%"><a href="Com_Search_Area.asp?Param=�㽭" target="_blank" >�㽭</a></td>
              </tr>
              <tr align="center" bgcolor="#f5f5f5"> 
                <td height="25"><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=ɽ��" target="_blank" >ɽ��</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=�Ĵ�" target="_blank" >�Ĵ�</a></td>
              </tr>
              <tr align="center"> 
                <td height="25"><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=�ӱ�" target="_blank" >�ӱ�</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=ɽ��" target="_blank" >ɽ��</a></td>
              </tr>
              <tr align="center" bgcolor="#f5f5f5"> 
                <td height="25"><a href="Com_Search_Area.asp?Param=���ɹ�" target="_blank" >���ɹ�</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=�ຣ" target="_blank" >�ຣ</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
              </tr>
              <tr align="center"> 
                <td height="25"><a href="Com_Search_Area.asp?Param=�½�" target="_blank" >�½�</a></td>
                <td><a href="Com_Search_Area.asp?Param=̨��" target="_blank" >̨��</a></td>
                <td><a href="Com_Search_Area.asp?Param=���" target="_blank" >���</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td><a href="Com_Search_Area.asp?Param=����" target="_blank" >����</a></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
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
