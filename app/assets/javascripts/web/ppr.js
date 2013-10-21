(function(jQuery) {

$.fn.getTop = function(options) {
     return options.user.position().top + options.user.height() + 10
  }

$.fn.getBottom = function(options) {
     return options.extend.height()
  }

$.fn.pprHeight = function() {
     var node = $(this)
     var height = node.offset().top + node.height() + 900
     $('#ppr').css({'height': height})
}

$.fn.setLayout = function(options) {

	//List default values
	var defaults = {
        user: $('#ppr-users'),
        hard: $('#ppr-hards'),
        extend: $('#ppr-extends')
	},
	settings = $.extend({}, defaults, options);

    settings.extend.css({top: $.fn.getTop(settings)})
    //$.fn.full_height(options)
     settings.hard.hide().animate({
        top: $.fn.getBottom(settings)
     }, 500, function(){$(this).show()});
     //$('#ppr')


  // Check/Uncheck all
//    $('input[id*=check_all]').change(function() {
//        if ($(this).attr('checked') == 'checked')
//          var value = true
//        else
//          var value = false

//        $('#ppu').find('input[name*=user]').each(function(e){
//            $(this).attr('checked', value)
//        })
//    })

  // Select first li in nav tabs
    $('.nav.nav-tabs > li:first').addClass('active')
    $('.nav.nav-tabs > tab-pane:first').addClass('active')



}

}) (jQuery)



/*function SetLayout() {

  var _update_callback = function() {}
  var user = $('#ppr-users')
  var hard = $('#ppr-hards')
  var extend = $('#ppr-extends')


  this.init = function(update_callback) {
    if(update_callback != null) {
      _update_callback = update_callback
    }

    extend.css({top: getTop()})
    hard.css({top: getBottom()})
  }

  function getTop() {
     return user.position().top + user.height() + 10
  }

  function getBottom() {
     return extend.position().top + extend.height() + 20
  }
} */