<%
'//Session������
Session.Timeout = 30

'//��վͨ�ò���
Const Cls_WebName    = "�¼���������"
Const Cls_WebUrl     = "http://www.xjp-job.com"
Const Cls_DoMain     = "xjp-job.com"
Const Cls_MainName   = "xjp-job.com"
Const Cls_WebKey     = ""
Const Cls_WebJobs    = 15 '//�����ҵ��Ա��������ְλ��
Const Cls_PersonTopNumber = 10 '//���ø��˻�Ա�Ĺ̶���Ŀ
Const sCacheName     = "Ihost20070716"
Const Cls_Websub     = "www"
'//��վ����ϵ��ʽ
Const Cls_Phone      = "service@xjp-job.com"
Const Cls_QQ         = "312409431"
Const Cls_Msn        = "xjp-job@hotmail.com"
Const Cls_Email      = "service@xjp-job.com"
Const Cls_Fax        = "xjp-job@hotmail.com     QQ:312409431"
Const Cls_Address    = "�¼���������"
Const Cls_ZipCode    = "022001196"
Const Cls_Icp        = "ICP��0220870118��"

'//��վ�������
Const Cls_Mailname = "service@xjp-job.com"
Const Cls_Mailpass = "romabug"
Const Cls_Mailform = "service@xjp-job.com"
Const Cls_Mailsmtp = "117.21.248.205"



'//�����ʼ�����
Sub SendEmail(MailBox,MailBody,MailSubject)
  
  Set Jmail=server.createobject("Jmail.Message")
  Jmail.Charset = "gb2312"
  JMail.ContentType = "text/html"
  Jmail.Silent = true
  Jmail.Priority = 3
  Jmail.MailServerUserName = Cls_Mailname  '��Ч�����ʼ��ʺ�
  Jmail.MailServerPassword = Cls_Mailpass  '��Ч�����ʼ�����
  Jmail.From = Cls_Mailform    
  Jmail.FromName = Cls_WebName             '����
  Jmail.Subject = MailSubject              '�ʼ�����
  
  Jmail.AddRecipient  ""&MailBox&""        '�ռ��˵��ʼ���ַ  

  Jmail.Body = MailBody     '�ʼ�����       
  Jmail.Send(Cls_Mailsmtp)  'smtp��������ַ
  Set Jmail=nothing
End Sub

'//ѧ�������
Function Cls_Edus(Edus)
 Dim Edu_Str
 Select Case Edus
  Case 10: Edu_Str = "ְ��"
  Case 20: Edu_Str = "��ר"
  Case 30: Edu_Str = "�����еȼ���ѧ��"

 End Select
 Cls_Edus = Edu_Str
End Function

'//�Ա����
Function Cls_Sex(Sex)
 Dim Sex_Str
 If Sex = True Then
  Sex_Str = "��"
 Elseif Sex = False Then
  Sex_Str = "Ů"
 End if
 Cls_Sex = Sex_Str
End Function

'//����֤���������
Function Cls_CodeType(CodeType)
 Dim CodeType_Str
 Select Case CodeType
  Case 0
   CodeType_Str = "���֤"
  Case 1
   CodeType_Str = "�� ��"
  Case 2
   CodeType_Str = "����֤"
  Case 3
   CodeType_Str = "ѧ��֤"
  Case 4
   CodeType_Str = "����֤��"
 End Select
 Cls_CodeType = CodeType_Str
End Function

'//����״�����
Function Cls_Marry(Marry)
 Dim Marry_Str
 Select Case Marry
  Case 0
   Marry_Str = "����"
  Case 1
   Marry_Str = "δ��"
  Case 2
   Marry_Str = "�ѻ�"
  Case 3
   Marry_Str = "����"
 End Select
 Cls_Marry = Marry_Str
End Function

'//�����������
Function Cls_Works(Works)
 Dim Works_Str
 Select Case Works 
  Case 0: Works_Str = "һ������"
  Case 1: Works_Str = "һ������"
  Case 2: Works_Str = "��������"
  Case 3: Works_Str = "��������"
  Case 4: Works_Str = "��������"
  Case 5: Works_Str = "��������"
  Case 10: Works_Str = "ʮ������"
  Case 20: Works_Str = "��ʮ������"
  Case 30: Works_Str = "��ʮ������"
  Case 50: Works_Str = "������Ա"
 End Select
 Cls_Works = Works_Str
End Function

'//ְ�����
Function Cls_JobTitle(JobTitle)
 Dim JobTitle_Str
 Select Case JobTitle 
  Case 1: JobTitle_Str = "����ְ��"
  Case 2: JobTitle_Str = "�м�ְ��"
  Case 3: JobTitle_Str = "�߼�ְ��"
  Case 4: JobTitle_Str = "����"
 End Select
 Cls_JobTitle = JobTitle_Str
End Function

