 
<!--#include file="../conn.asp"-->
 
<!--#include file="inc/Admin_Function.asp"-->
<!--#include file="../inc/Function.asp"-->

 
<%  

conn.execute("update [01387company]  set u_year=u_year+1, u_month=u_month+1, u_day=u_day+1")
conn.close
 
%>



<script language="javascript">
alert("��ҵ��Ϣ��ʾ�����Ѿ��ų���");
window.close();
</script>