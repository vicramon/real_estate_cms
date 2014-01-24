$(function() {
  $(".reorder_view").sortable({
    revert: 1,
    stop: function() {
      var $ol = $(this);
      $ol.find(".dragging").removeClass("dragging");
      $ol.find("li").each(function(i) {
        $(this).removeClass("ui-draggable-dragging").removeAttr("style")
        .find("[type=hidden]").val(i + 1);
      });
    }
  });
});
