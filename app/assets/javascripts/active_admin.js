//= require active_admin/base
$(function(){
	role = $('.registrations #admin_user_role').val();
	
	if (role=='comprador') {
		$('.registrations .designer_name').hide();
	};

	$('.registrations #admin_user_role').change(function(){
		nameHide = $(this).val();
		if (nameHide=='comprador') {
			$('.registrations .designer_name').hide();
			$('.registrations .comprador_name').show();
		}else{
			$('.registrations .designer_name').show();
			$('.registrations .comprador_name').hide();
		};
	})

})
