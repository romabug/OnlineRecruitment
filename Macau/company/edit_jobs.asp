<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim jid,cid
jid=request.QueryString("jid")
cid=request.cookies("01387job")("cid")
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where cid='"&cid&"'" ,conn,1,1
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from [01387joblist] where jid='"&jid&"'" ,conn,1,1
if rs1("cid")<>cid then
response.redirect("login.asp")
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��-��ҵ��Ƹ����</title>
<meta name="description" content="�����͹���Ƹ��macau69.com�ǰ�����Ȩ�����͹���Ƹ�Ż���վ������վ�����˰��Ź���,�͹��˲�,���ŷ���,�͹����ŵ���Ϣ��������������ʵ�����˾����,���˹��ڸ���ְҵѧУ,���k,��У���˲Ż������ṩ������ѯ,������ѵ,���������һ��������" >
<meta  name="keywords" content="��������,�����͹�,�����͹��˲�,��Ƹ�����͹�,���Ź���,�͹���Ƹ,�����͹�֤,�۰��˲�,����Ͷ������,�㶫����ѵ,�͹�����,�����ⷿ,��������,���ž�ҵ,���ŷ���,���Ų���,����˹��,����Ա" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT language=javascript src="inc/fajobs.js"></SCRIPT>
<body>
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
        <!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
        <table class='win_update_table' border='0' cellpadding='0' cellspacing='1'>
         <form name="form1" method="post" action="editjob_save.asp" onSubmit="return Juge(this)">
            <tr>
              <td colspan='4' class='win_update_table_top'>������Ƹְλ</td>
            </tr>
            <tr>
              <td class='win_update_table_td2
2'>ְλ���</td>
              <td colspan="3"><select name="maincatelog" class="input" id="maincatelog" onChange="javascript:selectjob(this, document.form1.subcatelog)" >
                                  <option value="0" >��ѡ��</option>
                                  <option value="1" <%if rs1("maincatelog")=1 then%>selected<%end if%>>��ʳ/����/����</option>
                                  <option value="2" <%if rs1("maincatelog")=2 then%>selected<%end if%>>�̵�/����/�̳�</option>
                                  <option value="3" <%if rs1("maincatelog")=3 then%>selected<%end if%>>����/�Ƶ�/����/����</option>
                                  <option value="4" <%if rs1("maincatelog")=4 then%>selected<%end if%>>����ҵ/�ɻ���/����</option>
                                  <option value="5" <%if rs1("maincatelog")=5 then%>selected<%end if%>>��Ѷ�Ƽ�/����/ͨѶ</option>
                                  <option value="6" <%if rs1("maincatelog")=6 then%>selected<%end if%>>���/ý��/����/���</option>
                                  <option value="7" <%if rs1("maincatelog")=7 then%>selected<%end if%>>ˮ/��/��/�յ�/����</option>
                                  <option value="8" <%if rs1("maincatelog")=8 then%>selected<%end if%>>����ά��/��������</option>
                                  <option value="9" <%if rs1("maincatelog")=9 then%>selected<%end if%>>����/װ��/�ӹ�</option>
                                  <option value="10" <%if rs1("maincatelog")=10 then%>selected<%end if%>>��ķ/����/����</option>
                                  <option value="11" <%if rs1("maincatelog")=11 then%>selected<%end if%>>��/����/��Ħ</option>
                                  <option value="12" <%if rs1("maincatelog")=12 then%>selected<%end if%>>����/ģ��/����ҵ</option>
                                  <option value="13" <%if rs1("maincatelog")=13 then%>selected<%end if%>>��չ/����/�ƹ�</option>
                                  <option value="14" <%if rs1("maincatelog")=14 then%>selected<%end if%>>����/����ҵ</option>
                                  <option value="15" <%if rs1("maincatelog")=15 then%>selected<%end if%>>԰��/��԰ά��</option>
                                  <option value="16" <%if rs1("maincatelog")=16 then%>selected<%end if%>>������/ó��</option>
                                  <option value="17" <%if rs1("maincatelog")=17 then%>selected<%end if%>>����/����/����</option>
                                  <option value="18" <%if rs1("maincatelog")=18 then%>selected<%end if%>>����/����/����</option>
                                  <option value="19" <%if rs1("maincatelog")=19 then%>selected<%end if%>>����/��ѵ</option>
                                  <option value="20" <%if rs1("maincatelog")=20 then%>selected<%end if%>>����/����/ҽ��</option>
                                  <option value="21" <%if rs1("maincatelog")=21 then%>selected<%end if%>>��ѯ/�н�/����</option>
                                  <option value="22" <%if rs1("maincatelog")=22 then%>selected<%end if%>>�ۺ���ְ/����</option>
                                  <option value="23" <%if rs1("maincatelog")=23 then%>selected<%end if%>>�߼�/�ۺϹ���</option>
                                  <option value="24" <%if rs1("maincatelog")=24 then%>selected<%end if%>>������������</option>
                                </select> <SELECT name="subcatelog" class="input" id="subcatelog">
                                  <option value="<%=rs1("subcatelog")%>"><%=rs1("subcatelog")%></option>
                                </SELECT> <font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>��Ƹְλ��</td>
              <td><input name="jobname" class="input" value="<%=rs1("jobname")%>" style="font-size: 12px" size="30" maxlength="60"> <font color="#FF0000">*</font></td>
              <td  class="win_update_table_td2">��Ƹ������</td>
              <td><input class="input" maxlength="5" size="6" value="<%=rs1("neednum")%>" name="neednum"> 
                �� <font color="#FF0000">*</font></td>
           </tr>
            <tr>
              <td class='win_update_table_td2
