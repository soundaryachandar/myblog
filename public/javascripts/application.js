// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


(function($){
    jQuery.ajaxSetup({
	'beforeSend' : function(xhr) {xhr.setRequestHeader("Accept","text/javascript")}
    });
    $(document).ready(function(){
	$("a.show_posts_link").live("click",function(){
	    $.get($(this).attr("href"), null, function(){
		$.bindRatingsToPost();		
	    }, "script");
	    return false;   //avoids redirect
	});
	$("#new_comment").submit(function(){
		$.post($(this).attr("action"), $(this).serialize(), null, "script");
	    return false;   //avoids redirect
	});
	$("a.new_post_link").click(function(){
		$.get($(this).attr("href"), null, null, "script");
	    return false;   //avoids redirect
	});
	$("#new_post").submit(function(){
		$.post($(this).attr("action"), $(this).serialize(), null, "script");
	    return false;   //avoids redirect
	});

	$(".stars_wrapper").stars({
	    disabled: true,
	});

	$.bindRatingsToPost = function(){
	  $(".editable_rating").stars();
	};

	$(".ui-stars-star").live('click',function(){
	    $.post($("#rate_post_form").attr("action"),$("#rate_post_form").serialize(),null,"script");
	    return false;
	});

	
    });
})(jQuery);











