$.each($("td.qty input"),function(a,b){$(b).delayedObserver(function(){var a=$(this).attr("id").replace("order_line_items_attributes_","").replace("_quantity","");a="#order_line_items_attributes_"+a+"_id",jQuery.ajax({type:"POST",url:"/admin/orders/"+$("input#order_number").val()+"/line_items/"+$(a).val(),data:{_method:"put","line_item[quantity]":$(this).val()},complete:function(a){$("#order-form-wrapper").html(a.responseText)}})},0,5)});