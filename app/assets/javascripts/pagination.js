$(document).ready(function() {
  if ($('.paginatiable').length > 0){
    var isLoading = false;
    var win = $(window);
    win.scroll(function() {
      var isBottomOfWindow = (win.scrollTop() + win.height()) > $(document).height() - 150;
      if (!isLoading && isBottomOfWindow) {
        isLoading = true;
        $('#loader').show();
        getNextPage();
      }
    });
    function getNextPage() {
      $.ajax({
        url: '/posts',
        type: 'get',
        data: {page: parseInt((document.cookie.match(/\d+/)[0])) + 1},
        success: function () {
          $('#loader').hide();
          isLoading = false;
        },
        error: function (error) {
          console.log(error);
        }
      });
    }
  }
});
