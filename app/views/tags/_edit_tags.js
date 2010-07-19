$("#tag_list").append("<%= escape_javascript(render :partial => 'tags/new') %>");
    <% @post.tag_list.each do |tag| %>
    $("added_tags").append("<%= escape_javascript(tag) %>");
    <% end %>