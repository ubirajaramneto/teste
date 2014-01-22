$(document).ready(function () {

	$('form#category-form').on("ajax:success", function () {
		$('#category-modal').foundation('reveal', 'close');
		$('#product_category_id').replaceWith(
			'<select name="product[category_id]" id="product_category_id"></select>'
		);
		$.get("/get_categories", function(data){
			$.each(data, function(index, category_data){
				$('#product_category_id').append('<option value='+ category_data.id +'>'+ category_data.name +'</option>')
			});
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

    $('#product_price').decimalMask("99999.99")

    $('#deactivate-selected-trigger').click(send_request);

});

function build_id_array(){

	var request_array = new Array();
	$("input:checked").each(function(index){
			request_array[index] = $(this).attr("value");
	});
	return request_array;
	
};

function send_request(){
	var ids = build_id_array();
	console.log(ids);
	$.ajax({
		url: "/products/deactivate_selected/" + ids ,
		type: 'PUT',
		dataType: 'json'
	});
}