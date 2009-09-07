$(document).ready(function()
	{
		popup("div.flash");
		popup("div.errorExplanation");
		$('#operation_pay_date').datepicker();
	}
);
function popup(selector)
{
	if($(selector))
	{
		$(selector).hide();
	
		if($(selector).html() && $(selector).html().length)
		{
			$(selector).fadeIn(500, function()
			{
				setTimeout("$('" + selector + "').fadeOut(500);", 2000);
			});
		}
	}
}