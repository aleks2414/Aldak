jQuery ->
	$('#service_order_id').autocomplete
		source: $('#service_order_id').data('autocomplete-source')