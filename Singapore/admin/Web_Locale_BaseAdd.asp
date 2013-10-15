<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Action,Comid,PageNo
Dim CompanyName,Content,Property1,Products,ContactPerson,Phone,Address,InfoFrom,Licence,AddDate,Operation,InviteDate,Memo,Fax,Bus,Owner
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"170") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
Comid  = Replace_text(request("Comid"))
PageNo = Replace_text(request("pageno"))

Select Case Action
 Case "edit"
  Call Edit_Submit() '//跳转到编辑函数
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>添加企业</strong></font></td>
  </tr>
  <tr>
    <td height="2"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="70%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <form action="?action=edit" method="post" name="reg">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">企业名称：</td>
                  <td bgcolor="f5f5f5"><input name="companyname" type="text" id="companyname" size="30"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">企业性质：</td>
                  <td bgcolor="f5f5f5"><select name="property" id="property" style="width:180px;">
                      <option value="1">国有企业</option>
                      <option value="2">外资企业</option>
                      <option value="3">合资企业</option>
                      <option value="4">私营企业</option>
                      <option value="5">民营企业</option>
                      <option value="6">股份制企业</option>
                      <option value="7">集体企业</option>
                      <option value="8">集体事业</option>
                      <option value="9">乡镇企业</option>
                      <option value="10">行政机关</option>
                      <option value="11">社会团体</option>
                      <option value="12">事业单位</option>
                      <option value="13">跨国企业</option>
                      <option value="14">其他</option>
                    </select></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" align="right">行业类别：</td>
                  <td bgcolor="f5f5f5"><select name="industry" id="industry" style="width:180px;">
                      <option value="1">互联网、电子商务</option>
                      <option value="2">计算机业（软件、数据库、系统集成）</option>
                      <option value="3">计算机业（硬件、网络设备）</option>
                      <option value="4">电子、微电子技术</option>
                      <option value="5">通讯、电信业</option>
                      <option value="6">家电业</option>
                      <option value="7">批发零售(百货、超市、专卖店)</option>
                      <option value="8">贸易、商务、进出口</option>
                      <option value="9">电气</option>
                      <option value="10">电力、能源、矿产业</option>
                      <option value="11">石油、化工业</option>
                      <option value="12">生物工程、制药、环保</option>
                      <option value="13">机械制造、机电设备、重工业</option>
                      <option value="14">汽车、摩托车</option>
                      <option value="15">仪器仪表、电工设备</option>
                      <option value="16">广告、公关、设计</option>
                      <option value="17">媒体、影视制作、新闻出版</option>
                      <option value="18">艺术、文化传播</option>
                      <option value="19">快速消费品（食品、饮料、粮油、化妆品、烟酒）</option>
                      <option value="20">纺织品业（服饰、鞋类、家纺用品、皮具）</option>
                      <option value="21">咨询业（顾问、会计师、审计师、法律）</option>
                      <option value="22">金融业（投资、保险、证券、银行、基金）</option>
                      <option value="23">建筑、房地产、物业管理、装潢</option>
                      <option value="24">餐饮、娱乐、酒店</option>
                      <option value="25">运输、物流、快递</option>
                      <option value="26">旅游业</option>
                      <option value="27">办公设备、文化体育休闲用品、家居用品</option>
                      <option value="28">印刷、包装、造纸</option>
                      <option value="29">生产、制造、加工</option>
                      <option value="30">教育、培训、科研院所</option>
                      <option value="31">医疗、保健、卫生服务</option>
                      <option value="32">人才交流、中介</option>
                      <option value="33">协会、社团、政府公用事业、社区服务</option>
                      <option value="34">农、林、牧、副、渔业</option>
                      <option value="35">其他</option>
                    </select> </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">工作地区：</td>
                  <td> 
                    <!--#include file="../Include/Class_Locus.asp" -->
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">企业简介：</td>
                  <td bgcolor="f5f5f5"><textarea name="content" cols="45" rows="6" id="content"></textarea></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">联系人：</td>
                  <td bgcolor="f5f5f5"><input name="contactperson" type="text" id="property3" size="16"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" align="right">联系电话：</td>
                  <td bgcolor="f5f5f5"><input name="phone" type="text" id="contactperson" size="16"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">传真号码：</td>
                  <td bgcolor="f5f5f5"><input name="fax" type="text" id="fax" size="16"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">通讯地址：</td>
                  <td bgcolor="f5f5f5"><input name="address" type="text" id="address" size="30"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">行车路线：</td>
                  <td bgcolor="f5f5f5"><input name="bus" type="text" id="bus" size="30"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="添 加"> 
                  </td>
                </tr>
              </form>
            </table></td>
</tr>
</table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() '修改密码
 CompanyName			= Replace_text(Request.form("CompanyName"))
 Content                = Replace_text(Request.form("Content"))
 Property1				= Replace_text(Request.form("Property"))
 Industry    			= Replace_text(Request.form("Industry"))
 ContactPerson			= Replace_text(Request.form("ContactPerson"))
 Phone					= Replace_text(Request.form("Phone"))
 Address				= Replace_text(Request.form("Address"))
 Fax					= Replace_text(Request.form("Fax"))
 Bus					= Replace_text(Request.form("Bus"))
 Locus_Area				= Replace_text(Request.form("x_suozaidi"))
 Locus_City				= Replace_text(Request.form("x_suozaidi1"))
 
 If Content <> "" Then Content = Replace(Content,Chr(13),"<br>")
 
 '保存数据
 SQL = "Insert Into [pH_Locale_Base] (CompanyName,Content,Locus_Area,Locus_City,Property,Industry,ContactPerson,Phone,Address,AddDate,Fax,Bus,Cityid) Values ('"&CompanyName&"','"&Content&"','"&Locus_Area&"','"&Locus_City&"','"&Property1&"',"&Industry&",'"&ContactPerson&"','"&Phone&"','"&Address&"',Getdate(),'"&Fax&"','"&Bus&"',0)"
 Conn.Execute(SQL)
 
 Response.write "<script language=JavaScript>alert('操作成功！');location.href='Web_Locale_Base.asp';</script>"
End Sub

Call CloseDB()
 %>

