<% 
If Not IsArray(Session("School")) Then 
 Response.Redirect("../Public/MemberLogin.asp")
 Response.End()
End if

 %>
