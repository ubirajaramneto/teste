$(document).ready(function () {

	$('form#category_form').bind("ajax:success", function () {
		$('#category-modal').foundation('reveal', 'close')
	});

});