'//��ҵ�������
Function Cls_Properity(Properity)
 Dim Properity_Str
 Select Case Properity 
  Case 1: Properity_Str = "������ҵ"
  Case 2: Properity_Str = "������ҵ"
  Case 3: Properity_Str = "������ҵ"
  Case 4: Properity_Str = "˽Ӫ��ҵ"
  Case 5: Properity_Str = "��Ӫ��ҵ"
  Case 6: Properity_Str = "�ɷ�����ҵ"
  Case 7: Properity_Str = "������ҵ"
  Case 8: Properity_Str = "������ҵ"
  Case 9: Properity_Str = "������ҵ"
  Case 10: Properity_Str = "��������"
  Case 11: Properity_Str = "�������"
  Case 12: Properity_Str = "��ҵ��λ"
  Case 13: Properity_Str = "�����ҵ"
  Case 14: Properity_Str = "����"  
 End Select
 Cls_Properity = Properity_Str
End Function

'//��ҵ���
Function Cls_Industry(Industry)
 Dim Industry_Str
 Select Case Industry 
  Case 1: Industry_Str = "����������������"
  Case 2: Industry_Str = "�����ҵ����������ݿ⡢ϵͳ���ɣ�"
  Case 3: Industry_Str = "�����ҵ��Ӳ���������豸��"
  Case 4: Industry_Str = "���ӡ�΢���Ӽ���"
  Case 5: Industry_Str = "ͨѶ������ҵ"
  Case 6: Industry_Str = "�ҵ�ҵ"
  Case 7: Industry_Str = "��������(�ٻ������С�ר����)"
  Case 8: Industry_Str = "ó�ס����񡢽�����"
  Case 9: Industry_Str = "����"
  Case 10: Industry_Str = "��������Դ�����ҵ"
  Case 11: Industry_Str = "ʯ�͡�����ҵ"
  Case 12: Industry_Str = "���﹤�̡���ҩ������"
  Case 13: Industry_Str = "��е���졢�����豸���ع�ҵ"
  Case 14: Industry_Str = "������Ħ�г�"
  Case 15: Industry_Str = "�����Ǳ��繤�豸"
  Case 16: Industry_Str = "��桢���ء����"
  Case 17: Industry_Str = "ý�塢Ӱ�����������ų���"
  Case 18: Industry_Str = "�������Ļ�����"
  Case 19: Industry_Str = "��������Ʒ��ʳƷ�����ϡ����͡���ױƷ���̾ƣ�"
  Case 20: Industry_Str = "��֯Ʒҵ�����Ρ�Ь�ࡢ�ҷ���Ʒ��Ƥ�ߣ�"
  Case 21: Industry_Str = "��ѯҵ�����ʡ����ʦ�����ʦ�����ɣ�"
  Case 22: Industry_Str = "����ҵ��Ͷ�ʡ����ա�֤ȯ�����С�����"
  Case 23: Industry_Str = "���������ز�����ҵ����װ��"
  Case 24: Industry_Str = "���������֡��Ƶ�"
  Case 25: Industry_Str = "���䡢���������<"
  Case 26: Industry_Str = "����ҵ"
  Case 27: Industry_Str = "�칫�豸���Ļ�����������Ʒ���Ҿ���Ʒ"
  Case 28: Industry_Str = "ӡˢ����װ����ֽ"
  Case 29: Industry_Str = "���������졢�ӹ�"
  Case 30: Industry_Str = "��������ѵ������Ժ��"
  Case 31: Industry_Str = "ҽ�ơ���������������"
  Case 32: Industry_Str = "�˲Ž������н�"
  Case 33: Industry_Str = "Э�ᡢ���š�����������ҵ����������"
  Case 34: Industry_Str = "ũ���֡�����������ҵ"
  Case 35: Industry_Str = "����"  
 End Select
 Cls_Industry = Industry_Str
End Function

'//�����������
Function Cls_Language(Language)
 Dim Language_Str
 Select Case Language
  Case 1: Language_Str = "Ӣ��"
  Case 2: Language_Str = "����"
  Case 3: Language_Str = "����"
  Case 4: Language_Str = "����"
  Case 5: Language_Str = "��������"
  Case 6: Language_Str = "������"
  Case 7: Language_Str = "��������"
  Case 8: Language_Str = "����"
  Case 9: Language_Str = "�������"
  Case 10: Language_Str = "��������"
 End Select
 Cls_Language = Language_Str
End Function

'//��ͨ��ˮƽ
Function Cls_Mandarin(Mandarin)
 Dim Mandarin_Str
 Select Case Mandarin
  Case 1: Mandarin_Str = "��"
  Case 2: Mandarin_Str = "�ϲ�"
  Case 3: Mandarin_Str = "һ��"
  Case 4: Mandarin_Str = "��׼"  
 End Select
 Cls_Mandarin = Mandarin_Str
End Function