'>ѧ<span class="win_update_table_td2"> &nbsp;&nbsp;</span>����</td>
              <td><select name="degree" class="input" id="degree">
                                        <option value="0" <%if rs1("degree")=0 then%>selected<%end if%>>��������</option>
                                        <option value="1" <%if rs1("degree")=1 then%>selected<%end if%>>����</option>
                                        <option value="2" <%if rs1("degree")=2 then%>selected<%end if%>>ְ��</option>
                                        <option value="3" <%if rs1("degree")=3 then%>selected<%end if%>>��ר</option>
                                        <option value="4" <%if rs1("degree")=4 then%>selected<%end if%>>��ר</option>
                                        <option value="5" <%if rs1("degree")=5 then%>selected<%end if%>>����</option>
                                        <option value="6" <%if rs1("degree")=6 then%>selected<%end if%>>˶ʿ</option>
                                        <option value="7" <%if rs1("degree")=7 then%>selected<%end if%>>��ʿ</option>
                                      </select>
                                      ������</td>
              <td class="win_update_table_td2">�������飺</td>
              <td><select name="doneyear" class="input" id="doneyear">
                                        <option value="0" <%if rs1("doneyear")=0 then%>selected<%end if%>>Ӧ���ҵ��</option>
                                        <option value="1" <%if rs1("doneyear")=1 then%>selected<%end if%>>1��</option>
                                        <option value="2" <%if rs1("doneyear")=2 then%>selected<%end if%>>2��</option>
                                        <option value="3" <%if rs1("doneyear")=3 then%>selected<%end if%>>3��</option>
                                        <option value="4" <%if rs1("doneyear")=4 then%>selected<%end if%>>4��</option>
                                        <option value="5" <%if rs1("doneyear")=5 then%>selected<%end if%>>5��</option>
                                        <option value="6" <%if rs1("doneyear")=6 then%>selected<%end if%>>6��</option>
                                        <option value="7" <%if rs1("doneyear")=7 then%>selected<%end if%>>7��</option>
                                        <option value="8" <%if rs1("doneyear")=8 then%>selected<%end if%>>8��</option>
                                        <option value="9" <%if rs1("doneyear")=9 then%>selected<%end if%>>9��</option>
                                        <option value="10" <%if rs1("doneyear")=10 then%>selected<%end if%>>10��</option>
                                      </select>
                                      ������</td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>��<span class="win_update_table_td2"> &nbsp;&nbsp;</span>��</td>
              <td><select name="sex" size="1" class="input">
                                        <option value="3" <%if rs1("sex")=3 then%>selected<%end if%>>����</option>
                                        <option value="1" <%if rs1("sex")=1 then%>selected<%end if%>>��</option>
                                        <option value="2" <%if rs1("sex")=2 then%>selected<%end if%>>Ů</option>
                                      </select></td>
              <td class="win_update_table_td2">�� &nbsp;&nbsp; �䣺</td>
              <td><font color="#000000">
                <input name="needage" class="input"  value="<%=rs1("needage")%>" id="needage" size="10" />
              </font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2'>�������ͣ�</td>
              <td><select name="jobtype" size="1" class="input" id="jobtype">
                <option value="1" <%if rs1("jobtype")=1 then%>selected<%end if%>>ȫְ</option>
                <option value="2" <%if rs1("jobtype")=2 then%>selected<%end if%>>��ְ</option>
                                                                      </select></td>
              <td class="win_update_table_td2">����������</td>
              <td><font color="#000000">
                <input name="jobcity" class="input" id="jobcity" value="<%=rs1("jobcity")%>" size="10" />
              ��:���ţ�����</font><font color="#FF0000"> *</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>н�ʴ�����</td>
              <td><input class="input" maxlength="5" size="6" name="Salary" value="<%=rs1("salary")%>">
                                <span class="p11">Ԫ/��</span> Ĭ��&quot;0&quot;��ʾ��������</td>
              <td class="win_update_table_td2">��ϵ������</td>
              <td><input name="fangfa" type="radio" onClick="MM_showHideLayers('tip1','','show');MM_showHideLayers('tip2','','hide');MM_showHideLayers('tip3','','hide')" value="1" 
		<%if rs1("fangfa")=1 then%>checked="checked"<%end if%>	   />
