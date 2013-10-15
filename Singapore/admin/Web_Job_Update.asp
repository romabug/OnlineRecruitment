<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Comid,PageNo

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"150") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//调用保存数据的函数
Jobid = Replace_Text(Request.QueryString("Jobid"))
Comid = Replace_Text(Request.QueryString("Comid"))

'//调用存储过程
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
 Response.write "没有找到职位信息！"
 Response.End()
End if

Tmp = Rs.GetRows() '//将数据填充到数组

'//0职位类型,1类别,2名称,3待遇,4招聘人数,5工作地区省,6市,7具体要求,8面试地址,9性别,10工作年限,11发布时间,12显示次数,13应聘次数,14职位状态,15要求求职者所在地省,16市,17最小年龄,18最大年龄,19固顶,20企业部门,21急聘,22截止日期,23联系人,24电话,25传真,26电话屏蔽,27邮件,28邮件屏蔽,29公司地址,30邮政编码,31学历
'//如 Tmp(0,0) 表示职位类型
'//关闭数据库对象
Rs.Close
Set Cmd = Nothing

'//功能代码
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
Locus_Area          = Tmp(15,0) '//要求求职者所在省份
Locus_City          = Tmp(16,0) '//要求求职者所在城市
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>编辑职位</strong></font></td>
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
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>职位信息</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 职位类型：</td>
                        <td height="25"> <input name="jobtype" type="radio" value="1" <% If JobType = 1 Then Response.write "Checked" %>>
                          全职 
                          <input type="radio" name="jobtype" value="2" <% If JobType = 2 Then Response.write "Checked" %>>
                          兼职 
						  <input type="radio" name="jobtype" value="3" <% If JobType = 3 Then Response.write "Checked" %>>
                          校园招聘 
						  </td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 职位类别：</td>
                        <td height="25" bgcolor="#fff7f0">先选择上排的大类，再在下排选择相应的子类，然后按添加<br>
                          如果想要删出选好的工作岗位，请先选中该项，然后按移除</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">&nbsp;</td>
                        <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="40%" height="20"><FONT 
                              color=#333333>选择职位类别</FONT></td>
                              <td width="15%">&nbsp;</td>
                              <td width="45%"><FONT 
                              color=#333333>已经选择的职位类别</FONT></td>
                            </tr>
                            <tr> 
                              <td><SELECT  id=select5  name=slt_category  style="width:180px">
                                </SELECT> <br> <select  name=slt_subcategory size="1"  id=select6 style="width:180px">
                                </select></td>
                              <td><table width="100%" border="0" cellspacing="0" class="text01">
                                  <tr> 
                                    <td height="25" align="center"><input type="button" name="Submit2" value="添加&gt;&gt;" onclick="AddItemToList('slt_category','slt_subcategory','slt_selectedjobs',1, 1, '-')"></td>
                                  </tr>
                                  <tr> 
                                    <td height="25" align="center"><input type="button" name="Submit3" value="&lt;&lt;移除" onclick="DeleteListSelectedItem('slt_selectedjobs', 0)"></td>
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
                  color=#ff6600>*</FONT></STRONG> 职位名称：</td>
                        <td height="25" bgcolor="#fff7f0"><input name="jobname" type="text" id="jobname" maxlength="40" style="width:180px" value="<%= Tmp(2,0) %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">&nbsp;</td>
                        <td height="25"><input name="bestflag" type="checkbox" id="bestflag" value="1"  <% If BestFlag = True Then Response.write "Checked" %>>
                          急聘本职位 ( 企业如果没有急聘权限，本限不起作用 )</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0">招聘部门：</td>
                        <td height="25" bgcolor="#fff7f0"> <select name="deptid" id="deptid" style="width:100px">
                            <option value="0">-请选择-</option>
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
                          </select> <a href="Com_Dept.asp"><u>新增企业部门</u></a></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 招聘人数：</td>
                        <td height="25"><input name="number" type="text" style="width:100px" maxlength="4"  value="<%= Tmp(4,0) %>">
                          人 ( 默认为0,表示若干人 )</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 薪资待遇：</td>
                        <td height="25" bgcolor="#fff7f0"><input name="deal" type="text" style="width:100px" maxlength="4"  value="<%= Tmp(3,0) %>">
                          元/月 ( 默认为0,表示待遇面议 )</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 截止日期：</td>
                        <td height="25"><input name="end_year" type="text" size="4" maxlength="4" value="<%= End_Year %>">
                          年 
                          <select name=end_month id="end_month">
                            <%for i=1 to 12%>
                            <option <%if i=End_month then%>selected<%end if%> value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          月 
                          <select name=end_day id="end_day">
                            <%for i=1 to 31%>
                            <option <%if i=End_day then%>selected<%end if%> value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          日</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 工作地区：</td>
                        <td height="25" bgcolor="#fff7f0">先选择上排的省区，再在下排选择相应的城市，然后按添加<br>
                          如果想要删出选好的工作地点，请先选中该项，然后按移除</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">&nbsp;</td>
                        <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="40%"><FONT 
                              color=#333333>选择工作地点</FONT></td>
                              <td width="15%">&nbsp;</td>
                              <td width="45%"><FONT 
                              color=#333333>已经选择的工作地点</FONT></td>
                            </tr>
                            <tr> 
                              <td><select style="width:180px"  name=slt_workplacearea>
                                </select> <select name=slt_workplacecity size="1" style="width:180px">
                                </select></td>
                              <td><table width="100%" border="0" cellspacing="0" class="text01">
                                  <tr> 
                                    <td height="25" align="center"><input type="button" name="Submit22" value="添加&gt;&gt;" onclick="AddItemToList('slt_workplacearea','slt_workplacecity','slt_selectedplaces',1, 2, '-')"></td>
                                  </tr>
                                  <tr> 
                                    <td height="25" align="center"><input type="button" name="Submit32" value="&lt;&lt;移除" onclick="DeleteListSelectedItem('slt_selectedplaces', 0)"></td>
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
                  color=#ff6600>*</FONT></STRONG> 具体要求：</td>
                        <td height="25" bgcolor="#fff7f0">简单阐述职位具体要求/待遇 ;</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">&nbsp;</td>
                        <td height="25"><textarea name="require" cols="50" rows="6" ><%= Require %></textarea></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 任职要求：</td>
                        <td height="25" bgcolor="#fff7f0">请填写职位要求,以便求职者能在设定查询条件时更容易搜索到贵企业的职位 
                          ;</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">&nbsp;</td>
                        <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="80" height="25" align="right">学 历：</td>
                              <td height="25"> <select name="edus" id="edus" style="width:70px;">
                                  <option value="0" <% If Edus = 0 Then Response.write "Selected" %>>-不限-</option>
                                  <option value="10" <% If Edus = 10 Then Response.write "Selected" %>>小学</option>
                                  <option value="20" <% If Edus = 20 Then Response.write "Selected" %>>初中</option>
                                  <option value="30" <% If Edus = 30 Then Response.write "Selected" %>>高中</option>
                                  <option value="40" <% If Edus = 40 Then Response.write "Selected" %>>中专</option>
                                  <option value="50" <% If Edus = 50 Then Response.write "Selected" %>>专科</option>
                                  <option value="60" <% If Edus = 60 Then Response.write "Selected" %>>本科</option>
                                  <option value="70" <% If Edus = 70 Then Response.write "Selected" %>>硕士</option>
                                  <option value="80" <% If Edus = 80 Then Response.write "Selected" %>>博士</option>
                                  <option value="90" <% If Edus = 90 Then Response.write "Selected" %>>博士后</option>
                                </select> </td>
                            </tr>
                            <tr> 
                              <td width="80" height="25" align="right">工作年限：</td>
                              <td height="25"> <select name="works" id="works" style="width:70px;">
                                  <option value="0" <% If Works = 0 Then Response.write "Selected" %>>-不限-</option>
                                  <option value="1" <% If Works = 1 Then Response.write "Selected" %>>一年以上</option>
                                  <option value="2" <% If Works = 2 Then Response.write "Selected" %>>二年以上</option>
                                  <option value="3" <% If Works = 3 Then Response.write "Selected" %>>三年以上</option>
                                  <option value="4" <% If Works = 4 Then Response.write "Selected" %>>四年以上</option>
                                  <option value="5" <% If Works = 5 Then Response.write "Selected" %>>五年以上</option>
                                  <option value="10" <% If Works = 10 Then Response.write "Selected" %>>十年以上</option>
                                  <option value="20" <% If Works = 20 Then Response.write "Selected" %>>二十年以上</option>
                                  <option value="30" <% If Works = 30 Then Response.write "Selected" %>>三十年以上</option>
                                  <option value="50" <% If Works = 50 Then Response.write "Selected" %>>退休人员</option>
                                </select> </td>
                            </tr>
                            <tr> 
                              <td width="80" height="25" align="right">性 别：</td>
                              <td height="25"><select name="sex" size="1"  style="width:70px;">
                                  <option value="2" <% If Sex = 2 Then Response.write "Selected" %>>-不限-</option>
                                  <option value="1" <% If Sex = 1 Then Response.write "Selected" %>>男</option>
                                  <option value="0" <% If Sex = 0 Then Response.write "Selected" %>>女</option>
                                </select></td>
                            </tr>
                            <tr> 
                              <td width="80" height="25" align="right">年 龄：</td>
                              <td height="25"> <select name="min_age" size="1" id="min_age"  style="width:70px;">
                                  <option value="0">-不限-</option>
                                  <% 
								  For i=18 to 60
								  %>
                                  <option value="<%=i%>" <% If i=Tmp(17,0) Then %>selected<% End if %>><%= i %></option>
                                  <%
								  Next 
								   %>
                                </select>
                                至 
                                <select name="max_age" size="1" id="max_age"  style="width:70px;">
                                  <option value="0">-不限-</option>
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
                              <td width="80" height="25" align="right">现所在地：</td>
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
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>联系方式</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 联系人：</td>
                        <td height="25"><input name="contactperson" type="text" size="30" maxlength="30" style="width:120px;" value="<%= Tmp(23,0) %>"> 
                          <font color="#50463d">请输入正确联系人，以方便求职者与贵公司联系</font></td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 联系电话：</td>
                        <td height="25" bgcolor="#fff7f0"><input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30" value="<%= Tmp(24,0) %>"> 
                          <font color="#50463d">( </font> <font color="#50463d">固定电话号码，如：010-82615888 
                          ) </font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">传真号码：</td>
                        <td height="25"><input name="companyfax" type="text" id="companyfax" style="width:120px;" size="30" maxlength="30" value="<%= Tmp(25,0) %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0">&nbsp;</td>
                        <td height="25" bgcolor="#fff7f0"><input name="phonekeep" type="checkbox" value="1" <% If PhoneKeep = True Then Response.write "Checked" %>> 
                          <font color="#333333">屏蔽电话</font><font color="#50463d">( 
                          选择此项，将向求职者隐藏企业联系电话 )</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 电子邮件：</td>
                        <td height="25"> <input name="email" type="text" style="width:200px;"  value="<%= Tmp(27,0) %>" size="50"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0">&nbsp;</td>
                        <td height="25" bgcolor="#fff7f0"> <input name="emailkeep" type="checkbox" value="1" <% If EmailKeep = True Then Response.write "Checked" %>>
                          不公开邮件地址</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> 邮政编码：</td>
                        <td height="25"><input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;" value="<%= Trim(Tmp(30,0)) %>"></td>
                      </tr>
                      <tr bgcolor="#fff7f0"> 
                        <td height="25" align="right">面试地址：</td>
                        <td height="25"> <input name="chat_addr" type="text" id="chat_addr" style="width:260px;" size="100" value="<%= Tmp(8,0) %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> 通讯地址：</td>
                        <td height="25"><input name="address" type="text" size="100" style="width:260px;" value="<%= Tmp(29,0) %>">
                          如：北京市海淀区成府路××号 </td>
                      </tr>
                      <tr bgcolor="#fff7f0"> 
                        <td height="25" align="right">&nbsp;</td>
                        <td height="25"> <input name="alledit" type="checkbox" id="alledit" value="1">
                          更新所有招聘信息中的联系方式</td>
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
  objCitySelector.incPValueFormat = "%PText%－不限"
  objCitySelector.init();

  
  objJobCPSelector = new JobCategoryAssociateList(document.theForm.slt_category, null, document.theForm.slt_subcategory, PCLOptions);
  objJobCPSelector.init();
  objJobCCSelector = new JobCategoryAssociateList(document.theForm.slt_subcategory, document.theForm.slt_category, null, CCLOptions);
  objJobCCSelector.incPValue = true;
  objJobCCSelector.incPValueFormat = "%PText%－不限"
  objJobCCSelector.init();
  </SCRIPT> <input type="submit" name="Submit" value=" 保存职位信息  " style="height:35px;"> 
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
 'Check_Url() '//跨站提交数据检测
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
 Work                   = Replace_Text(Request.Form("slt_selectedplaces")) '//工作地区
 Work         = Split(Work,"-")
 Work_Area    = Trim(Work(0))  
 Work_City    = Trim(Work(1))

 
 If BestFlag  = "" Then BestFlag  = 0
 If PhoneKeep = "" Then PhoneKeep = 0
 If EmailKeep = "" Then EmailKeep = 0
 If Require <> "" Then Require = Replace(Require,Chr(13),"<br>")
 '//将没有发布急聘职位的权限是急聘参数重置
 If Session("Nc_Vip") = 0 or Session("Nc_Vip") = 2 Then
  BestFlag = 0
 End if
 End_Date  = End_Year&"-"&End_Month&"-"&End_Day
 
 SQL = "Update [pH_Job_Base] Set JobType="&JobType&",JobClass='"&JobClass&"',JobName='"&JobName&"',Deal="&Deal&",Number="&Number1&",Work_Area='"&Work_Area&"',Work_City='"&Work_City&"',Require='"&Require&"',Chat_Addr='"&Chat_Addr&"',Edus="&Edus&",Sex="&Sex&",Works="&Works&",LastUpdate_Time=getdate(),Area='"&Area&"',City='"&City&"',Min_Age="&Min_Age&",Max_Age="&Max_Age&",DeptId="&DeptId&",BestFlag="&BestFlag&",End_Date='"&End_Date&"',ContactPerson='"&ContactPerson&"',Phone='"&Phone&"',CompanyFax='"&CompanyFax&"',PhoneKeep="&PhoneKeep&",Email='"&Email&"',EmailKeep="&EmailKeep&",Address='"&Address&"',ZipCode='"&ZipCode&"' Where Jobid="&Jobid&" And Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 
 '//同步更新企业发布的所有职位的联系方式
 If AllEdit = "1" Then
    SQL = "UpDate [pH_Job_Base] Set ContactPerson='"&ContactPerson&"',Phone='"&Phone&"',CompanyFax='"&CompanyFax&"',PhoneKeep="&PhoneKeep&",Email='"&Email&"',EmailKeep="&EmailKeep&",Address='"&Address&"',ZipCode='"&ZipCode&"',Chat_Addr='"&Chat_Addr&"' Where Comid='"&Comid&"'"
    Conn.Execute(SQL)
 End if

 '操作完成
 Response.write "<script language=JavaScript>alert('操作完成！');location.href='Web_Job_All.asp';</script>"
 Response.End()
End Sub

 %>

