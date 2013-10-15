<% 
If Not IsArray(Session("Person")) or Session("Server") = "" Then
 Session.Abandon() 
 Response.Redirect("../Person/Per_Login.asp")
 Response.End()
End if
 %>
