<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Conn.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��ҵ��Աע��</title>
<style type="text/css">
<!--
.STYLE1 {color: #000000}
-->
</style>
</head>
<script  language="JavaScript" src="../js/Company_Register1.js"></script>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_reg.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td><table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="50%" height="75" valign="bottom"><img src="../Images/reg_01.gif" width="280" height="67"></td>
                <td width="50%" valign="bottom"><img src="../Images/reg1_2.gif" width="380" height="54"></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td> </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td> <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <form action="Register2.asp" name="reg" method="POST"  onSubmit="return check_reg();">
                <tr> 
                  <td height="31">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center"><textarea id=aonetncbox name=aonetncbox rows=10 wrap=VIRTUAL cols=94>��<%= Cls_WebName %>�û�����Э�顷

    <%= Cls_WebName %>���ṩ�ĸ�����������Ȩ�;�ӪȨ��<%= Cls_WebName %>��China <%= Cls_MainName %> Technology Co.LTD.����
    <%= Cls_WebName %>�ṩ�ķ������������Ƹ��λ�����̣�ͳ��ע�ṫ˾������ְ�ߣ�������Ϊ���������³���Э����Լ�����������ܸ�Э�飬���ܳ�Ϊ<%= Cls_Domain %>�Ļ�Ա����Э��һ������������Ч��<%= Cls_Domain %>�������±�Э�飬֮����֪ͨ��Ա��Ȩ�����������<%= Cls_Domain %>�����йر�Э����κθ��Ķ��ǲ��ɽ��ܵģ����������еĻ�Ա�ʸ�����񼴱�ȡ��;����<%= Cls_Domain %>��Ĭ��������Ϊ���ɶԱ�Э����ĵĽ��ܡ�

һ���û������������

1. �û�(��ְ��)

    ��ְ�߱���ͬ��ʹ��    <%= Cls_WebName %> ��ַ��<%= Cls_Domain %>�����ںϷ���Ŀ�ģ�Ҳ����˵����������ְ����ע����ְ�߿��԰Ѹ��˼���ͨ������վ��ֱ�ӷ��͸��ڱ���վ��ע��Ĺ�˾���ڴ�������£���ְ�߸��˼����Դ�����<%= Cls_Domain %>���ݿ��У�ֱ����ְ�߰Ѹ��˼���������ɾ��Ϊֹ�� <%= Cls_WebName %> ��������ְ�߸��˼��������޸ĵ�Ȩ����δ����ְ�ߵ���ɣ� <%= Cls_WebName %> �������ְ��Ա�ĸ��˼���ת�����κ�δ��ע���Ǳ�ڹ��������Ա���վ���û�Ա��ͨ��ʹ�ñ���վ�������漰������ʽ�ĵ������û���Ȩ��ѯ����ְ�ߵļ�Ҫ���ϣ����ܻ��ͨѶ��ʽ����������ְ��Ա��ͬ�� <%= Cls_WebName %> ���Բ��������������ΪӪ������;����ְ�߱������ȫ���е�������ע�ṫ˾�������û����͸����������γɵ�һ�з��ա� <%= Cls_WebName %> �����κι�˾���������Ƿ����й����ڣ�����ְ��֮������ɵ��κξ��ף��Ų�����

2. �û�(ע�ṫ˾)

    <%= Cls_WebName %> һ��ȷ���յ�ע�ṫ˾�������ط�����ã�ע�ṫ˾������ <%= Cls_WebName %> ��ʽ��Ա���ʸ�������һ���ض���ʱ�����ڱ���վ������Ƹ��Ϣ����ע�ṫ˾��Ȩ����<%= Cls_Domain %>���ݿ����ְλ��ѯ������ֹ���ô���Ȩ�����в�ѯ�˲������������;��ע�ṫ˾����ԶԵǼ���<%= Cls_Domain %>�ϼ���������ҳ���ϵ����ݵ���ȷ�Ը���<%= Cls_Domain %>������ע�ṫ˾���Ͻ����޸ĵ�Ȩ����<%= Cls_Domain %>�������ʵ���ʱ���ƶ��µķ����շѱ�׼��Ȩ����<%= Cls_Domain %>�Ծܾ������µ��շѱ�׼�Ĺ�˾�������ӻ�����ֹ�ù�˾��Ա�ʸ��Ȩ�������ң�����վ��������Ϊ�������κ���Ȩ�ͻ�����һ�����⳥��

3. �����ֹ����(��������ְ����ע�ṫ˾)

    ��ְ����ע�ṫ˾�Ͻ�ʹ�� <%= Cls_WebName %> ��ͼʵ����������֮Ŀ�ġ� 

������ְ�߲��ܵǼǣ����ʼģ�����ȫ�ġ���ٵĸ�����Ϣ�� 
������ְ����ͼ��ȡְλ��������ݣ����˵�λ��ͼ�õ���ְ�߸��˼��������������Ϣ�� 
�����κ��û�����ͨ����ӡ�����ء�������������ʽ���������û��Ŀɱ��ϵ���Ϣ��δ���ض��û�ͬ��������κβ��������ϸ��ֹ�� 
�����κ��û�����ɾ��������������˻�ʵ��Ǽǵ����ϡ�  
�����Ͻ��κ��û��ַ�����ͼ�ַ� <%= Cls_WebName %> ��վ�İ�ȫ�ԡ���������¼û�ж�����Ȩ����ķ��������ʺţ�����û�ж��俪�ŵı���վ���ݿ⣻��ͼ̽�����Ա���վ����ϵͳ�ı����㣻��ͼ���ű���վ���û��ṩ�ķ������û����Ͱ���������Ʒ�������֮���δ������û���ŵ�ĵ����ʼ����� <%= Cls_WebName %> ��վϵͳ�����簲ȫ����𺦻��ƻ������и��˻�ʵ�壬<%= Cls_WebName %>������׷���䷨�����Ρ� 
�����κ��û�����ʹ�� <%= Cls_WebName %> �����򴢴��κ�Υ�����÷��ɻ򷨹�����ϣ��������κ���ʽ�ַ�����ʵ��İ�Ȩ���̱�Ȩ����ҵ���ܻ�����֪ʶ��Ȩ�������ַ����˺������ڵ���˽��ȫ����ֹ�����κηǷ��ġ�ɧ���Եġ������Եġ������Եġ������Եġ��˺��ԡ�ӹ�׻��������Ϣ�� 

������Ȩ���̱�Ȩ��

��Ȩ��  <%= Cls_WebName %> ��վ��������ݰ���������ͼ�ꡢͼ�����֡�������ͼƬ��Ӱ������������ʼ���ȫ�����ݣ� <%= Cls_WebName %> ��վΪ�û��ṩ����ҵ��Ϣ��������Щ�����ܰ�Ȩ���̱꼰������ط��ɵı�����û�б���վ��ȷ��������׼���κθ��˻�ʵ�岻�����Ը��ƣ�������Щ���ݣ������������йص�������Ʒ��
�̱꣺ �ҵĹ��������̱꣨"<%= Cls_WebName %>"��"<%= Cls_Domain %>"������<%= Cls_WebName %>��China <%= Cls_MainName %> Technology Co.LTD.�� ���С����ҵĹ������������̱����ں��������С�δ���̱�����������κη��ˡ�������֯�����˲�������ʹ�á�
�������κ�����

    <%= Cls_WebName %>����ȫ����<%= Cls_Domain %>������;��ӵ�и���Ȩ��������վ�����û������Ͽ��Լ�������ı�����ݡ���������ȷ�ԣ����������ӵ�ҳ�桢���ݳе����Ρ�<%= Cls_Domain %>���κ��뱾��վ���ӵ���վ�����ݵ���ȷ�Բ��е��κ����Ρ� <%= Cls_WebName %> ����ŵ�ض��û����ض��������û�����κθ��˼�������Ƹ��Ϣ������ҳ�档 <%= Cls_WebName %> ����ŵ�ܹ������޴�����Ӫ������֤����������ܲ�����������е���ϵ����š�����û���ʹ�� <%= Cls_WebName %> ��վʱ�����Ҫά�ޡ������豸��ʧ���ݵ����������վ����Щ��ʧ���е��κ����Ρ��ͷ���������ķ�Χ�ڣ�����վ������ŵ�޻�е���ϣ�������ŵ��ʹ������Ȩ���ܵ��ֺ���������ŵ����վ���ݡ�����������ı���ͼ�����ӵȵ������ԡ���ȷ�ԡ��ɿ��ԡ������ԡ�

�ġ����˷�������

    �û�����ͬ����Գе����ڵ�¼ <%= Cls_WebName %> ��ͨ�� <%= Cls_WebName %> ��¼������վ����γɵ�ȫ�����ա������û������е������˽�����Ϣ������ӦƸ/��Ƹ��������ɵĺ��������˾�������û����͸���һ���û������ϵ���ʵ�ԡ���ȷ����ɿ��ԡ��û��������ܵ����ϵ����δ������˷��ա� <%= Cls_WebName %> һ�������κ���Υ����Э����ַ����ɵ���Ϊ����Ȩ���Ͻ�����û��Ļ�Ա�ʸ񼰽�ֹ���ٴε�¼����վ�� <%= Cls_WebName %> ����ɾ��һ�зǷ��ġ������Եļ������������ϵ�Ȩ����

�塢��  ��

    �����û����ŵ���Ϻ�ά�� <%= Cls_WebName %> ȫ���Ա�����棻��ŵ�� <%= Cls_WebName %> ��վ�����쵼�㡢��Ա�ʹ�����������������ϣ���ŵ�⳥������Υ����Э�鼰/��ʹ�ñ���վ����ɵĶ�������Ա���𺦡� <%= Cls_WebName %> ��������������⡢����֪�ջ򴫻������ʿ��

��������ŵ����

    ���κ�����£� <%= Cls_WebName %> �����쵼�ˡ����ܡ���Ա�ʹ����ܾ̾��������û�ʹ�ñ���վ�������ݻ���ʹ�ñ���վ����ɵ�һ����ʧ�ṩ�κε�����

�ߡ�������������

    �û��� <%= Cls_WebName %> ������������Ը��û��Ա���վ�ɽ�����߿���Ϊ�ޡ�

�ˡ����÷��ɺ͹�ϽȨ������

    ��Э������л����񹲺͹����ɽ��ͣ��û��� <%= Cls_WebName %> ˫�������������л����񹲺͹���˾����Ͻ���緢����Э������������л����񹲺͹�������ִ�ʱ������������ط������½��ͣ����������������ɱ��ֶ��û���������Ч����Ӱ�졣

    Ϊ���ṩ�����Ƶķ������ǽ���ʱ�ķ������ʼ������Ӻؿ�����Ѷ�������־��ע���û��������������������ʾ��ͬ���յ����ǵĵ����ʼ������Ӻؿ�����Ѷ�������־��</textarea></td>
                </tr>
                <tr> 
                  <td height="30"> <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td> </td>
                    </tr>
                    <tr>
                      <td><p>
                        <input id=agree type=checkbox checked value=Yes 
            name=agree>
                        ���������Ķ���ͬ�����������û�����Э��</p>
                          <p><strong 
            class=font14b STYLE1>��һ�� ע���ʺ�</strong>��˵��������<font 
            color=#ff0000>*</font>���ŵ�Ϊ�����<br>
                        </p></td>
                    </tr>
                  </table>
     </td>
                </tr>
                <tr> 
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="1">
                      <tr> 
                        <td bgcolor="#FFFFFF"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr bgcolor="#F3F3F3"> 
                              <td height="30" align="right"><font color="#FF0000">*</font> 
                                ѡ�������</td>
                              <td height="30">
							  <select name="cityid" id="cityid" style="width:120px;">
							  
                              <% 
							  Set Rs_m = Conn.Execute("Select Cityid,c_Name From [pH_Web_City] Where Flag=1 Order by c_Level Asc")
							  While Not Rs_m.Eof
							   Response.write "<option value="&Rs_m(0)&">"&Rs_m(1)&"</option>"
							   Rs_m.Movenext
							  Wend
							  Rs_m.Close
							   %>
							  </select>							  </td>
                              <td height="30"><font color="#CC0000"><font color="#999999">��ѡ�������ڵĵ���վ��</font></font></td>
                            </tr>
                            <tr> 
                              <td width="100" height="30" align="right"><font color="#FF0000">*</font> 
                                �û����ƣ�</td>
                              <td width="220" height="30"> <input name="username" type="text" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font><font color="#435049"> 
                                <input type="button" name="Submit22" value="����ʺ�"  onClick="checkAccount(document.reg.username.value)">
                                </font><font color="#999999"> </font></font></font></font></font><font color="#999999">Ӣ����ĸ�����ֻ��»��ߣ�4~20���ַ�</font><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font></font></font></font></font></td>
                            </tr>
                            <tr bgcolor="#F3F3F3"> 
                              <td width="100" height="30" align="right"><font color="#FF0000">*</font> 
                                �û����룺</td>
                              <td width="220" height="30"> <input name="password" type="password" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30"><font color="#CC0000"><font color="#999999">Ӣ����ĸ�����ֻ��»��ߣ�6λ���ϵ��ַ�</font></font></td>
                            </tr>
                            <tr> 
                              <td width="100" height="30" align="right"><font color="#FF0000">*</font> 
                                ȷ�����룺</td>
                              <td width="220" height="30"> <input name="password2" type="password" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30"><font color="#999999">��������������</font></td>
                            </tr>
                            <tr bgcolor="#F3F3F3"> 
                              <td width="100" height="30" align="right"><font color="#FF0000">*</font> 
                                ������ʾ��</td>
                              <td width="220" height="30"><span style="font-family: ����; font-size: 12px"><font color="#000000"> 
                                <input name="question" class="fieldtext" id="question" size="26" maxLength="50">
                              </font></span></td>
                              <td height="30"><font color="#999999">�磺����ϲ��ʲô��ɫ��</font></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right"><font color="#FF0000">*</font> 
                                ����𰸣�</td>
                              <td height="30"><span style="font-family: ����; font-size: 12px"><font color="#000000"> 
                                <input name="answer" class="fieldtext" id="answer" size="26" maxLength="50">
                                </font></span></td>
                              <td height="30"><font color="#999999">�磺��ɫ</font></td>
                            </tr>
                            <tr bgcolor="#F3F3F3"> 
                              <td height="30" align="right"><font color="#FF0000">*</font> 
                                �����ʼ���</td>
                              <td height="30"> <input name="mailbox" type="text" id="mailbox" size="26"></td>
                              <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font><font color="#435049"> 
                                <input name="Submit3" type="button" id="Submit3" value="�������" onClick="checkmailbox(document.reg.mailbox.value)">
                              </font><font color="#999999"> </font></font></font></font><font color="#999999">��׼ȷ��д����E-MAIL��ַ</font></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td align="center">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center"> <input type="submit" name="Submit" value="�� ʼ ע ��" style="height:30px;">                  </td>
                </tr>
              </Form>
            </table></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      <!--#include file="../Include/Footer.asp" -->
    </td>
  </tr>
</table>
</body>
</html>
