<% 

    Response.Cookies ("Web_Cookies")=""
	Session.Abandon 

	Response.Redirect "Web_Login.asp"
	Response.Flush 
	Response.End 

 %>