�绰��ϵ
  <input onClick="MM_showHideLayers('tip1','','hide');MM_showHideLayers('tip2','','show');MM_showHideLayers('tip3','','hide')" type="radio" value="2" name="fangfa" <%if rs1("fangfa")=2 then%>checked="checked"<%end if%> />
ͨ������<br />
<input onClick="MM_showHideLayers('tip1','','hide');MM_showHideLayers('tip2','','hide');MM_showHideLayers('tip3','','show')" type="radio" value="3" name="fangfa" <%if rs1("fangfa")=3 then%>checked="checked"<%end if%> />
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
                <option value="0" <%if rs1("zhufang")=0 then%>selected<%end if%>>����Э��</option>
                <option value="1" <%if rs1("zhufang")=1 then%>selected<%end if%>>�ṩס��</option>
                <option value="2" <%if rs1("zhufang")=3 then%>selected<%end if%>>���н��</option>
                            </select>              </td>
              <td class="win_update_table_td2">��ֹ��Ƹ���ڣ�</td>
              <td><%ye=year(rs1("overtime"))
			    Mo=Month(rs1("overtime"))
				da=day(rs1("overtime"))
			  %>
			  <select size="1" name="zpyear" style="font-size:9pt">
                    <option value="" >��</option>
					 <option value="2006" <%if ye="2006" then response.write "selected" end if%>>2006</option>
                    <option value="2007" <%if ye="2007" then response.write "selected" end if%>>2007</option>
                    <option value="2008" <%if ye="2008" then response.write "selected" end if%>>2008</option>
                </select>
                  <select size="1" name="zpmonth" style="font-size:9pt" onChange="javascript:dateselect()">
                    <option value="" >��</option>
                    <option value="1"  <%if mo="1" then response.write "selected" end if%>>01</option>
                    <option value="2"  <%if mo="2" then response.write "selected" end if%>>02</option>
                    <option value="3"  <%if mo="3" then response.write "selected" end if%>>03</option>
                    <option value="4"  <%if mo="4" then response.write "selected" end if%>>04</option>
                    <option value="5"  <%if mo="5" then response.write "selected" end if%>>05</option>
                    <option value="6"  <%if mo="6" then response.write "selected" end if%>>06</option>
                    <option value="7"  <%if mo="7" then response.write "selected" end if%>>07</option>
                    <option value="8"  <%if mo="8" then response.write "selected" end if%>>08</option>
                    <option value="9"  <%if mo="9" then response.write "selected" end if%>>09</option>
                    <option value="10" <%if mo="10" then response.write "selected" end if%>>10</option>
                    <option value="11" <%if mo="11" then response.write "selected" end if%>>11</option>
                    <option value="12" <%if mo="12" then response.write "selected" end if%>>12</option>
                  </select>

                  <select size="1" name="zpday"  style="font-size:9pt">
                    <option value="" selected>��</option>
                    <option value="1" <%if da="1" then response.write "selected" end if%>>1</option>
                    <option value="2" <%if da="2" then response.write "selected" end if%>>2</option>
                    <option value="3" <%if da="3" then response.write "selected" end if%>>3</option>
                    <option value="4" <%if da="4" then response.write "selected" end if%>>4</option>
                    <option value="5" <%if da="5" then response.write "selected" end if%>>5</option>
                    <option value="6" <%if da="6" then response.write "selected" end if%>>6</option>
                    <option value="7" <%if da="7" then response.write "selected" end if%>>7</option>
                    <option value="8" <%if da="8" then response.write "selected" end if%>>8</option>
                    <option value="9" <%if da="9" then response.write "selected" end if%>>9</option>
                    <option value="10" <%if da="10" then response.write "selected" end if%>>10</option>
                    <option value="11" <%if da="14" then response.write "selected" end if%>>11</option>
                    <option value="12" <%if da="12" then response.write "selected" end if%>>12</option>
                    <option value="13" <%if da="13" then response.write "selected" end if%>>13</option>
                    <option value="14" <%if da="14" then response.write "selected" end if%>>14</option>
                    <option value="15" <%if da="15" then response.write "selected" end if%>>15</option>
                    <option value="16" <%if da="16" then response.write "selected" end if%>>16</option>
                    <option value="17" <%if da="17" then response.write "selected" end if%>>17</option>
                    <option value="18" <%if da="18" then response.write "selected" end if%>>18</option>
                    <option value="19" <%if da="29" then response.write "selected" end if%>>19</option>
                    <option value="20" <%if da="20" then response.write "selected" end if%>>20</option>
                    <option value="21" <%if da="21" then response.write "selected" end if%>>21</option>
                    <option value="22" <%if da="22" then response.write "selected" end if%>>22</option>
                    <option value="23" <%if da="23" then response.write "selected" end if%>>23</option>
                    <option value="24" <%if da="24" then response.write "selected" end if%>>24</option>
                    <option value="25" <%if da="25" then response.write "selected" end if%>>25</option>
                    <option value="26" <%if da="26" then response.write "selected" end if%>>26</option>
                    <option value="27" <%if da="27" then response.write "selected" end if%>>27</option>
                    <option value="28" <%if da="28" then response.write "selected" end if%>>28</option>
                    <option value="29" <%if da="29" then response.write "selected" end if%>>29</option>
                    <option value="30" <%if da="30" then response.write "selected" end if%>>30</option>
                    <option value="31" <%if da="31" then response.write "selected" end if%>>31</option>
                  </select>
              <font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2'>����Ҫ��</td>
              <td colspan="3"> <textarea class="input" id="textarea" name="demand" rows="10" cols="76" style="font-size: 12px"><%=replace(replace(rs1("demand"),"&nbsp;",chr(32)),"<br>",chr(13))%></textarea> 
              <br />
              <font color="#333333">���Լ�����ز���ְλ����Ҫ��<font color="#FF3300" class="p11">1000������</font>��</font><font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td class='win_update_table_td2
