$(document).on('turbolinks:load', function() {
  $(function(){
    var topOfOthDiv = $(".hideshare").offset().top;
    $(window).scroll(function() {
        if($(window).scrollTop() > topOfOthDiv) { //scrolled past the other div?
          $(".share").hide(); //reached the desired point -- show div
        }
        else{
          $(".share").show();
        }
    });

    $('#star').raty({
      readOnly: true,
      score: $('#star').attr('data'),
      path: '/assets/'
    });

    $('#user_star').raty({
      score: $(this).attr('data-score'),
      path: '/assets/',
      click: function(score) {
        $.ajax({
          url: '/ratings/' + $(this).attr('data-id'),
          type: 'PATCH',
          data: { score: score }
        }).done(function (data){
          $('#star').raty({
            readOnly: true,
            score: data,
            path: '/assets/'
          });
        });
      }
    });
  });
})
