<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../CSS/css_offices.css" type=text/css rel=stylesheet>
<%
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"202") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Dim Atcion
Atcion=Request.QueryString ("atcion")
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%"  cellpadding="0" cellspacing="0" align="center"  background="Images/top11_bg.jpg" style="padding-top:3px;">
  <tr> 
	    
    <td width="100%" height="22" valign="middle">&nbsp;<a href="?"><font color=ffffff><strong>������ҳ</strong></font></a><strong> 
      <font color=ffffff> | </font><a href="?atcion=add"><font color=ffffff>����ͶƱ</font></a></strong></td>
	</tr>
</table>
<br>
<%
Select Case Atcion
Case "add"
	Call Add
Case "save"
	Call Save
Case "del"
	Call Del
Case "lock"
	Call Locker
Case "unlock"
	Call UnLocker
Case Else
	Call Main
End Select

Sub Main
	Dim Count,PageCount,Page,OutStr,i
	Dim FieldName(1),FieldValue(1)
	Dim TopicList
	
	Page=Request.QueryString ("page")
	If Not IsNumeric(Page) Or Page="" Or Page="0" Then
		Page=1
	End If
%>
<table width="100%" border="0" align="center" cellspacing="1" bgcolor="A5B6CC">
  <tr> 
    <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" class=TableBorder>
        <tr align="center" valign="middle" bgcolor="f5f5f5" height="22"> 
          <td width="10%">Id</td>
          <td width="40%">ͶƱ����</td>
          <td width="10%">ͶƱ����</td>
          <td width="10%">����</td>
          <td width="10%">״̬</td>
          <td width="20%">����</td>
        </tr>
        <%
	SQL="select count(id) from pH_Vote"
	Set rs=conn.execute(sql)
	Count=rs(0)
	If Count=<0 Then 
		OutStr="<tr height='22' bgcolor='ffffff' width='98%'>"
		OutStr=OutStr&"<td colspan='5'>&nbsp;<font color='red'>��������</font></td>"
		OutStr=OutStr&"</tr></table>"
		response.write OutStr
		response.flush
	Else
		SQL="select top "&Page*Cint(10)&" id,title,votetotal,type,lock from pH_Vote order by id desc"
		
		
		'Response.Write sql
		Set rs=conn.execute(sql)
		
		If Cint(Page) <>1 Then rs.move Cint(10)*(page-1)
		
		TopicList=rs.getrows(Cint(10))
		rs.close:Set rs=Nothing
	
	    For i=0 To Ubound(TopicList,2)
		Typestr = TopicList(3,i)
		If Typestr=False Then
		  Typestr = "����"
		Else
		  Typestr = "����"
		End if
		Lockstr = TopicList(4,i)
		If Lockstr=False Then
		  Lockstr = "����"
		Else
		  Lockstr = "����"
		End if		
  %>
        <tr align="center" valign="middle" bgcolor="f5f5f5" height="22"> 
          <td><%=TopicList(0,i)%></td>
          <td align="left"><a href="#" onclick="window.open('../vote.asp?VoteID=<%=TopicList(0,i)%>','_blank')"><%=TopicList(1,i)%></a></td>
          <td><%=TopicList(2,i)%></td>
          <td><%=Typestr%></td>
          <td><%=Lockstr%></td>
          <td><a href="?atcion=add&postid=<%=TopicList(0,i)%>">�༭</a> 
            | 
            <%If TopicList(4,i) Then%>
            <a href="?atcion=unlock&postid=<%=TopicList(0,i)%>" onclick="{if(confirm('ȷ��������ͶƱ��?')){return true;}return false;}"><font color=green>����</font></a> 
            | 
            <%Else%>
            <a href="?atcion=lock&postid=<%=TopicList(0,i)%>" onclick="{if(confirm('ȷ��������ͶƱ��?')){return true;}return false;}"><font color=red>����</font></a> 
            | 
            <%End If%>
            <a href="?atcion=del&postid=<%=TopicList(0,i)%>" onclick="{if(confirm('ȷ��ɾ����?')){return true;}return false;}">ɾ��</a></td>
        </tr>
        <%	Next%>
        <tr align="right" valign="middle" bgcolor="f5f5f5"> 
          <td height="22" colspan="6">&nbsp; 
            <%Response.Write PageList(Cint(10),Count,Page,FieldName,FieldValue)%>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
<%	End If
End Sub

Sub Add
	Dim PostId
	Dim Title,Typer,VoteText
	PostId=Request.QueryString ("postid")
	If IsNumeric(PostId) And PostId<>"" And PostId<>"0" Then
		Sql="select id,title,type,votetext,votetotal from [pH_Vote] where id="&PostId
		Set rs=conn.execute(sql)
		If Not rs.eof And Not rs.bof Then 
			Title=rs(1)
			Typer=rs(2)
			VoteText=rs(3)
			If rs(4)<>0 Then 
				ErrMsg="�Բ���ͶƱ�ѿ�ʼ�������޸ģ�"
				Call Error(1)
			End If
		End If
		rs.close
		Set rs=Nothing
	End If
