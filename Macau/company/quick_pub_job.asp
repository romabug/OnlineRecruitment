<!--#include file="../conn.asp"-->  
 
<%
'set rs=server.createobject("adodb.recordset")
'rs.open "select * from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<link href="../css/01387.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT language=javascript src="inc/fajobs.js"></SCRIPT>
<body>
<div align="center"> <strong> <font color="#0000FF"> <span class="news10">
  <%
set rs2=server.createobject("adodb.recordset")
rs2.open "select  companyname from [01387company] where cid='"&request.cookies("01387job")("cid")&"'  " ,conn,1,1
%>
  �������� <%=rs2("companyname")%> ��˾��ְλ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Quick_reg.asp">###�Ǽ��¹�˾####</a></span></font></strong></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="55" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
      
    </td>
    <td width="730" valign="top" style="BORDER-left: #9DB3C5 1px solid;"> 
        <table class='win_update_table' border='0' cellpadding='0' cellspacing='1'>
         <form name="form1" method="post" action="quick_jobsave.asp" onSubmit="return Juge(this)">
            <tr>
              
            <td colspan='4' class='win_update_table_top'>������Ƹְλ<strong><font color="#0000FF"><span class="news10"> 
              cid �� 
              <%  response.Write(request.cookies("01387job")("cid") )   %>
              <%
rs2.close
set rs2=nothing
conn.close
set conn=nothing
%>
              </span></font></strong></td>
            </tr>
            <tr>
              
            <td class='win_update_table_td2
2'>ְλ��� </td>
              <td colspan="3"><select name="maincatelog" class="input" id="maincatelog" onChange="javascript:selectjob(this, document.form1.subcatelog)" >
                                  <option value="0" selected >��ѡ��</option>
                                  <option value="1" >��ʳ/����/����</option>
                                  <option value="2" >�̵�/����/�̳�</option>
                                  <option value="3" >����/�Ƶ�/����/����</option>
                                  <option value="4" >����ҵ/�ɻ���/����</option>
                                  <option value="5" >��Ѷ�Ƽ�/����/ͨѶ</option>
                                  <option value="6" >���/ý��/����/���</option>
                                  <option value="7" >ˮ/��/��/�յ�/����</option>
                                  <option value="8" >����ά��/��������</option>
                                  <option value="9" >����/װ��/�ӹ�</option>
                                  <option value="10" >��ķ/����/����</option>
                                  <option value="11" >��/����/��Ħ</option>
                                  <option value="12" >����/ģ��/����ҵ</option>
                                  <option value="13" >��չ/����/�ƹ�</option>
                                  <option value="14" >����/����ҵ</option>
                                  <option value="15" >԰��/��԰ά��</option>
                                  <option value="16" >������/ó��</option>
                                  <option value="17" >����/����/����</option>
                                  <option value="18" >����/����/����</option>
                                  <option value="19" >����/��ѵ</option>
                                  <option value="20" >����/����/ҽ��</option>
                                  <option value="21" >��ѯ/�н�/����</option>
                                  <option value="22" >�ۺ���ְ/����</option>
                                  <option value="23" >�߼�/�ۺϹ���</option>
                                  <option value="24" >������������</option>
                                </select> <SELECT name="subcatelog" class="input" id="subcatelog">
              </SELECT>
              <font color="#FF0000">* </font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>��Ƹְλ��</td>
              <td><input name="jobname" class="input" style="font-size: 12px" value="" size="30" maxlength="60"> <font color="#FF0000">*</font></td>
              <td  class="win_update_table_td2">��Ƹ������</td>
              <td><input class="input" maxlength="5" size="6" name="neednum"> 
                �� <font color="#FF0000">*</font></td>
           </tr>
            <tr>
              <td class='win_update_table_td2
