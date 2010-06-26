(function($){
    $(document).ready(function(){
	$("#add_tag_button").live("click", function(){
	    var prospective_tags = $("#tag_to_add").val();
	  if( prospective_tags != ""){
            tags = prospective_tags.split(',');
            $.each(tags,function(index, tag){             
		$("#added_tags").append("<span class='prospective_tag'><a href='#add_tag_button' class='tag_delete'>x</a><span class='tag'>" + tag + "</span>&nbsp;</span>");
		tag_list_val = $("#tag_list").val();
		new_tag_list_val = tag_list_val + tag + ',';
		$("#tag_list").val(new_tag_list_val);
		$("#tag_to_add").val('');		
              });
            return false;
	    }
	});
	
	$(".prospective_tag a").live("click", function(){
	    split_tags = $("#tag_list").val().split(",");
	    tag_to_delete = $(this).next().text();
	    final_list = $.grep(split_tags,function(value){
		return value != tag_to_delete
	    });
	    $("#tag_list").val(final_list.join(','));
	    $(this).parent().remove();
	});
    });

})(jQuery);