'//�����ˮƽ���
Function Cls_Computer(Computer)
 Dim Computer_Str
 Select Case Computer
  Case 1: Computer_Str = "����"
  Case 2: Computer_Str = "�м�"
  Case 3: Computer_Str = "�߼�"
  Case 4: Computer_Str = "��У�Ǽ����רҵ����"
  Case 5: Computer_Str = "��У�Ǽ����רҵ����(ƫ��)"
  Case 6: Computer_Str = "��У�Ǽ����רҵ����(ƫӲ)"
  Case 7: Computer_Str = "��������Ա"
  Case 8: Computer_Str = "����Ա"
  Case 9: Computer_Str = "�߼�����Ա"
  Case 10: Computer_Str = "ϵͳ����Ա"
  Case 11: Computer_Str = "�������Ա"
  Case 12: Computer_Str = "�������ʦ"
  Case 13: Computer_Str = "ȫ��������ȼ�����һ��"
  Case 14: Computer_Str = "ȫ��������ȼ����Զ���"
  Case 15: Computer_Str = "ȫ��������ȼ���������"
  Case 16: Computer_Str = "ȫ��������ȼ������ļ�"
  Case 17: Computer_Str = "΢����֤��Ʒר��(MCP)"
  Case 18: Computer_Str = "΢����֤ϵͳ����ʦ(MCSE)"
  Case 19: Computer_Str = "΢����֤��վ����ר��(MCP+Site Builder)"
  Case 20: Computer_Str = "΢����֤���ݿ����Ա(MCDBA)"
  Case 21: Computer_Str = "΢����֤����ר��(MCSD)"
  Case 22: Computer_Str = "Ciscoְҵ�ʸ���֤CCNA"
  Case 23: Computer_Str = "Ciscoְҵ�ʸ���֤CCDP"
  Case 24: Computer_Str = "Ciscoְҵ�ʸ���֤CCNP"
  Case 25: Computer_Str = "Ciscoְҵ�ʸ���֤CCIE"
  Case 26: Computer_Str = "Oracle8���ݿ����Ա"
  Case 27: Computer_Str = "Lotus�ʸ���֤"
  Case 28: Computer_Str = "Lotus-CLS�ʸ���֤"
  Case 29: Computer_Str = "Lotus-CLI�ʸ���֤"
  Case 30: Computer_Str = "NotesӦ�ÿ�������ʦ"
  Case 31: Computer_Str = "Notesϵͳ������ʦ"
  Case 32: Computer_Str = "Notes�߼�Ӧ�ÿ�������ʦ"
  Case 33: Computer_Str = "Notes�߼�ϵͳ������ʦ"
  Case 34: Computer_Str = "IBM-DB2 Database Administrator"
  Case 35: Computer_Str = "IBM-DB2 Application Developer"
  Case 36: Computer_Str = "IBM-MQSeries Engineer"
 End Select
 Cls_Computer = Computer_Str
End Function

'//�ɵ���ʱ�����
Function Cls_Posts(Posts)
 Dim Posts_Str
 Select Case Posts
  Case 10: Posts_Str = "������"
  Case 20: Posts_Str = "һ����"
  Case 30: Posts_Str = "������"
  Case 40: Posts_Str = "������"
  Case 50: Posts_Str = "һ������"
  Case 60: Posts_Str = "��������"
  Case 70: Posts_Str = "������"
  Case 80: Posts_Str = "һ����"
 End Select
 Cls_Posts = Posts_Str
End Function

'��Ч��
Function Cls_Valids(Valids)
 Dim Valid_str
 Select Case Valids
  Case 0:Valid_str = "������Ч"
  Case 3:Valid_str = "����"
  Case 7:Valid_str = "һ��"
  Case 14:Valid_str = "����"
  Case 30:Valid_str = "һ����"
  Case 60:Valid_str = "������"
  Case 90:Valid_str = "������"
  Case 180:Valid_str = "����"
  Case 365:Valid_str = "һ��"
 End Select 
 Cls_Valids = Valid_str
End Function


'//���˻�Ա�����
Function Cls_Usertype(Usertype)
 Dim Usertype_Str
 Select Case Usertype
  Case 1: Usertype_Str = "��ְ��Ա"
  Case 2: Usertype_Str = "��ҵ��Ա"
  Case 3: Usertype_Str = "Ӧ���ҵ��"
  Case 4: Usertype_Str = "��Уѧ��"
 End Select
 Cls_Usertype = Usertype_Str
End Function

'//ְλ������Ҫ�����
Function Cls_Age(Min,Max)
 Dim Age_Str
 If Min = 0 And Max = 0 Then
    Age_Str = "����"
 Elseif Min = 0 And Max <> 0 Then
    Age_Str = Max&"������"
 Elseif Min <> 0 And Max = 0 Then
    Age_Str = Min&"������"
 Else
    Age_Str = Min&"��-"&Max&"��"
 End if
 Cls_Age = Age_Str
End Function

'//�ж���ҵ��Ա�ܷ񷢲�ְλ
Function Cls_PublishJob_Flag(Vip,PublishCount)
 Dim Flag
 Select Case Vip
  Case 0
    If PublishCount >= Cls_WebJobs Then
     Flag = 0
	Else
     Flag = 1
	End if
  Case 1
    Flag = 1
  Case 2
    Flag = 0
 End Select
 Cls_PublishJob_Flag = Flag
End Function

'//��ҵ��Ƹְλ��״̬
Function Cls_JobFlag(JobFlag)
 Dim JobFlag_Str
 Select Case JobFlag
  Case 0:JobFlag_Str = "<font color=#ff0000>δ���</font>"
  Case 1:JobFlag_Str = "��Ƹ��"
  Case 2:JobFlag_Str = "<font color=#666666>������</font>"
 End Select
 Cls_JobFlag = JobFlag_Str
End Function

