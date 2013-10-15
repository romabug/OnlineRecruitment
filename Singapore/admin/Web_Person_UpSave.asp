<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Comid,PageNo

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"120") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If


 Perid                = Replace_Text(Request.Form("Perid"))

 UserEmail            = Replace_Text(Request.Form("UserEmail"))
 RealName             = Replace_Text(Request.Form("RealName"))
 'Response.Write("|"&RealName&"|")
 'Response.End()
 Sex                  = Replace_Text(Request.Form("Sex"))
 Nation               = Replace_Text(Request.Form("Nation")) 
 Marry                = Replace_Text(Request.Form("Marry")) 
 Door_Area            = Replace_Text(Request.Form("huji")) 
 Door_City            = Replace_Text(Request.Form("huji1")) 
 Locus_Area           = Replace_Text(Request.Form("x_suozaidi")) 
 Locus_City           = Replace_Text(Request.Form("x_suozaidi1")) 
 Stature              = Replace_Text(Request.Form("Stature")) 
 Tizhong              = Replace_Text(Request.Form("Tizhong")) 
 BirthYear            = Replace_Text(Request.Form("BirthYear")) 
 Age                  = Cint(Year(Date))-Cint(BirthYear)
 BirthMonth           = Replace_Text(Request.Form("BirthMonth"))
 BirthDay             = Replace_Text(Request.Form("BirthDay")) 
 PersonPhone          = Replace_Text(Request.Form("PersonPhone")) 
 MsnQQ                = Replace_Text(Request.Form("MsnQQ")) 
 WebHome              = Replace_Text(Request.Form("WebHome")) 
 Appraise             = Replace_Text(Request.Form("Appraise")) 
 CodeId               = Replace_Text(Request.Form("CodeId")) 
 CodeType             = Replace_Text(Request.Form("CodeType")) 
 Mt                   = Replace_Text(Request.Form("Mt")) 
 ZipCode              = Replace_Text(Request.Form("ZipCode")) 
 Address              = Replace_Text(Request.Form("Address")) 
 
 If Appraise<>"" Then Appraise = Replace(Appraise,Chr(13),"<br>")
 
 SQL = "Update [pH_Person_Info] Set RealName='"&RealName&"',Sex="&Sex&",Nation='"&Nation&"',Marry="&Marry&",Age="&Age&",Door_Area='"&Door_Area&"',Door_City='"&Door_City&"',Locus_Area='"&Locus_Area&"',Locus_City='"&Locus_City&"',Stature="&Stature&",Tizhong="&Tizhong&",BirthYear="&BirthYear&",BirthMonth="&BirthMonth&",BirthDay="&BirthDay&",PersonPhone='"&PersonPhone&"',MsnQQ='"&MsnQQ&"',WebHome='"&WebHome&"',Appraise='"&Appraise&"',CodeId='"&CodeId&"',CodeType="&CodeType&",Mt='"&Mt&"',ZipCode='"&ZipCode&"',Address='"&Address&"' Where Perid='"&Perid&"'"
 Conn.Execute(SQL)
 
 SQL = "Update [pH_Person_Base] Set UserEmail='"&UserEmail&"',LastUpdate_Time=getdate() Where Perid='"&Perid&"'"
 Conn.Execute(SQL)
 

 '操作完成
 Response.write "<script language=JavaScript>alert('操作完成！');location.href='Web_Person_All.asp';</script>"

 CloseDB

 %>

