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
<title><%= Cls_WebName %> - ��ҵ����</title>
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
    <td><!--#include file="../Header/Company_Index.asp" --></td>
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
                          <TD width="60" height=22 vAlign=center><A  href="../Person/Per_Resume.asp?Param=<%= Perid %>" target=_blank><%= RealName %></A></TD>
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
            <tr valign="top">
              <td width="377"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><img src="../Images/Company/right10_top.gif" width="377" height="4"></td>
                  </tr>
                  <tr>
                    <td valign="top" background="../Images/Company/right10_bg.gif"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="50"><img src="../Images/Company/per_1.gif" width="46" height="47"></td>
                                <td align="right" class="font-14"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td align="right" class="font-14"><strong>������Ƹ</strong></td>
                                    </tr>
                                    <tr>
                                      <td align="right" class="font-14"><strong>Recruitment 
                                        Network</strong></td>
                                    </tr>
                                </table></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td>�¼������������й�������Ƹ��վ֮һ��ͨ��������ȫ��λΪ��ҵ�ͻ��ṩ�������������Ʒ����Ƹ���������˲���Ƹ������������㲻ͬ�ͻ���ͬ�׶ε���Ƹ����</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="../Images/Company/right10_bottom.gif" width="377" height="4"></td>
                  </tr>
              </table></td>
              <td width="6">&nbsp;</td>
              <td width="377"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><img src="../Images/Company/right10_top.gif" width="377" height="4"></td>
                  </tr>
                  <tr>
                    <td valign="top" background="../Images/Company/right10_bg.gif"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="50"><img src="../Images/Company/per_2.gif" width="46" height="47"></td>
                                <td align="right" class="font-14"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td align="right" class="font-14"><strong>��Ƶ��Ƹ</strong></td>
                                    </tr>
                                    <tr>
                                      <td align="right" class="font-14"><strong>Video 
                                        Recruitment</strong></td>
                                    </tr>
                                </table></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td>�¼����������ǲ������Ƚ���FMS����Ϊ��ҵ�͸��˻�Աʵ������¼����Ƶ��Ϣ��ͬʱ�ṩ������Ƶ������Ƶ��Ƹ�����Ƶ�����û�����ȫ��λ��������Ƶ������ݺͿ��ٵĹ�ͨ��</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="../Images/Company/right10_bottom.gif" width="377" height="4"></td>
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
              <tr valign="top">
                <td width="377"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="../Images/Company/right10_top.gif" width="377" height="4"></td>
                    </tr>
                    <tr>
                      <td valign="top" background="../Images/Company/right10_bg.gif"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="50"><img src="../Images/Company/per_3.gif" width="46" height="47"></td>
                                  <td align="right" class="font-14"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td align="right" class="font-14"><strong>У԰��Ƹ</strong></td>
                                      </tr>
                                      <tr>
                                        <td align="right" class="font-14"><strong>Campus 
                                          Recruitment</strong></td>
                                      </tr>
                                  </table></td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td>�¼�����������������Э�����ұ�ҵ����ҵָ�����ľٰ��У��ҵ��������Ƹ�ᣬ��У԰���Ź㷺��Ӱ�졣Ϊ��ҵ�ṩȫ���У԰��Ƹ������������ǽ�100����ȫ���ص��У��<br>
                            </td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td><img src="../Images/Company/right10_bottom.gif" width="377" height="4"></td>
                    </tr>
                </table></td>
                <td width="6">&nbsp;</td>
                <td width="377"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="../Images/Company/right10_top.gif" width="377" height="4"></td>
                    </tr>
                    <tr>
                      <td valign="top" background="../Images/Company/right10_bg.gif"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="50"><img src="../Images/Company/per_4.gif" width="46" height="47"></td>
                                  <td align="right" class="font-14"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td align="right" class="font-14"><strong>��ͷ����</strong></td>
                                      </tr>
                                      <tr>
                                        <td align="right" class="font-14"><strong>Headhunting 
                                          Services</strong></td>
                                      </tr>
                                  </table></td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td>����רҵ �������Ӵ��רҵ��ѯ�����Ŷ�Ϊ���ṩרҵ��ͷ����<br>
                              ���پ�׼ Ѹ�ݡ�׼ȷ����ѡ��ѡ�˲�<br>
                              ��Чȫ�� ��ͷ������רҵɸѡ��˫�����</td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td><img src="../Images/Company/right10_bottom.gif" width="377" height="4"></td>
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
                <td width="17"><img src="../Images/company/right1_left.jpg" width="17" height="24"></td>
                <td background="../Images/company/right1_bg.jpg"><strong><font color="#104e9e">���¼���</font></strong></td>
                <td width="11"><img src="../Images/company/right1_right.jpg" width="11" height="24"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="2"></td>
              </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
              <tr align="center" bgcolor="f3f3f3"> 
                <td width="15%" height="25">����</td>
                <td width="10%" height="25">�Ա�</td>
                <td width="10%" height="25">����</td>
                <td width="12%" height="25">ѧ��</td>
                <td width="27%" height="25" bgcolor="f3f3f3">��ҵѧУ</td>
                <td height="25">��ѧרҵ</td>
              </tr>
              <% 
SQL = "Select Top 15 I.Perid,I.RealName,I.Sex,I.Edus,I.Age,I.LastSchool,I.Speciality,I.ResumeMode From pH_Person_Base As B,pH_Person_Info As I  Where B.Perid=I.Perid And Len(I.RealName)>0 And I.ResumeKeep<>1 And B.Flag=1 Order By B.LastUpdate_Time Desc"
Set Rs = Conn.Execute(SQL)
For i = 1 to 11 
 If Rs.Eof Then Exit For
 Perid           = Rs(0)
 RealName        = Rs(1)
 Sex             = Rs(2)
 Edus            = Rs(3)
 Age             = Rs(4)
 LastSchool      = Rs(5)
 Speciality      = Rs(6)
 ResumeMode      = Rs(7)
 If ResumeMode = null Then ResumeMode = 1
 %>
              <tr> 
                <td height="24" align="center"><a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a></td>
                <td height="23" align="center"><%= Cls_Sex(Sex) %></td>
                <td height="23" align="center"><%= Age %></td>
                <td height="23" align="center"><%= Cls_Edus(Edus) %></td>
                <td height="23"><%= LastSchool %></td>
                <td height="23"><%= Speciality %></td>
              </tr>
              <% 
 Rs.Movenext
 If Rs.Eof Then Exit For 
 Perid           = Rs(0)
 RealName        = Rs(1)
 Sex             = Rs(2)
 Edus            = Rs(3)
 Age             = Rs(4)
 LastSchool      = Rs(5)
 Speciality      = Rs(6)
 ResumeMode      = Rs(7)
 If ResumeMode = null Then ResumeMode = 1
 %>
              <tr bgcolor="f9f9f9"> 
                <td height="24" align="center"><a href="../Person/Per_Resume.asp?Param=<%= Perid %>" target="_blank"><%= RealName %></a></td>
                <td height="23" align="center"><%= Cls_Sex(Sex) %></td>
                <td height="23" align="center"><%= Age %></td>
                <td height="23" align="center"><%= Cls_Edus(Edus) %></td>
                <td height="23"><%= LastSchool %></td>
                <td height="23"><%= Speciality %></td>
              </tr>
              <% 
 Rs.Movenext
Next
Rs.Close
 %>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="right">[<a href="../Company/Com_Search_New.asp" target="_blank"><u>������ְ����...</u></a>]&nbsp;</td>
              </tr>
            </table> </td>
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
