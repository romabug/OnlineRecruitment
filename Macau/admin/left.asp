<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="inc/ShowMenu.js"></script>
<body bgcolor="#799ae1" leftmargin="0" topmargin="5" marginwidth="0" marginheight="0" scroll=yes>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="image/title.gif" width="158" height="38"></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25" background="image/title_bg_quit.gif"><table width="80%" border="0" cellpadding="0" cellspacing="0" class="12">
        <tr> 
          <td><div align="center"><a href="main.asp" target="mainFrame"><strong>������ҳ</strong></a> <strong>|</strong> 
              <a href="logout.asp" target="_parent"><strong>�˳�</strong></a></div>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25" background="image/admin_left_3.gif" onclick=showsubmenu(2)><table width="68%" border="0" cellpadding="0" cellspacing="0" class="12">
        <tr> 
          <td><div align="center"><strong><font color="#0033CC">��ҵ��Ա����</font></strong></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="25" id=submenu2><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d6dff7" class="t1">
        <tr> 
          <td height="5" colspan="2"> </td>
        </tr>
        <tr> 
          <td width="21%" height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td width="79%"><a href="CompanyList.asp" target="mainFrame">��ҵ��Ա�б�</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="ClosedRecord.asp" target="mainFrame">��ҵ��Ա�����¼</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="JobList.asp" target="mainFrame">����ְλ�б�</a></td>
        </tr>
       <!--
		<tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="JobListPart.asp" target="mainFrame">��ְ�б�</a></td>
        </tr>
		-->
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="ClosedRecordJob.asp" target="mainFrame">ְλ�����¼</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="CompanyOvertime.asp" target="mainFrame">���һ���µ��ڻ�Ա</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="CompanyOverRecord.asp" target="mainFrame">��Ա���ڴ����¼</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="CompanyReg.asp" target="mainFrame">��ҵ������ʽ��Ա</a></td>
        </tr>
      </table>
      <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="10"> </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25" background="image/admin_left_4.gif" onclick=showsubmenu(3)><table width="68%" border="0" cellpadding="0" cellspacing="0" class="12">
        <tr> 
          <td><div align="center"><strong><font color="#0033CC">���˻�Ա����</font></strong></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="25" id=submenu3><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d6dff7" class="t1">
        <tr> 
          <td height="5" colspan="2"> </td>
        </tr>
        <tr> 
          <td width="21%" height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td width="79%"><a href="PersonList.asp" target="mainFrame">���˻�Ա�б�</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="ApplyPro.asp" target="mainFrame">����߼��˲�</a></td>
        </tr>
      </table>
      <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="10"> </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" background="image/admin_left_1.gif" onclick=showsubmenu(0)><table width="68%" border="0" cellpadding="0" cellspacing="0" class="12">
      <tr>
        <td><div align="center"><strong><font color="#0033CC">�����ϴ�����</font></strong></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="25" id=submenu0><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d6dff7" class="t1">
      <tr>
        <td width="100%" height="5" colspan="2"></td>
      </tr>
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Adver_Right.asp" target="mainFrame">������</a></td>
      </tr>
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Vote.asp" target="mainFrame">��ҳͶƱ����</a></td>
      </tr>
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="AnnounceAdd.asp" target="mainFrame">������Ա����</a></td>
      </tr>
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Hr_add.asp" target="mainFrame">HR�����ϴ�</a></td>
      </tr>
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Services_add.asp" target="mainFrame">����ר��</a></td>
      </tr>
    </table>
        <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="10"></td>
          </tr>
      </table></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" background="image/admin_left_2.gif" onclick=showsubmenu(1)><table width="68%" border="0" cellpadding="0" cellspacing="0" class="12">
      <tr>
        <td><div align="center"><strong><font color="#0033CC">�ͻ��ύ��Ϣ</font></strong></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="25" id=submenu1><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d6dff7" class="t1">
      <tr>
        <td height="5" colspan="2"></td>
      </tr>
	  <!--
      <tr>
        <td width="21%" height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td width="79%"><a href="FreeList.asp" target="mainFrame">���ɼ�ְ��Ϣ</a></td>
      </tr>
	  -->
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Feedback.asp" target="mainFrame">Ͷ���������</a></td>
      </tr>
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Companyquick.asp" target="mainFrame">��ҵ����ע��ͨ��</a></td>
      </tr>
	  <!--
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="Entrust.asp" target="mainFrame">ί����Ƹ��Ϣ</a></td>
      </tr>-->
      <tr>
        <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
        <td><a href="KnowFrom.asp" target="mainFrame">��֪����;������</a></td>
      </tr>
    </table>
        <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="10"></td>
          </tr>
      </table></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25" background="image/admin_left_5.gif" onclick=showsubmenu(4)><table width="51%" border="0" cellpadding="0" cellspacing="0" class="12">
        <tr> 
          <td><div align="center"><strong><font color="#0033CC">ϵͳ����</font></strong></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="25" id=submenu4><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d6dff7" class="t1">
        <tr> 
          <td height="5" colspan="2"> </td>
        </tr>
		   <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="link/link_list.asp" target="mainFrame">�������ӹ���</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="link/add_link.asp" target="mainFrame">�����������</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="IpCount.asp" target="mainFrame">��ҳIP����ͳ��</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="NewPageCount.asp" target="mainFrame">ҳ������ͳ��</a></td>
        </tr>
        <tr> 
          <td width="21%" height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td width="79%"><a href="ManagerAdd.asp" target="mainFrame">��ӹ���Ա</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="LoginRecord.asp" target="mainFrame">��̨��¼��¼</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="ChangePwd.asp" target="mainFrame">�����޸�</a></td>
		  
        </tr>
      </table>
      <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="10"> </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
