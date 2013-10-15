<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Conn.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 企业会员注册</title>
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
                  <td align="center"><textarea id=aonetncbox name=aonetncbox rows=10 wrap=VIRTUAL cols=94>《<%= Cls_WebName %>用户服务协议》

    <%= Cls_WebName %>所提供的各项服务的所有权和经营权归<%= Cls_WebName %>（China <%= Cls_MainName %> Technology Co.LTD.）。
    <%= Cls_WebName %>提供的服务仅适用于招聘单位或广告商（统称注册公司）和求职者，三方行为必须受以下陈述协议制约，如若不接受该协议，则不能成为<%= Cls_Domain %>的会员，该协议一经接受立即生效。<%= Cls_Domain %>保留更新本协议，之后再通知会员的权利。如果您对<%= Cls_Domain %>声明有关本协议的任何更改都是不可接受的，这样您享有的会员资格与服务即被取消;否则<%= Cls_Domain %>将默认您的行为构成对本协议更改的接受。

一、用户服务基本条款

1. 用户(求职者)

    求职者必须同意使用    <%= Cls_WebName %> 网址：<%= Cls_Domain %>仅用于合法的目的，也就是说，仅用于求职。已注册求职者可以把个人简历通过本网站或直接发送给在本网站已注册的公司。在此种情况下，求职者个人简历仍储存在<%= Cls_Domain %>数据库中，直至求职者把个人简历从其中删除为止。 <%= Cls_WebName %> 保留对求职者个人简历进行修改的权利。未经求职者的许可， <%= Cls_WebName %> 不会把求职人员的个人简历转发给任何未经注册的潜在雇主，但对本网站试用会员或通过使用本网站搜索引擎及其他方式的第三方用户有权查询到求职者的简要资料（不能获得通讯方式）。但是求职人员须同意 <%= Cls_WebName %> 可以采用其个人资料作为营销的用途。求职者必须独自全部承担由于向注册公司或其他用户发送个人资料所形成的一切风险。 <%= Cls_WebName %> 对于任何公司（不管它是否在中国境内）与求职者之间所造成的任何纠纷，概不负责。

2. 用户(注册公司)

    <%= Cls_WebName %> 一经确认收到注册公司所须的相关服务费用，注册公司即享有 <%= Cls_WebName %> 正式会员的资格，允许在一段特定的时间内在本网站发布招聘信息。已注册公司有权进入<%= Cls_Domain %>数据库进行职位查询，但禁止利用此项权利进行查询人才以外的其他用途。注册公司须独自对登记在<%= Cls_Domain %>上及其他链接页面上的内容的正确性负责。<%= Cls_Domain %>保留对注册公司资料进行修改的权力。<%= Cls_Domain %>保留在适当的时候制订新的服务收费标准的权力。<%= Cls_Domain %>对拒绝接受新的收费标准的公司，保留延缓或中止该公司会员资格的权利，而且，本网站的这种行为不构成任何侵权和豁免于一切损害赔偿。

3. 明令禁止条款(适用于求职者与注册公司)

    求职者与注册公司严禁使用 <%= Cls_WebName %> 试图实现以下所列之目的。 

　－求职者不能登记（或邮寄）不完全的、虚假的个人信息。 
　－求职者试图获取职位以外的内容；用人单位试图得到求职者个人简历以外的其他信息。 
　－任何用户不得通过打印、下载、拷贝或其他方式再造其他用户的可辨认的信息。未经特定用户同意的上述任何操作都被严格禁止。 
　－任何用户不得删除或更改其他个人或实体登记的资料。  
　－严禁任何用户侵犯或试图侵犯 <%= Cls_WebName %> 网站的安全性。包括：登录没有对其授权进入的服务器或帐号；进入没有对其开放的本网站数据库；试图探测或测试本网站及其系统的薄弱点；试图干扰本网站对用户提供的服务；向用户发送包括促销产品广告或服务之类的未经相关用户允诺的电子邮件。对 <%= Cls_WebName %> 网站系统或网络安全造成损害或破坏的所有个人或实体，<%= Cls_WebName %>将依法追究其法律责任。 
　－任何用户不得使用 <%= Cls_WebName %> 传发或储存任何违反适用法律或法规的资料；不得以任何形式侵犯其他实体的版权、商标权、商业秘密或其他知识产权；不得侵犯个人和社会大众的隐私安全；禁止传输任何非法的、骚扰性的、中伤性的、辱骂性的、恐吓性的、伤害性、庸俗或淫秽的信息。 

二、版权、商标权等

版权：  <%= Cls_WebName %> 网站定义的内容包括：所有图标、图表、文字、声音、图片、影像、软件；电子邮件的全部内容； <%= Cls_WebName %> 网站为用户提供的商业信息。所有这些内容受版权、商标及其他相关法律的保护。没有本网站明确的书面批准，任何个人或实体不能擅自复制，再造这些内容，或创造与内容有关的派生产品。
商标： 我的工作网的商标（"<%= Cls_WebName %>"、"<%= Cls_Domain %>"）属于<%= Cls_WebName %>（China <%= Cls_MainName %> Technology Co.LTD.） 所有。与我的工作网合作的商标属于合作者所有。未经商标所有者许可任何法人、其他组织、个人不得擅自使用。
三、责任和义务

    <%= Cls_WebName %>无需全天监控<%= Cls_Domain %>的运作;但拥有该项权利。本网站所有用户必须认可自己所输入的表格、内容、简历的正确性；独立对链接的页面、内容承担责任。<%= Cls_Domain %>对任何与本网站链接的网站的内容的正确性不承担任何责任。 <%= Cls_WebName %> 不承诺特定用户或特定数量的用户浏览任何个人简历、招聘信息或链接页面。 <%= Cls_WebName %> 不承诺能够长期无错误运营；不保证其服务器免受病毒或其他机械故障的侵扰。如果用户在使用 <%= Cls_WebName %> 网站时造成需要维修、更换设备或丢失数据的情况，本网站对这些损失不承担任何责任。就法律所允许的范围内，本网站放弃承诺无机械故障；放弃承诺免使第三方权利受到侵害；放弃承诺本网站内容、服务、软件、文本、图像、链接等的适用性、精确性、可靠性、完整性。

