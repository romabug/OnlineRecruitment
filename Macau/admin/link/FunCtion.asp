<%
'----------------------------------------------------------------------
'	�������ܣ�����ֹ�ӣѣ�ע��
'	�Ρ���������StrValue �û��ύ������
'				BloType  ��������
'   �� �� ֵ:   true ��ֵ������
'               false �ַ�������
'----------------------------------------------------------------------
function FunSQL(StrValue,BloType)
	if BloType then
		if Isnumeric(StrValue) then
			StrValue=Clng(StrValue)
		else
			StrValue=0
		end if
	else
		if not isnull(StrValue) then
			StrValue=lcase(StrValue)
			StrValue=Replace(StrValue,"'","''")
			StrValue=replace(StrValue,"select","")
			StrValue=replace(StrValue,"update","")
			StrValue=replace(StrValue,"insert","")
			StrValue=replace(StrValue,"delete","")
			StrValue=replace(StrValue,";","")
			StrValue=replace(StrValue," ","")
			StrValue=replace(StrValue,chr(255),"")
			StrValue=replace(StrValue,"*","")
			StrValue=replace(StrValue,"%","")
		end if
	end if
	FunSQL=StrValue
end function
'--------------------------------------------------------------------------
'	�������ܣ���ͨ�÷�ҳ
'	��    ��:   Intpagecount����ҳ��
'				Intmypage  ��ǰҳ��
'				Intrecordcount  ��¼����
'				Intpagesize ÿҳ��ʾ�ļ�¼��
'				StrValue  ��ַ������ֵ					
'--------------------------------------------------------------------------
function FunPage(Intpagecount,Intmypage,Intrecordcount,Intpagesize,StrValue)
	 on error resume next
	 dim Intfor,Intlist,intlist_b
	 if intmypage>1 then
		 funpage=funpage & "<a class=he href='?page=1" & StrValue & "' title='��ǰҳ' ><font face='Webdings'>9</font></a>&nbsp;"
		 funpage=funpage&"<a class=he href='?page="&Intmypage-1 & StrValue & "' title='��һҳ' ><font face='Webdings'>7</font></a>"
	 else
		 funpage=funpage &"<font face='Webdings'>9</font>"
	 	 funpage=funpage&"<font face='Webdings'>7</font>"
	 end if
	 if Intlist<>0 then
		 if cintmypage= Intlist then
			Intlist=Intlist+5		
		 end if
	  else
	  	Intlist=Intmypage+5
	  end if
	  if intlist-9<1 then
	     intlist_b=1
	  else
	  	 intlist_b=intlist-9
	  end if		
	  for Intfor=intlist_b to Intlist          
	 	 if intfor<=Intpagecount then              
		 	 if intfor=Intmypage then       '-------ʹ��ǰҳ����Ϊ��ɫ�������ɵ��
				 funpage =funpage & strMode&" <font color='#FF0000'><b>"& Intfor & "</b></font>"
			 else
				 funpage=funpage & strMode &" <a class=he href='?page=" & Intfor & StrValue & "' >" & Intfor & "</a>"
			 end if
		 end if
		 strMode=" <font color='#BBBBBB'>|</font> "
	  next
	  if intmypage<intpagecount then
	  	funpage=funpage&" <a class=he href='?page="& Intmypage+1 & StrValue & "' title='��һҳ'><font face='Webdings'>8</font></a>&nbsp;"
	    funpage=funpage &"<a class=he href='?page="& Intpagecount & StrValue & "' title='���ҳ' ><font face='Webdings'>:</font></a>"
	  else
	  	funpage=funpage&" <font face='Webdings'>8</font>"	
	    funpage=funpage &"<font face='Webdings'>:</font></a>"
	  end if
	  funpage="<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr>"&_ 
				vbcrlf&"<td width='50%'>��ǰ��"&Intmypage&"ҳ ��"&Intpagesize&"��/ҳ ����"&Intpagecount&"ҳ/"&Intrecordcount&"����¼</td>"&_
				vbcrlf&"<td width='50%' align='right'>"&_
				vbcrlf&"<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr>"&_
					  vbcrlf&"<td align='right'><font face=""Arial, Helvetica, sans-serif"">"&funpage&"</font></td>"&_
				  vbcrlf&"</tr></table></td></tr>"&_
			  vbcrlf&"</table>"
	  if err.number<>0 then
	 	err.clear	
		response.redirect("Error.asp?err=��ҳ���������������Ա��ϵ��|")
	  end if
