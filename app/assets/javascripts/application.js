// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// This method is part of the "float-left, align-right" label positioning technique.
function adjustFormLabelWidths() {
  $("form").each(function(){
    var max = 0;
    $(this).find("div.field label").each(function(){
      if ($(this).width() > max)
        max = $(this).width();
    });
    $(this).find("div.field label").each(function(){
      $(this).width(max);
      $(this).css('float', 'left');
      $(this).css('text-align', 'right');
      $(this).css('padding-right', '1em');
    });
  });
}


$(document).ready(function() {
  adjustFormLabelWidths();
});
