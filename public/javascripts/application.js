// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


(function($){
    jQuery.ajaxSetup({
	'beforeSend' : function(xhr) {xhr.setRequestHeader("Accept","text/javascript")}
    });
    $(document).ready(function(){
	$("a.show_posts_link").click(function(){
	    $.get($(this).attr("href"),null,function(){alert("show");},"script");
	    return false;   //avoids redirect
	});
    });
})(jQuery);