'>ѧ<span class="win_update_table_td2"> &nbsp;&nbsp;</span>����</td>
              
            <td> <select name="degree" class="input" id="degree">
                <option value="0" >��������</option>
                <option value="1" >����</option>
                <option value="2" >ְ��</option>
                <option value="3" selected="selected" >��ר</option>
                <option value="4" >��ר</option>
                <option value="5" >����</option>
                <option value="6" >˶ʿ</option>
                <option value="7" >��ʿ</option>
              </select>
              ������</td>
              <td class="win_update_table_td2">�������飺</td>
              <td><select name="doneyear" class="input" id="doneyear">
                                        <option value="0">Ӧ���ҵ��</option>
                                        <script language="javascript">
										for(var i=1;i<=10;i++)
										{
										document.write("<option value="+i+">"+i+"��</option>");
										}
										</script>
                                      </select>
              ������</td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>��<span class="win_update_table_td2"> &nbsp;&nbsp;</span>��</td>
              <td><select name="sex" size="1" class="input">
                                        <option selected value="3">����</option>
                                        <option value="1" >��</option>
                                        <option value="2" >Ů</option>
                                      </select></td>
              <td class="win_update_table_td2">�� &nbsp;&nbsp; �䣺</td>
              <td><font color="#000000">
                <input name="needage" class="input" id="needage" value="����" size="10" />
              </font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2'>�������ͣ�</td>
              <td><select name="jobtype" size="1" class="input" id="jobtype">
                <option value="1">ȫְ</option>
                <option value="2">��ְ</option>
                                                                      </select></td>
              <td class="win_update_table_td2">����������</td>
              <td><font color="#000000">
                <input name="jobcity" class="input" id="jobcity" value="����" size="10" />
              ��:���ţ�����</font><font color="#FF0000"> *</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>н�ʴ�����</td>
              <td><input class="input" value="0" maxlength="5" size="6" name="Salary">
                                <span class="p11">Ԫ/��</span> Ĭ��&quot;0&quot;��ʾ��������</td>
              <td class="win_update_table_td2">��ϵ������</td>
              <td><input onClick="MM_showHideLayers('tip1','','show');MM_showHideLayers('tip2','','hide');MM_showHideLayers('tip3','','hide')" type="radio" value="1" name="fangfa" />
�绰��ϵ
  <input onClick="MM_showHideLayers('tip1','','hide');MM_showHideLayers('tip2','','show');MM_showHideLayers('tip3','','hide')" type="radio" value="2" name="fangfa" />
ͨ������<br />
<input name="fangfa" type="radio" onClick="MM_showHideLayers('tip1','','hide');MM_showHideLayers('tip2','','hide');MM_showHideLayers('tip3','','show')" value="3" checked="checked" />
��λ����<font color="#FF0000"> *</font>
<DIV id=tip1 style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; Z-INDEX: 1; FILTER: Alpha(Opacity=90,); LEFT: 810px; VISIBILITY: hidden; OVERFLOW:auto;POSITION: absolute; TOP: 350px; layer-background-color: #006666; font-line: 150%;WIDTH: 176px;  height:200px;"> 
  <TABLE width="96%" height="157" border=1 align="center">
    <TBODY>
  <TR>
        <TD height="151" bgColor=#e8e8e8>
		<table width="100%" height="61" align=center cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td height="18" style="line-height:140%;" >&nbsp;�㷢������Ƹ��Ϣѡ���˵绰��ϵ��<br>
                <b class="p11">�ŵ㣺</b><br>
                ӦƸ��Ա����ֱ������ظ�������ϵ��ʹ����Ƹְλ��һʱ��õ��ظ���<br>
                <b class="p11">���飺</b><br>
                ��Ƹְλ����Ƹ�����˲�����������ѡ�����</td>
            </tr>
          </tbody>
        </table></TD>
</TR></TBODY></TABLE></DIV>
<DIV id=tip2 
style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; FONT-SIZE: 9pt; Z-INDEX: 2; FILTER: Alpha(Opacity=90,); LEFT: 810px; VISIBILITY: hidden; OVERFLOW: auto; BORDER-LEFT: #000000 1px; WIDTH: 176px; BORDER-BOTTOM: #000000 1px; POSITION: absolute; TOP: 350px; layer-background-color: #006666; font-line: 150%; height: 250px;"> 
  <TABLE width="100%" border=1 align="center">
    <TBODY>
      <TR> 
        <TD bgColor=#e8e8e8> <TABLE width="100%" align=center>
            <TBODY>
              <TR> 
                <TD style="line-height:140%;" >�㷢������Ƹ��Ϣѡ����������ϵ��<br>
                  <b class="p11">�ŵ㣺</b><br>
                  ӦƸ��Ա����ͨ�������ʼ�����վ����ӦƸ����ʽӦƸ�㷢����ְλ����ͨ���ʼ����˲��ֲ�����������ӦƸ��Ա��<br><b class="p11">���飺</b><br>
                  �Ǽ�Ƹְλ����Ƹ�����˱Ƚ���Ϥ��������ѡ����� </TD>
              </TR>
            </TBODY>
          </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
