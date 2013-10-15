<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="NewPageCount.asp">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">全 
          站 页 面 流 量 统 计</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="31%" height="30"><div align="right">输入时间： </div></td>
      <td width="69%" height="30"><input name="mydate" type="text" class="input" id="mydate" size="30" value="<%=date()%>"> 
        <font color="#FF3300"><strong>(时间格式：<font face="Geneva, Arial, Helvetica, sans-serif">2005-9-16</font>)</strong></font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" colspan="2"><div align="center"> 
          <input name="Submit" type="submit" style="width=130;height=30;font-size=12px" value="确 定 查 看">
        </div></td>
    </tr>
  </form>
  <form name="form2" method="post" action="NewPageMonth.asp">
    <tr bgcolor="#f1f3f5"> 
      <td height="26" colspan="2"><div align="center"><strong><font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif">2005年每月页面流量统计折线图</font><font face="Verdana, Arial, Helvetica, sans-serif">　　</font><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <select name="myyear" id="myyear">
            <option value="2005">2005</option>
            <option value="2006" selected>2006</option>
            <option value="2007">2007</option>
          </select>
          年 
          <select name="mymonth" id="mymonth">
            <option value="1" <%if month(date())=1 then response.Write("selected")%>>1</option>
            <option value="2" <%if month(date())=2 then response.Write("selected")%>>2</option>
            <option value="3" <%if month(date())=3 then response.Write("selected")%>>3</option>
            <option value="4" <%if month(date())=4 then response.Write("selected")%>>4</option>
            <option value="5" <%if month(date())=5 then response.Write("selected")%>>5</option>
            <option value="6" <%if month(date())=6 then response.Write("selected")%>>6</option>
            <option value="7" <%if month(date())=7 then response.Write("selected")%>>7</option>
            <option value="8" <%if month(date())=8 then response.Write("selected")%>>8</option>
            <option value="9" <%if month(date())=9 then response.Write("selected")%>>9</option>
            <option value="10" <%if month(date())=10 then response.Write("selected")%>>10</option>
            <option value="11" <%if month(date())=11 then response.Write("selected")%>>11</option>
            <option value="12" <%if month(date())=12 then response.Write("selected")%>>12</option>
          </select>
          月 
          <input name="Submit2" type="submit" style="width=80;height=20;font-size=12px" value="查 看">
          </font></strong></div></td>
    </tr>
  </form>
</table>