'//�ʽ��������
Function Cls_Currency(Currencys)
 Dim Currency_Str
 Select Case Currencys
  Case 1:Currency_Str = "�����"
  Case 2:Currency_Str = "��Ԫ"
  Case 3:Currency_Str = "ŷԪ"
  Case 4:Currency_Str = "Ӣ��"
  Case 5:Currency_Str = "�۱�"
  Case 6:Currency_Str = "̨��"
 End Select
 Cls_Currency = Currency_Str
End Function

'//��ҵVIP��Ա������
Function Cls_Vip_Level(Level)
 Dim Level_Str
 Select Case Level
  Case 1:Level_Str = "һ����"
  Case 2:Level_Str = "������"
  Case 3:Level_Str = "������"
  Case 4:Level_Str = "�ĸ���"
  Case 5:Level_Str = "�����"
  Case 6:Level_Str = "������"
  Case 9:Level_Str = "�Ÿ���"
  Case 12:Level_Str = "һ��"
  Case 24:Level_Str = "����"
  Case 36:Level_Str = "����"
 End Select
 Cls_Vip_Level = Level_Str
End Function


'//Ա���������
Function Cls_Workers(Workers)
 Dim Workers_Str
 Select Case Workers
  Case 9:Workers_Str = "10������"
  Case 49:Workers_Str = "10��50��"
  Case 199:Workers_Str = "50��200��"  
  Case 499:Workers_Str = "200��500��"  
  Case 999:Workers_Str = "500��1000��"  
  Case 1000:Workers_Str = "1000������"    
 End Select
 Cls_Workers = Workers_Str
End Function

'//ְλ�������
Function Cls_JobType(JobType)
 Dim JobType_Str
 Select Case JobType
  Case 1:JobType_Str = "ȫְ"
  Case 2:JobType_Str = "��ְ"
  Case 3:JobType_Str = "У԰��Ƹ"
 End Select
 Cls_JobType = JobType_Str
End Function
'//��ȡԺУ����
Function Cls_SchoolType(Sch_Property)
 Dim SchoolType
 Select Case Sch_Property
  Case 10:SchoolType = "�ߵ�ԺУ"
  Case 20:SchoolType = "��רѧУ"
  Case 30:SchoolType = "ְҵ��У"
  Case 40:SchoolType = "��ѵ����"
  Case 50:SchoolType = "����"
 End Select
 Cls_SchoolType = SchoolType
End Function

'//��ȡ��ѵ��������
Function Cls_EducateType(Sch_Property)
 Dim SchoolType
 Select Case Sch_Property
  Case 10:SchoolType = "������ҵ"
  Case 20:SchoolType = "��Ӫ��ҵ"
  Case 30:SchoolType = "���̶�����ҵ"
  Case 40:SchoolType = "������ҵ"
  Case 50:SchoolType = "�ɷ�����ҵ"
  Case 60:SchoolType = "������ҵ"
  Case 70:SchoolType = "��ҵ��λ"
  Case 80:SchoolType = "�������"
  Case 90:SchoolType = "��������"
  Case 100:SchoolType = "�������"
  Case 110:SchoolType = "�ߵ�ԺУ"
   
 End Select
 Cls_EducateType = SchoolType
End Function

Function Cls_Valid(Valid)
 Dim Valid_str
 Select Case Valid
  Case 0:Valid_str = "��������"
  Case 7:Valid_str = "һ����"
  Case 15:Valid_str = "�����"
  Case 30:Valid_str = "һ����"
  Case 60:Valid_str = "������"
  Case 90:Valid_str = "������"
  Case 180:Valid_str = "����"
 End Select 
 Cls_Valid = Valid_str
End Function


