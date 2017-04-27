$(document).ready(function() {
  if ($('.pagination').length > 0){
    $('.prev').remove();
    $('.next').remove();
    var now = new Date().getTime();
    var win = $(window);
    win.scroll(function() {

      var hasNextPage = $('.active').next().length,
          isBottomOfWindow = (win.scrollTop() + win.height()) > $(document).height() - 100,
          throttler = (new Date().getTime() - now > 1000);
      if (throttler && isBottomOfWindow && hasNextPage) {
        now = new Date().getTime();
        var nextPage = parseInt($('.active').text())+1;
        $('div.pagination').hide();
        $('#loader').show();
        $.ajax({
          url: '/posts',
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