%>
<script>
function change(obj,i) {
he=parseInt(obj.style.height);
if (he>=130&&he<=400)
   obj.style.height=he+i+'px';
else 
   obj.style.height='130px';
}
</script>
<table width="100%" border="0" align="center" cellspacing="1" bgcolor="A5B6CC">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" align="center" class=TableBorder>
        <form name=a1  method="post" action="?atcion=save&postID=<%=postid%>">
          <tr align="center" valign="middle" bgcolor="f5f5f5"> 
            <td height="22" colspan="2">ͶƱ</td>
          </tr>
          <tr valign="middle" bgcolor="f5f5f5"> 
            <td width="25%" align="center">����</td>
            <td align="left">&nbsp; 
              <textarea name="caption" cols="40" wrap="VIRTUAL"><%=Title%></textarea></td>
          </tr>
          <tr valign="middle" bgcolor="f5f5f5"> 
            <td width="25%" align="center">ͶƱ��Ŀ<br>
              <br>
              <LI>ÿ��һ��ͶƱ��Ŀ�����<B>10</B>�� 
              <LI>�����Զ����ϣ������Զ�����<BR>
                <BR>
                <input type="radio" name="type" value="0"<%If Not Typer Then %> checked <%End If%>>
                ��ѡͶƱ&nbsp;
                <input type="radio" name="type" value="1" <%If Typer Then %> checked <%End If%>>
                ��ѡͶƱ</td>
            <td align="left">&nbsp; 
              <textarea name="vote" wrap="VIRTUAL" rows="10" cols="40"><%=replace(VoteText,"|",chr(13)&chr(10))%></textarea>
              <br>
              &nbsp;<a href="javascript:change(document.all.vote,-20)"><img src="images/minus.gif" border=0 title="��С�ı���"></a>&nbsp;&nbsp;<a href="javascript:change(document.all.vote,20)"><img src="images/plus.gif" border=0 title="�Ŵ��ı���"></a></td>
          </tr>
          <tr bgcolor="f5f5f5"> 
            <td colspan="2" align="center" valign="middle"> 
              <input type="submit" name="Submit" value="����">
              &nbsp;
              <input type="reset" name="Submit2" value="����"></td>
          </tr>
        </form>
      </table></td>
  </tr>
</table>
<%End Sub

Function Save
	If Not ChkPost Then 
	    Response.Write("�Բ����벻Ҫ���ⲿ�ύ���ݣ�")
		Response.End()
	End If
	
	Dim title,votetype,vote,vote_1,votenum
	Dim j,i,k
	Dim PostId
	
	PostId=Request.QueryString ("postid")
	votetype=request.Form("type")
	vote=trim(replace(request.Form("vote"),"|",""))
	
	if votetype="" or vote="" then 
	    Response.Write("�Բ�������д�������ϣ�")
		Response.End()
	end if
	
	vote=split(vote,chr(13)&chr(10))
	title=HTMLEncode(Request.Form ("caption"))
	j=0
	
	for i = 0 to ubound(vote)
		if not (vote(i)="" or vote(i)=" ") then
			vote_1=""&vote_1&""&vote(i)&"|"
			j=j+1
		end if	
	next

	for k = 1 to j
		votenum=""&votenum&"0|"
	next

	votenum=left(votenum,len(votenum)-1)
	vote=left(vote_1,len(vote_1)-1)
	
	If IsNumeric(PostId) And PostId<>"" And PostId<>"0" Then
		Sql="update pH_Vote set title='"&Title&"',votetext='"&Vote&"',type="&votetype&" where id="&PostId
	Else
		Sql="insert into pH_Vote (title,type,votetext,votenum,lock) values ('"&Title&"',"&votetype&",'"&Vote&"','"&VoteNum&"',0)"
	End If
	'Response.Write sql
	conn.execute(sql)
	
	CloseDB
	Response.Redirect "Web_Vote.asp"
End Function

Function Del
	If Not ChkPost Then 
	    Response.Write("�Բ����벻Ҫ���ⲿ�ύ���ݣ�")
		Response.End()
	End If
	
	Dim PostId
	PostId=Request.QueryString ("postid")
	If IsNumeric(PostId) And PostId<>"" And PostId<>"0" Then
		sql="delete from [pH_Vote] where ID="&PostId
		conn.execute(sql)
	End If
	Response.Redirect Request.ServerVariables("HTTP_REFERER")
End Function

Function Locker
	If Not ChkPost Then 
	    Response.Write("�Բ����벻Ҫ���ⲿ�ύ���ݣ�")
		Response.End()
	End If
	
	Dim PostId
	PostId=Request.QueryString ("postid")
	If IsNumeric(PostId) And PostId<>"" And PostId<>"0" Then
		sql="update pH_Vote set lock=1 where id="&PostId
		conn.execute(sql)
	End If
	Response.Redirect Request.ServerVariables("HTTP_REFERER")
End Function

Function UnLocker
	If Not ChkPost Then 
	    Response.Write("�Բ����벻Ҫ���ⲿ�ύ���ݣ�")
		Response.End()
	End If
	
	Dim PostId
	PostId=Request.QueryString ("postid")
	If IsNumeric(PostId) And PostId<>"" And PostId<>"0" Then
		sql="update pH_Vote set lock=0 where id="&PostId
		conn.execute(sql)
	End If
	Response.Redirect Request.ServerVariables("HTTP_REFERER")
End Function
%>

