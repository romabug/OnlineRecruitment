<%
dim output,num,head
Function gen_key(digits)
output=Year(now())&Month(now())&day(now())&Minute(now())&Second(now())
gen_key=output
End Function
%>