'//��ҳ����
Function Cls_Page(FileName,PageNo,PCount,RCount)
 Dim Page_Str
 Page_Str = "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""1"" class=""text01"">"
 Page_Str = Page_Str&"<tr><td width=""50%"">����"&RCount&"����¼ | ��"&PCount&"ҳ��ʾ</td>"
 Page_Str = Page_Str&"<td align=""right"">"
 If PageNo > 1 Then
  Page_Str = Page_Str&"<a href="""&FileName&"?PageNo=1"" class=""a4"">��ҳ</a> "
  Page_Str = Page_Str&"<a href="""&FileName&"?PageNo="&PageNo-1&""" class=""a4"">��ҳ</a> "
 Else
  Page_Str = Page_Str&"<font color=#666666>��ҳ</font> "
  Page_Str = Page_Str&"<font color=#666666>��ҳ</font> "
 End if 
 Page_Str = Page_Str&"<"&PageNo&"> "  
 If PageNo < PCount Then
  Page_Str = Page_Str&"<a href="""&FileName&"?PageNo="&PageNo+1&""" class=""a4"">��ҳ</a> "
  Page_Str = Page_Str&"<a href="""&FileName&"?PageNo="&PCount&""" class=""a4"">βҳ</a> "
 Else
  Page_Str = Page_Str&"<font color=#666666>��ҳ</font> "
  Page_Str = Page_Str&"<font color=#666666>βҳ</font> "
 End if 
 Page_Str = Page_Str&"</td></tr></table>"

 Cls_Page = Page_Str
End Function

Function Cls_Page2(FileName,PageNo,PCount,RCount)
 Dim Page_Str
 Page_Str = "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""1"" class=""text01"">"
 Page_Str = Page_Str&"<tr><td width=""50%"">����"&RCount&"����¼ | ��"&PCount&"ҳ��ʾ</td>"
 Page_Str = Page_Str&"<td align=""right"">"
 If PageNo > 1 Then
  Page_Str = Page_Str&"<a href="""&FileName&"&PageNo=1"" class=""a4"">��ҳ</a> "
  Page_Str = Page_Str&"<a href="""&FileName&"&PageNo="&PageNo-1&""" class=""a4"">��ҳ</a> "
 Else
  Page_Str = Page_Str&"<font color=#666666>��ҳ</font> "
  Page_Str = Page_Str&"<font color=#666666>��ҳ</font> "
 End if 
 Page_Str = Page_Str&"<"&PageNo&"> "  
 If PageNo < PCount Then
  Page_Str = Page_Str&"<a href="""&FileName&"&PageNo="&PageNo+1&""" class=""a4"">��ҳ</a> "
  Page_Str = Page_Str&"<a href="""&FileName&"&PageNo="&PCount&""" class=""a4"">βҳ</a> "
 Else
  Page_Str = Page_Str&"<font color=#666666>��ҳ</font> "
  Page_Str = Page_Str&"<font color=#666666>βҳ</font> "
 End if 
 Page_Str = Page_Str&"</td></tr></table>"

 Cls_Page2 = Page_Str
End Function

'//���ɻ�Ա�ı���ַ���
Dim output,num
Function gen_key(digits)
 Dim char_array(50)
 char_array(0) = "0"
 char_array(1) = "1"
 char_array(2) = "2"
 char_array(3) = "3"
 char_array(4) = "4"
 char_array(5) = "5"
 char_array(6) = "6"
 char_array(7) = "7"
 char_array(8) = "8"
 char_array(9) = "9"
 char_array(10) = "a"
 char_array(11) = "b"
 char_array(12) = "c"
 char_array(13) = "d"
 char_array(14) = "e"
 char_array(15) = "f"
 char_array(16) = "g"
 char_array(17) = "h"
 char_array(18) = "i"
 char_array(19) = "j"
 char_array(20) = "k"
 char_array(21) = "l"
 char_array(22) = "m"
 char_array(23) = "n"
 char_array(24) = "o"
 char_array(25) = "p"
 char_array(26) = "q"
 char_array(27) = "r"
 char_array(28) = "s"
 char_array(29) = "t"
 char_array(30) = "u"
 char_array(31) = "v"
 char_array(32) = "w"
 char_array(33) = "x"
 char_array(34) = "y"
 char_array(35) = "z"
 randomize
 do while len(output) < digits
  num = char_array(Int((35 - 0 + 1) * Rnd + 0))
  output = output + num
 loop
 gen_key = output
End Function
'//���������ļ���
Function Makefilename(Fname)
  Fname = Year(Now()) &  Month(Now()) & Day(Now()) & Hour(Now()) & Minute(Now()) & Second(Now())
  Makefilename = Fname & ".html"
End Function

'//���¿γ�
Function Cls_Lesson_New(Lists,Length)
 'Lists     ��ʾ����Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" LessonName,Ncid,Schid From [pH_Educate_Lesson] Where Flag=1 Order By Ncid Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">��<a href=""../Educate/Info/Lesson.asp?Schid="&Tmp(2,i)&"&Param="&Tmp(1,i)&""" target=""_blank"">"&Title&"</a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Lesson_New = NewList
End Function

'//���¿γ� (��վ)
Function Cls_Lesson_New_City(Lists,Length,Cityid)
 'Lists     ��ʾ����Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" l.LessonName,l.Ncid,l.Schid From [pH_Educate_Lesson] As l Inner Join [pH_Educate_Base] As b On l.Schid=b.Schid Where l.Flag=1 And b.Cityid="&Cityid&" Order By l.Ncid Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">��<a href=""../Educate/Info/Lesson.asp?Schid="&Tmp(2,i)&"&Param="&Tmp(1,i)&""" target=""_blank"">"&Title&"</a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Lesson_New_City = NewList
End Function

'//�γ̷����б�(����ʾ ������Ϣ)
Function Cls_Lesson_List(TypeNames,Lists,Length)
 'TypeNames    �������
 'Lists     ��ʾ����Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Ncid,Schid,LessonName From [pH_Educate_Lesson] Where Properity Like '%"&TypeNames&"%' And Flag=1 Order By Ncid Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(2,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">��<a href=""../Educate/Info/Lesson.asp?Schid="&Tmp(1,i)&"&Param="&Tmp(0,i)&""" target=""_blank"">"&Title&"</a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Lesson_List = NewList
End Function

'//�γ̷����б�(��վ)
Function Cls_Lesson_List_City(TypeNames,Lists,Length,Cityid)
 'TypeNames    �������
 'Lists     ��ʾ����Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Ncid,Schid,LessonName From [pH_Educate_Lesson] Where Properity Like '%"&TypeNames&"%' And Flag=1 And Schid In (Select Schid From [pH_Educate_Base] Where Cityid="&c_City&") Order By Ncid Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(2,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">��<a href=""../Educate/Info/Lesson.asp?Schid="&Tmp(1,i)&"&Param="&Tmp(0,i)&""" target=""_blank"">"&Title&"</a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Lesson_List_City = NewList
