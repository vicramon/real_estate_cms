showImage = function(event) {
  var $img = $(event.target).closest('dl').next('dl').find('img')
  $img.attr('src', event.fpfile.url)
  $(event.target).closest('dl').siblings('dl').show()
}
