(function(jQuery) {


$.fn.ajaxSendData = function(obj) {
    var result = $(this)
    var source = obj.attr('data-source')
    var method = obj.attr('data-method')
    var data = obj.attr('data-attr')


     $.ajax({
       url: source,
       type: method,
       dataType : "json",
       data:data,
       beforeSend: function() {
           result.html('').progressCreate()
           loading(false);
       },
       complete: function(xhr){
           if (xhr.readyState == 4) {
              loading(true);
              result.progressDestroy()
              result.html('').html(xhr.responseText);
           }

       }
     })

}



$.fn.progressCreate = function() {
    $('<div>').attr({class:'progress-label'})
              .appendTo($('<div>').attr({id:'progressbar'})
                                  .appendTo($(this)))

}


$.fn.progressDestroy = function() {
    $('#progressbar').remove()

}


function loading(v) {
    var progressbar = $( "#progressbar" ),
        progressLabel = $( ".progress-label" );


    progressLabel.text("Соединение...").setMargin()

    progressbar.progressbar({
      disabled: v,
      value: false,
      change: function() {
        progressLabel.text(progressbar.progressbar( "value" ) + "%").setMargin();
      },
      complete: function() {
        progressLabel.text("Применение...").setMargin();
      }
    });

    function progress() {
      var val = progressbar.progressbar("value") || 0;

      progressbar.progressbar("value", val + 1);

      if (val < 99) {
        setTimeout(progress, 100);
      }
    }

    setTimeout(progress, 2000);

}



$.fn.setMargin = function() {
    var bar = $("#progressbar"),
        label = $(this);

    var w = label.width()
    var W = bar.width()
    var m = (W-w)/2

    label.css({'margin-left':m})
}



})(jQuery);