End Function


'//���ŵ��б�
Function Cls_News_List(Typeid,Lists,Length)
 'Typeid    ���ID
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">��<a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_News_List = NewList
End Function

'//��Ѷ���б�(����ʾ ������Ϣ)
Function Cls_Hr_List(Typeid,Lists,Length)
 'Typeid    ���ID
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">��<a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Hr_List = NewList
End Function

'//��Ѷ���б� (��վ)
Function Cls_Hr_List_City(Typeid,Lists,Length,Cityid)
 'Typeid    ���ID
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 And Cityid="&Cityid&" Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">��<a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Hr_List_City = NewList
End Function

'//ְҵָ�����б�
Function Cls_Train_List(Typeid,Lists,Length)
 'Typeid    ���ID
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""2"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22""><img src=../Images/Person/icon11.gif> <a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Train_List = NewList
End Function

'//ְҵָ�����б� (��վ)
Function Cls_Train_List_City(Typeid,Lists,Length,Cityid)
 'Typeid    ���ID
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""2"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 And Cityid="&Cityid&" Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22""><img src=../Images/Person/icon11.gif> <a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Train_List_City = NewList
End Function


'//HR��Ѷ��ҳ�ڵ��б�
Function Cls_Hrindex_List(Typeid,Lists,Length)
 'Typeid    ���ID
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""2"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22""><img src=../Images/Company/icon11.gif> <a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Hrindex_List = NewList
End Function

'//HR��Ѷ��ҳ�ڵ��б� (��վ)
Function Cls_Hrindex_List_City(Typeid,Lists,Length,Cityid)
 'Typeid    ���ID
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""2"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 And Cityid="&Cityid&" Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22""><img src=../Images/Company/icon11.gif> <a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Hrindex_List_City = NewList
End Function


'//��Ѷ���ĵ��б�
Function Cls_Info_List(Typeid,Lists,Length)
 'Typeid    ���ID
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&" <li> <a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""> "&Title&" </a></li>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 
 Cls_Info_List = NewList
End Function


'//��Ѷ���ĵ��б�ǰ�����
Function Cls_Info_List2(Typeid,Lists,Length)
 'Typeid    ���ID
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&" <li><a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""> "&Title&" </a></li>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 
 Cls_Info_List2 = NewList
End Function



 


'//��Ѷ���ĵ��б�
Function Cls_Info_List_City(Typeid,Lists,Length,Cityid)
 'Typeid    ���ID
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""2"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 And Cityid="&Cityid&" Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22""><img src=../Images/Info/icon11.gif> <a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Info_List_City = NewList
End Function

'//�ö����ŵ��б�(��Ŀ¼�ļ���ʾ)
Function Cls_News_Top_Root(Typeid,Lists,Length)
 'Typeid    ���ID
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 And Topall=1 Order By NewId Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">��<a href="""&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_News_Top_Root = NewList
End Function


'//���ŵ��б�(��Ŀ¼�ļ���ʾ)
Function Cls_News_List_Root(Typeid,Lists,Length)
 'Typeid    ���ID
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By NewId Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">��<a href="""&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_News_List_Root = NewList
End Function


'//���Ż����Ƽ����ŵ��б�
Function Cls_News_Param(Param,Lists,Length)
 'Param     ��ѯ����
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList,Param_Str
 Param_Str = Replace_Text(Param)
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where "&Param_Str&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">��<a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 NewList = NewList&"</table>"
 Cls_News_Param = NewList
End Function

'//���Ż����Ƽ����ŵ��б� (��վ)
Function Cls_News_Param_City(Param,Lists,Length,Cityid)
 'Param     ��ѯ����
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList,Param_Str
 Param_Str = Replace_Text(Param)
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where "&Param_Str&" And Flag=1 And Cityid="&Cityid&" Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">��<a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 NewList = NewList&"</table>"
 Cls_News_Param_City = NewList
End Function


'//ְλ����ҳ -- ������Ѷ
Function Cls_News_City(City,Lists,Length)
 'Lists     ��ʾ��������Ŀ
 'Length    ��ʾ�����ֳ���
 Dim NewList
 NewList = "<table width=""98%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where City='"&City&"' And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;û�������Ϣ...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22""><img src=""../Images/Search/arrow_home.gif"" width=""12"" height=""16""><a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">������Ϣ</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_News_City = NewList
End Function


Function CreateVote(ID,Title,VoteText,Mtype)
	Dim Result,Content,i
	Content=split(VoteText,"|")
	Result="<Table Width=100% ><Form action=../Public/vote.asp method=post target=_blank><tr><td>"&Title&"</td></tr>"
	
	IF Mtype=False Then
		For i=0 To Ubound(Content)
			Result=Result&"<tr><td>"
			Result=Result&"<input type='radio' name='vote' value="&i&">&nbsp;"&Content(i)
			Result=Result&"</td></tr>"
		Next
	End if

	If Mtype=True Then
	For i=0 To Ubound(Content)
			Result=Result&"<tr><td>"
			Result=Result&"<input type='checkbox' name='vote' value="&i&">&nbsp;&nbsp;&nbsp;"&Content(i)
			Result=Result&"</td></tr>"
		Next
	End if
	
	Result=Result&"<tr><td align=center><input name=VoteType type=hidden value="&Mtype&"><input name=VoteID type=hidden value="&ID&"><input type=submit name=submit value=ͶƱ class=LoginInput> <input type=button name=view value=�鿴 class=LoginInput onclick=window.open('../Public/vote.asp?VoteID="&ID&"','_blank','scrollbars=yes,width=645,height=320')></td></tr>"
	Result=Result&"</Form></Table>"
	CreateVote=Result
