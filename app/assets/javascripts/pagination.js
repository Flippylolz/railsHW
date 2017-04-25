$(document).ready(function() {
  if ($('.pagination').length > 0){
    $('.prev').remove();
    $('.next').remove();
    var win = $(window);
    win.scroll(function() {
      var hasNextPage = $('.active').next().length,
          isBottomOfWindow = ($(document).height() - win.height() == win.scrollTop());
      if (isBottomOfWindow && hasNextPage) {
        var nextPage = parseInt($('.active').text())+1;
        $('div.pagination').hide();
        $('#loader').show();
        $.ajax({
          url: '/posts/next_page',
          type: 'get',
          data: {page: nextPage},
          success: function() {
            $('.active').next().addClass('active');
            $('.active').first().removeClass('active');
            $('div.pagination').show();
            $('#loader').hide();
          },
          error: function (error) {
            console.log(error);
            $('div.pagination').show();
          }
        });
      }
    });
    }
});

