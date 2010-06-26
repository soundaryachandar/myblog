require("spec_helper.js");
require("../../public/javascripts/tags.js");

Screw.Unit(function(){
  describe("new tag button is clicked", function(){
    before(function(){
      $("#tag_to_add").val('');
      $("#added_tags").html('');
    });
    it("should get added to the tags list", function(){
      $("#tag_to_add").val('tag1');
      $("#add_tag_button").click();
      expect($(".prospective_tag").size()).to(equal, 1);
    });
    
    it("should have a link to delete the tag", function(){
      $("#tag_to_add").val('tag1');
      $("#add_tag_button").click();
      expect($(".prospective_tag .tag_delete").size()).to(equal, 1);
    });

    it("should add another tag when 1 tag already exists", function(){
      $("#tag_to_add").val('tag1');
      $("#add_tag_button").click();
      $("#tag_to_add").val('tag2');
      $("#add_tag_button").click();
      expect($(".prospective_tag").size()).to(equal, 2);
    });

    it("should automatically split the tags when 2 tags are added simultaneously", function(){
      $("#tag_to_add").val('tag1, tag2');
      $("#add_tag_button").click();
      expect($(".prospective_tag").size()).to(equal, 2);
    });

  });

  describe("delete tag button is clicked", function(){
    before(function(){
      $("#tag_to_add").val('');
      $("#added_tags").html('');
      $("#tag_to_add").val('tag1,tag2,tag3');
      $("#add_tag_button").click();
    });
    
    it("should remove the tag from the list of added tags", function(){
      var no_of_tags = $("#added_tags .prospective_tag").size();
      $("#added_tags .prospective_tag .tag_delete:first").click();
      expect($(".prospective_tag").size()).to(equal, no_of_tags - 1);      
    });
  });

});
