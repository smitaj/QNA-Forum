$(document).ready(function() {
  $('.container').rating();
  $(".stars .star").click(function() {
    var id  = $(this).parents('.container:first').attr('rel');
    var rating = $(this).attr('title')
    var replace_div = $(this).parents('.ans-content:first').find('.rate_val:first')
    $.ajax({  
      type: 'get',
      url: '/answers/ratting_submit/'+id+'/'+rating,
      success: function(data) {
        $(replace_div).html(data);
      }
    });
  });
});