End Function

'//��֯��Ա������
Function Cls_Ncidstr(Ncid)
 Dim Ncidstr
 If Len(Ncid) > 5 Then
  Ncidstr = Ncid
 Else
 Select Case Len(Ncid)
  Case 1: Ncidstr = "0000"&Ncid
  Case 2: Ncidstr = "000"&Ncid
  Case 3: Ncidstr = "00"&Ncid
  Case 4: Ncidstr = "0"&Ncid
  Case 5: Ncidstr = Ncid  
 End Select
 End if
 Cls_Ncidstr = Ncidstr
End Function


'//--------------------------ѧ��Լ��--------------------------------
'//Edus
'// 10 Сѧ
'// 20 ����
'// 30 ����
'// 40 ��ר
'// 50 ��ר
'// 60 ����
'// 70 ˶ʿ
'// 80 ��ʿ
'// 90 ��ʿ��
'//--------------------------��ҵ������ҵԼ��--------------------------------
'//  <option value="1">����������������</option>
'//  <option value="2">�����ҵ����������ݿ⡢ϵͳ���ɣ�</option>
'//  <option value="3">�����ҵ��Ӳ���������豸��</option>
'//  <option value="4">���ӡ�΢���Ӽ���</option>
'//  <option value="5">ͨѶ������ҵ</option>
'//  <option value="6">�ҵ�ҵ</option>
'//  <option value="7">��������(�ٻ������С�ר����)</option>
'//  <option value="8">ó�ס����񡢽�����</option>
'//  <option value="9">����</option>
'//  <option value="10">��������Դ�����ҵ</option>
'//  <option value="11">ʯ�͡�����ҵ</option>
'//  <option value="12">���﹤�̡���ҩ������</option>
'//  <option value="13">��е���졢�����豸���ع�ҵ</option>
'//  <option value="14">������Ħ�г�</option>
'//  <option value="15">�����Ǳ��繤�豸</option>
'//  <option value="16">��桢���ء����</option>
'//  <option value="17">ý�塢Ӱ�����������ų���</option>
'//  <option value="18">�������Ļ�����</option>
'//  <option value="19">��������Ʒ��ʳƷ�����ϡ����͡���ױƷ���̾ƣ�</option>
'//  <option value="20">��֯Ʒҵ�����Ρ�Ь�ࡢ�ҷ���Ʒ��Ƥ�ߣ�</option>
'//  <option value="21">��ѯҵ�����ʡ����ʦ�����ʦ�����ɣ�</option>
'//  <option value="22">����ҵ��Ͷ�ʡ����ա�֤ȯ�����С�����</option>
'//  <option value="23">���������ز�����ҵ����װ��</option>
'//  <option value="24">���������֡��Ƶ�</option>
'//  <option value="25">���䡢���������</option>
'//  <option value="26">����ҵ</option>
'//  <option value="27">�칫�豸���Ļ�����������Ʒ���Ҿ���Ʒ</option>
'//  <option value="28">ӡˢ����װ����ֽ</option>
'//  <option value="29">���������졢�ӹ�</option>
'//  <option value="30">��������ѵ������Ժ��</option>
'//  <option value="31">ҽ�ơ���������������</option>
'//  <option value="32">�˲Ž������н�</option>
'//  <option value="33">Э�ᡢ���š�����������ҵ����������</option>
'//  <option value="34">ũ���֡�����������ҵ</option>
'//  <option value="35">����</option>

'//--------------------------��ҵ����Լ��--------------------------------
'//  <option value="1">������ҵ</option>
'//  <option value="2">������ҵ</option>
'//  <option value="3">������ҵ</option>
'//  <option value="4">˽Ӫ��ҵ</option>
'//  <option value="5">��Ӫ��ҵ</option>
'//  <option value="6">�ɷ�����ҵ</option>
'//  <option value="7">������ҵ</option>
'//  <option value="8">������ҵ</option>
'//  <option value="9">������ҵ</option>
'//  <option value="10">��������</option>
'//  <option value="11">�������</option>
'//  <option value="12">��ҵ��λ</option>
'//  <option value="13">�����ҵ</option>
'//  <option value="14">����</option>

'//--------------------------�ʽ�Լ��--------------------------------
'//  <option value="1">�����</option>
'//  <option value="2">��Ԫ</option>
'//  <option value="3">ŷԪ</option>
'//  <option value="4">Ӣ��</option>
'//  <option value="5">�۱�</option>
'//  <option value="6">̨��</option>

