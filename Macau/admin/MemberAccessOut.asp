<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="accessconn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call PowerCheck(3)
set rs=conn.execute("select username,uname,sex,birthday,address,tel,email,uid from [01387member] where password<>'123456' order by id")
do while not rs.eof
  mytype="个人会员"
  select case rs(2)
    case true
	sex="男"
	case false
	sex="女"
  end select
  age=datediff("yyyy",rs(3),date())+1
  conn1.execute("insert into member (myid,mytype,username,uname,sex,age,address,tel,email) values ('"&rs(7)&"','"&mytype&"','"&rs(0)&"','"&rs(1)&"','"&sex&"',"&age&",'"&rs(4)&"','"&rs(5)&"','"&rs(6)&"')")
rs.movenext
loop
rs.close
set rs=nothing
set rs=conn.execute("select username,contact,address,tel,email,cid from [01387company] where password<>'123456' order by id")
do while not rs.eof
  mytype="企业会员"
  conn1.execute("insert into member (myid,mytype,username,uname,sex,age,address,tel,email) values ('"&rs(5)&"','"&mytype&"','"&rs(0)&"','"&rs(1)&"','无',0,'"&rs(2)&"','"&rs(3)&"','"&rs(4)&"')")
rs.movenext
loop
rs.close
set rs=nothing
%>