四、个人风险条款

    用户必须同意独自承担由于登录 <%= Cls_WebName %> 或通过 <%= Cls_WebName %> 登录到其他站点而形成的全部风险。所有用户独立承担与他人交流信息及发送应聘/招聘意向所造成的后果。本公司不担保用户发送给另一方用户的资料的真实性、精确性与可靠性。用户对所接受的资料的信任纯属个人风险。 <%= Cls_WebName %> 一经发现任何有违反本协议或侵犯法律的行为，有权马上解除该用户的会员资格及禁止其再次登录本网站。 <%= Cls_WebName %> 保留删除一切非法的、辱骂性的及不健康的资料的权力。

五、赔  偿

    所有用户须承诺保障和维护 <%= Cls_WebName %> 全体成员的利益；承诺对 <%= Cls_WebName %> 网站及其领导层、雇员和代理商免受索赔和诉讼；承诺赔偿由于其违反本协议及/或使用本网站而造成的对上述人员的损害。 <%= Cls_WebName %> 将尽快对上述索赔、诉讼知照或传唤相关人士。

六、不承诺条款

    在任何情况下， <%= Cls_WebName %> 及其领导人、主管、雇员和代理商拒绝对由于用户使用本网站及其内容或不能使用本网站而造成的一切损失提供任何担保。

七、有限责任条款

    用户对 <%= Cls_WebName %> 提出的索赔金额以该用户对本网站缴交的最高款项为限。

八、适用法律和管辖权限条款

    本协议服从中华人民共和国法律解释；用户与 <%= Cls_WebName %> 双方都必须遵守中华人民共和国的司法管辖。如发生本协议相关条款与中华人民共和国法律相抵触时，则该条款将按相关法律重新解释，而其他条款则依旧保持对用户产生法律效力和影响。

    为了提供更完善的服务，我们将定时寄发电子邮件、电子贺卡、资讯或电子杂志给注册用户，若您接受项服务款，即表示您同意收到我们的电子邮件、电子贺卡、资讯或电子杂志。</textarea></td>
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
                        我已认真阅读并同意遵守以上用户服务协议</p>
                          <p><strong 
            class=font14b STYLE1>第一步 注册帐号</strong>（说明：带“<font 
            color=#ff0000>*</font>”号的为必填项）<br>
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
                                选择地区：</td>
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
                              <td height="30"><font color="#CC0000"><font color="#999999">请选择您所在的地区站点</font></font></td>
                            </tr>
                            <tr> 
                              <td width="100" height="30" align="right"><font color="#FF0000">*</font> 
                                用户名称：</td>
                              <td width="220" height="30"> <input name="username" type="text" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font><font color="#435049"> 
                                <input type="button" name="Submit22" value="检测帐号"  onClick="checkAccount(document.reg.username.value)">
                                </font><font color="#999999"> </font></font></font></font></font><font color="#999999">英文字母、数字或下划线，4~20个字符</font><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font></font></font></font></font></td>
                            </tr>
                            <tr bgcolor="#F3F3F3"> 
                              <td width="100" height="30" align="right"><font color="#FF0000">*</font> 
                                用户密码：</td>
                              <td width="220" height="30"> <input name="password" type="password" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30"><font color="#CC0000"><font color="#999999">英文字母、数字或下划线，6位以上的字符</font></font></td>
                            </tr>
                            <tr> 
                              <td width="100" height="30" align="right"><font color="#FF0000">*</font> 
                                确认密码：</td>
                              <td width="220" height="30"> <input name="password2" type="password" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30"><font color="#999999">请重新输入密码</font></td>
                            </tr>
                            <tr bgcolor="#F3F3F3"> 
                              <td width="100" height="30" align="right"><font color="#FF0000">*</font> 
                                密码提示：</td>
                              <td width="220" height="30"><span style="font-family: 宋体; font-size: 12px"><font color="#000000"> 
                                <input name="question" class="fieldtext" id="question" size="26" maxLength="50">
                              </font></span></td>
                              <td height="30"><font color="#999999">如：您最喜欢什么颜色？</font></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right"><font color="#FF0000">*</font> 
                                问题答案：</td>
                              <td height="30"><span style="font-family: 宋体; font-size: 12px"><font color="#000000"> 
                                <input name="answer" class="fieldtext" id="answer" size="26" maxLength="50">
                                </font></span></td>
                              <td height="30"><font color="#999999">如：蓝色</font></td>
                            </tr>
                            <tr bgcolor="#F3F3F3"> 
                              <td height="30" align="right"><font color="#FF0000">*</font> 
                                电子邮件：</td>
                              <td height="30"> <input name="mailbox" type="text" id="mailbox" size="26"></td>
                              <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font><font color="#435049"> 
                                <input name="Submit3" type="button" id="Submit3" value="检测邮箱" onClick="checkmailbox(document.reg.mailbox.value)">
                              </font><font color="#999999"> </font></font></font></font><font color="#999999">请准确填写您的E-MAIL地址</font></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td align="center">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center"> <input type="submit" name="Submit" value="开 始 注 册" style="height:30px;">                  </td>
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
