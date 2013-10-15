function SelectAllItem(item)
{
    if( typeof(item.length) == "undefined" )
    {
        item.checked = !item.checked
    }
    else
    {
        for(i=0;i<item.length;i++)
        {
            item[i].checked=!item[i].checked
        }
    }
}

function theForm_Submit(id)
{
		if (id==2001)
        {
		  	form.target='_self';
			form.action="Com_JobOption.asp?action=refreshs";
			form.submit();
		}
		
		if (id==2002)
		{
		    form.target='_self';
			form.action="Com_JobOption.asp?action=opens";
			form.submit();
		}

		if (id==2003)
		{
		    form.target='_self';
			form.action="Com_JobOption.asp?action=closes";
			form.submit();
		}
		
		if (id==2004)
		{
		  if(confirm('职位删除后将无法恢复，请确认删除'))
		  {
		    form.target='_self';
			form.action="Com_JobOption.asp?action=dels";
			form.submit();	   
		   }

		}
		
	    if (id==2005)
        {
		  	form.target='_self';
			form.action="Com_JobOption.asp?action=publishs";
			form.submit();
		}
}

