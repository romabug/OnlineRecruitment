<!--#include file="../conn.asp"-->
<!--#include file="../personadmin/inc/random.asp"-->

<%	

uid=request("uid")
cid=request.cookies("01387job")("cid")
jid=request.form("jid")

'response.Write jid
'response.End

if uid="" then
	response.Write"<script language=javascript>alert('请选择人才！');"
	response.write"window.close();</SCRIPT>"
	response.end()
	end if

if request.form("company_message")="" then
response.Write"<script language=javascript>alert('请输入应聘通知内容！');"
response.write"window.close();</SCRIPT>"
response.end()
end if

set rs2=conn.execute("select id,company_message from [01387applylist] where jid='"&jid&"' and uid='"&uid&"' and cid='"&cid&"' and status<>4")

if not rs2.eof then

		if rs2(1)<>"" then
		response.Write"<script language=javascript>alert('该职位对该人才已经发送过面试通知！');"
		response.write"window.close();</SCRIPT>"
		response.end()
		
		else
		conn.execute("update [01387applylist] set company_message='"&replace(replace(request.form("company_message"),chr(32),"&nbsp;"),chr(13),"<br>")&"',status='3',replytime='"&date()&"' where id="&rs2(0)&"")
		response.Write"<script language=javascript>alert('操作成功！');"
		response.write"window.close()</SCRIPT>"
		response.end()
		rs2.close
		set rs2=nothing
		end if

else
conn.execute("insert into [01387applylist] (applyid,jid,cid,uid,status,company_message,replytime) values ('"&gen_key(7)&"','"&jid&"','"&cid&"','"&uid&"','3','"&replace(replace(request.form("company_message"),chr(32),"&nbsp;"),chr(13),"<br>")&"','"&date()&"')")
response.Write"<script language=javascript>alert('操作成功！');"
response.write"window.close();</SCRIPT>"
response.end()
end if


'
%>
