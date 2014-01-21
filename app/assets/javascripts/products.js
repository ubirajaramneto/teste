$(document).ready(function () {

	$('form#category-form').on("ajax:success", function () {
		$('#category-modal').foundation('reveal', 'close');
		$.get("/get_categories", function(data){
			$('#product_category_id').replaceWith(
				'<select name="product[category_id]" id="product_category_id"></select>'
			);
		});
		
	}).on("ajax:error", function () {
        $("#category-call-failure").animate({
            opacity: 1
        }, 1500, "swing", function () {
            $("#category-call-failure").animate({
                opacity: 0
            }, 1500, "swing")
        });
    });

});