end function
'--------------------------------------------------------------------------
'	�������ܣ�����������ת��
'	��    ��:   _Type����������
'				_Value  ����
'	�� �� ֵ:   _Type  1 :  ת������ֵ������
'               _Type  2 :  ת�����ַ�������
'               _Type  3 :  ת���ɲ���������				
'--------------------------------------------------------------------------
function FunSwitch(Value_,Type_)
on error resume next
	select case Type_
		case 1
		if isnumeric(Value_) then
			if not isnull(Value_) then
				FunSwitch=clng(Value_)
			else
				FunSwitch=0
			end if
		else
			FunSwitch=0
		end if
		case 2
			if not isnull(Value_) then
				FunSwitch=cstr(Value_)
			else
				FunSwitch=""
			end if
		case 3
			if not isnull(Value_) and isnumeric(Value_) then
				FunSwitch=cbool(Value_)
			else
				FunSwitch=false
			end if
		case else
			response.redirect("Error.asp?err=��ָ�� FunSwitch ��Ҫת�ﻻ�ɵ��������ͣ�")
	end select
if err.number<>0 then
	response.redirect("Error.asp?err=����ת��ʱ����δ֪����")
	err.clear
end if
end function
'----------------------------------------------------------------------
'	�������ܣ����жϷ�����֧�ֵ����
'	��    ����  strobj,alt
'   �� �� ֵ��  strobj:һ�����������
'				alt: �Ƿ��������̵���ʾ							
'----------------------------------------------------------------------
function FunisoBject(strobj,alt)
on error resume next
	if alt then
		FunisoBject="<font color='red'><b>��</b></font>"
	else
		FunisoBject=false
	end if
	dim obj
	set obj=server.createobject(strobj) 
	if err=0 then
		if alt then
			FunisoBject="<b>��</b>"
		else
			FunisoBject=true
		end if
		set obj=nothing
	end if
	err=0
end function
'----------------------------------------------------------------------
'	�������ܣ����Ե�ǰ����ת���ļ���
'	��    ����  ��
'----------------------------------------------------------------------
function FunFileName()
	FunFileName=now()
	FunFileName=replace(FunFileName,"-","")
	FunFileName=replace(FunFileName,":","")
	FunFileName=replace(FunFileName," ","")
	FunFileName=replace(FunFileName,"/","")
	FunFileName=replace(FunFileName,"����","")
	FunFileName=replace(FunFileName,"����","")
end function
''----------------------------------------------------------------------
'	�������ܣ�����֤�������Ƿ������ⲿ
'	��    ����  ��
'----------------------------------------------------------------------
function checkfrom()
	server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
	server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
	if mid(server_v1,8,len(server_v2))<>server_v2 then
		checkfrom=true
	else
		checkfrom=false
	end if
end function
''----------------------------------------------------------------------
'	�������ܣ���JS��ʾ��
'	��    ����  StrURL   :  ���ȷ���󷵻ص���ҳ���ַ
'				StrMSG   :  �Ի������ʾ��Ϣ

'----------------------------------------------------------------------
Function FunMsg(StrURL,StrMSG)
	Response.write "<script language='javascript'>"&_
		Vbcrlf&"alert("""&StrMSG&""");"&_
		Vbcrlf&"window.location="""&StrURL&""";"&_
		Vbcrlf&"</script>"
End Function

%>