'>������֪��</td>
              <td colspan="3"><textarea  name="interview" cols="76" rows="3" class="input" id="interview" style="font-size: 12px"><% if rs1("interview")<>"" then response.Write(replace(replace(rs1("interview"),"&nbsp;",chr(32)),"<br>",chr(13)))%></textarea>
              <br />
              <font color="#666666"><font color="#333333">�����磺����ʱ��������֤ԭ����ѧ����ѧλ֤��ԭ����һ����Ƭ3�š�<font color="#FF3300" class="p11">500����</font>��</font></font></td>
            </tr>
            <tr>
              <td height="25" align="center" class='win_update_table_td2'>��ǰ״̬��</td>
              <td height="19" colspan="3" ><input name="canshow" type="radio" value="ok" <%if rs1("canshow")="ok" then response.Write "checked=""checked""" end if%> />
                <strong><font color=#009900>����</font></strong>
                  <input name="canshow" type="radio" value="no" <%if rs1("canshow")="no" then response.Write "checked=""checked""" end if%>  />
                  <strong><font color=#4088BA>�ر�</font></strong></td>
            </tr>
            <tr>
              <td height="20" colspan="4" align="center" >&nbsp;<input name="jid" type="hidden" id="jid" value="<%=jid%>" />
              <button accesskey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> ȷ���޸� </button></td>
            </tr>
          </form>
        </table>
      <br /></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
