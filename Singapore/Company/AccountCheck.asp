<!--#include file="../Include/Class_Conn.asp" -->

<% 
dim action,values,rs
action=replace_text(request.querystring("action"))
values=replace_text(request.querystring("value"))
set rs=server.createobject("ADODB.recordset")
select case action
 case "cusername"
  call cusername()  '//����Ա�û���
 case "cmailbox"
  call cmailbox()   '//��������ַ
end select

sub cusername()
 rs.open "select username from [pH_Company_Base] where username='"&values&"'",conn,1,1
 if rs.eof then
  rs.close
  set rs=nothing
  closedb
  response.write "<b>��ϲ��������ʹ������û���</b>"
  response.write "<script>alert('-��ϲ��������ʹ������û���-');window.close();</script>"
  response.End()
 else
  rs.close
  set rs=nothing
  closedb
  response.write "<b>��Ǹ��������ʹ������û���</b>"
  response.write "<script>alert('-��Ǹ��������ʹ������û���-');window.close();</script>"
  response.End()

 end if
end sub

sub cmailbox()
 rs.open "select Email from [pH_Company_Base] where Email='"&values&"'",conn,1,1
 if rs.eof then
  rs.close
  set rs=nothing
  closedb
  response.write "<b>������û�б�ʹ�ã�����ע�ᣡ</b>"
  response.write "<script>alert('-������û�б�ʹ�ã�����ע�ᣡ-');window.close();</script>"
  response.End()
 else
  rs.close
  set rs=nothing
  closedb
  response.write "<b>�������Ѿ���ʹ�ã�����ע�ᣡ</b>"
  response.write "<script>alert('-�������Ѿ���ʹ�ã�����ע�ᣡ-');window.close();</script>"
  response.End()

 end if

end sub
 %>
