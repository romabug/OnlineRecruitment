<%
dim MaxPerPage
MaxPerPage=20
dim text,checkpage
text="0123456789"
 Rs1.PageSize=MaxPerPage
for i=1 to len(request("page"))
   checkpage=instr(1,text,mid(request("page"),i,1))
   if checkpage=0 then
      exit for 
   end if
next

If checkpage<>0 then
      If NOT IsEmpty(request("page")) Then
        CurrentPage=Cint(request("page"))
        If CurrentPage < 1 Then CurrentPage = 1
        If CurrentPage > Rs1.PageCount Then CurrentPage = Rs1.PageCount
      Else
        CurrentPage= 1
      End If
      If not Rs1.eof Then Rs1.AbsolutePage = CurrentPage end if
Else
   CurrentPage=1
End if
%>