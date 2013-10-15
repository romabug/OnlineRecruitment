<% 
If Not IsArray(Session("Company")) or Session("Server") = "" Then 
 Response.Redirect("../Public/MemberLogin.asp")
 Response.End()
End if
 %>
