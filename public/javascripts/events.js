$(document).ready(function()
	{
		popup("div.flash");
		popup("div.errorExplanation");
	}
);
function popup(selector)
{
	if($(selector))
	{
		$(selector).hide();
	
		if($(selector).html().length)
			$(selector).fadeIn(500);
	
		$(selector).click(
			function()
			{
				$(selector).fadeOut(500);
			}	
		);
	}
}