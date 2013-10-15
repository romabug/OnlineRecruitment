<% 
If Not IsArray(Session("Intro")) Then 
 Response.Redirect("../Public/MemberLogin.asp")
 Response.End()
End if
 %>