</DIV>
<DIV id=tip3 
style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; FONT-SIZE: 9pt; Z-INDEX: 3; FILTER: Alpha(Opacity=90,); LEFT: 810px; VISIBILITY: hidden; OVERFLOW: auto; BORDER-LEFT: #000000 1px; WIDTH: 173px; BORDER-BOTTOM: #000000 1px; POSITION: absolute; TOP: 350px; layer-background-color: #006666; font-line: 150%; height: 179px;"> 
  <TABLE width="100%" border=1 align="center">
    <TBODY>
      <TR> 
        <TD bgColor=#e8e8e8> <TABLE width="100%" height="68" align=center>
            <TBODY>
              <TR> 
                <TD style="line-height:140%;" >�㷢������Ƹ��Ϣѡ���˵�λ��ϵ��<br><b class="p11">�ŵ㣺</b><br>ӦƸ��Ա����ֱ�ӵ���˾���ԣ�<br><b class="p11">���飺</b><br>
                  ��Ƹְλ����Ƹ��λ�������������ҵ��ѡ����� </TD>
              </TR>
            </TBODY>
          </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
</DIV></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>ס��Ҫ��</td>
              <td><select name="zhufang" size="1" id="select5">
                <option value="0">����Э��</option>
                <option value="1">�ṩס��</option>
                <option value="2">���н��</option>
                            </select>
              </td>
              <td class="win_update_table_td2">��ֹ��Ƹ���ڣ�</td>
              <td><select size="1" name="zpyear" style="font-size:9pt">
                    <option value="">��</option>
					   <option value="2008" >2008</option>
                    <option value="2009" selected="selected">2009</option>
					 <option value="2010">2010</option>
					  <option value="2011">2011</option>
                      <option value="2012">2012</option>
                </select>
                  <select size="1" name="zpmonth" style="font-size:9pt" onChange="javascript:dateselect()">
                    <option value="" selected>��</option>
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                  </select>

                  <select size="1" name="zpday"  style="font-size:9pt">
                    <option value="" selected>��</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10" >10</option>
                    <option value="11" >11</option>
                    <option value="12" >12</option>
                    <option value="13" >13</option>
                    <option value="14" >14</option>
                    <option value="15" >15</option>
                    <option value="16" >16</option>
                    <option value="17" >17</option>
                    <option value="18" >18</option>
                    <option value="19" >19</option>
                    <option value="20" >20</option>
                    <option value="21" >21</option>
                    <option value="22" >22</option>
                    <option value="23" >23</option>
                    <option value="24" >24</option>
                    <option value="25" >25</option>
                    <option value="26" >26</option>
                    <option value="27" >27</option>
                    <option value="28" >28</option>
                    <option value="29" >29</option>
                    <option value="30" >30</option>
                    <option value="31" >31</option>
                  </select>
              <font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>����Ҫ��</td>
              <td colspan="3"><textarea class="input" id="textarea" name="demand" rows="10" cols="76" style="font-size: 12px">


�����������ȵ绰��ϵ��</textarea>
              <br />
              <font color="#333333">���Լ�����ز���ְλ����Ҫ��<font color="#FF3300" class="p11">1000������</font>��</font><font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>������֪��</td>
              <td colspan="3"><textarea  name="interview" cols="76" rows="3" class="input" id="interview" style="font-size: 12px"></textarea>
              <br />
              <font color="#666666"><font color="#333333">�����磺����ʱ��������֤ԭ����ѧ����ѧλ֤��ԭ����һ����Ƭ3�š�<font color="#FF3300" class="p11">500����</font>��</font></font></td>
            </tr>
            <tr>
              <td height="40" colspan="4" align="center" ><button accesskey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> 
              ��������ְλ</button></td>
            </tr>
          </form>
        </table>
      <br /></td>
  </tr>
</table>

</body>
</html>
<%
'rs.close
'set rs=nothing
'conn.close
'set conn=nothing
%>
