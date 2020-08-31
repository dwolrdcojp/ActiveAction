jQuery(function($) {

    $("tr[data-link]").click(function() {
        window.location = $(this).data('link');
    });

    $("tr[data-link]").hover(function(){
      $(this).css("background-color", "#e6f7ff");
      }, function(){
      $(this).css("background-color", "white");
    });
    
});

