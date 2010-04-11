// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


(function($){
    jQuery.ajaxSetup({
	'beforeSend' : function(xhr) {xhr.setRequestHeader("Accept","text/javascript")}
    });
    $(document).ready(function(){
	$("a.show_posts_link").click(function(){
	    $.get($(this).attr("href"), null, null, "script");
	    return false;   //avoids redirect
	});
    });
})(jQuery);

(function($){
    jQuery.ajaxSetup({
	'beforeSend' : function(xhr) {xhr.setRequestHeader("Accept","text/javascript")}
    });
    $(document).ready(function(){
	$("#new_comment").submit(function(){
		$.post($(this).attr("action"), $(this).serialize(), null, "script");
	    return false;   //avoids redirect
	});
    });
})(jQuery);

(function($){
    jQuery.ajaxSetup({
	'beforeSend' : function(xhr) {xhr.setRequestHeader("Accept","text/javascript")}
    });
    $(document).ready(function(){
	$("#new_post").submit(function(){
		$.post($(this).attr("action"), $(this).serialize(), null, "script");
	    return false;   //avoids redirect
	});
    });
})(jQuery);