'//--------------------------Ա������Լ��--------------------------------
'//  <OPTION value=9>10������</OPTION>
'//  <OPTION value=49>10��50��</OPTION>
'//  <OPTION value=199>50��200��</OPTION>
'//  <OPTION value=499>200��500��</OPTION>
'//  <OPTION value=999>500��1000��</OPTION>
'//  <OPTION value=1000>1000������</OPTION>

'//--------------------------ԺУ����Լ��--------------------------------
'//  <option value="10">�ߵ�ԺУ</option>
'//  <option value="20">��רѧУ</option>
'//  <option value="30">ְҵ��У</option>
'//  <option value="40">��ѵ����</option>
'//  <option value="50">����</option>

'//--------------------------��������Լ��--------------------------------
'//  <option value="0">һ������</option>
'//  <option value="1">һ������</option>
'//  <option value="2">��������</option>
'//  <option value="3">��������</option>
'//  <option value="4">��������</option>
'//  <option value="5">��������</option>
'//  <option value="10">ʮ������</option>
'//  <option value="20">��ʮ������</option>
'//  <option value="30">��ʮ������</option>
'//  <option value="50">������Ա</option>

'//--------------------------��������Լ��--------------------------------
'//  <option  value="1">Ӣ��</option>
'//  <option  value="2">����</option>
'//  <option  value="3">����</option>
'//  <option  value="4">����</option>
'//  <option  value="5">��������</option>
'//  <option  value="6">������</option>
'//  <option  value="7">��������</option>
'//  <option  value="8">����</option>
'//  <option  value="9">�������</option>
'//  <option  value="10">��������</option>

'//--------------------------��ͨ��ˮƽԼ��-------------------------------- 
'//  <option value="4">��׼</option>
'//  <option value="3">һ��</option>
'//  <option value="2">�ϲ�</option>
'//  <option value="1">��</option>

'//--------------------------�����ˮƽԼ��-------------------------------- 
'//  <OPTION value=1>����</OPTION>
'//  <OPTION value=2>�м�</OPTION>
'//  <OPTION value=3>�߼�</OPTION>
'//  <OPTION value=4>��У�Ǽ����רҵ����</OPTION>
'//  <OPTION value=5>��У�Ǽ����רҵ����(ƫ��)</OPTION>
'//  <OPTION value=6>��У�Ǽ����רҵ����(ƫӲ)</OPTION>
'//  <OPTION value=7>��������Ա</OPTION>
'//  <OPTION value=8>����Ա</OPTION>
'//  <OPTION value=9>�߼�����Ա</OPTION>
'//  <OPTION value=10>ϵͳ����Ա</OPTION>
'//  <OPTION value=11>�������Ա</OPTION>
'//  <OPTION value=12>�������ʦ</OPTION>
'//  <OPTION value=13>ȫ��������ȼ�����һ��</OPTION>
'//  <OPTION value=14>ȫ��������ȼ����Զ���</OPTION>
'//  <OPTION value=15>ȫ��������ȼ���������</OPTION>
'//  <OPTION value=16>ȫ��������ȼ������ļ�</OPTION>
'//  <OPTION value=17>΢����֤��Ʒר��(MCP)</OPTION>
'//  <OPTION value=18>΢����֤��վ����ר��(MCP+Site Builder)</OPTION>
'//  <OPTION value=19>΢����֤ϵͳ����ʦ(MCSE)</OPTION>
'//  <OPTION value=20>΢����֤���ݿ����Ա(MCDBA)</OPTION>
'//  <OPTION value=21>΢����֤����ר��(MCSD)</OPTION>
'//  <OPTION value=22>Ciscoְҵ�ʸ���֤CCNA</OPTION>
'//  <OPTION value=23>Ciscoְҵ�ʸ���֤CCDP</OPTION>
'//  <OPTION value=24>Ciscoְҵ�ʸ���֤CCNP</OPTION>
'//  <OPTION value=25>Ciscoְҵ�ʸ���֤CCIE</OPTION>
'//  <OPTION value=26>Oracle8���ݿ����Ա</OPTION>
'//  <OPTION value=27>Lotus�ʸ���֤</OPTION>
'//  <OPTION value=28>Lotus-CLS�ʸ���֤</OPTION>
'//  <OPTION value=29>Lotus-CLI�ʸ���֤</OPTION>
'//  <OPTION value=30>NotesӦ�ÿ�������ʦ</OPTION>
'//  <OPTION value=31>Notesϵͳ������ʦ</OPTION>
'//  <OPTION value=32>Notes�߼�Ӧ�ÿ�������ʦ</OPTION>
'//  <OPTION value=33>Notes�߼�ϵͳ������ʦ</OPTION>
'//  <OPTION value=34>IBM-DB2 Database Administrator</OPTION>
'//  <OPTION value=35>IBM-DB2 Application Developer</OPTION>
'//  <OPTION value=36>IBM-MQSeries Engineer</OPTION>

'//--------------------------����λʱ��Լ��-------------------------------- 
'//  <option  value="10">������</option>
'//  <option  value="20">һ����</option>
'//  <option  value="30">������</option>
'//  <option  value="40">������</option>
'//  <option  value="50">һ������</option>
'//  <option  value="60">��������</option>
'//  <option  value="70">������</option>
'//  <option  value="80">һ����</option>               
 %>
