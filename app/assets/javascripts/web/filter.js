(function(jQuery) {

$.fn.down = function(options) {
    var height = 0

      options.child_forms.each(function(index) {
          height += $(this).height()
      })

     options.filter.animate({
        height: height
     }, 500, options.callback);

       options.child_forms.each(function(index) {
          $(this).show()
       })
    return options.direct = 'up'
}

$.fn.up = function(options){
     options.filter.animate({
        height: 0
     }, 500, options.callback);
       options.child_forms.each(function(index) {
          $(this).hide()
       })
   return options.direct = 'down'
}

$.fn.empty_form = function() {
    var count = $(this).find('input,select');
    var array = ['utf8', undefined, NaN, null, 'commit', 'authenticity_token', '✓']
    var empty = 0;

    count.each(function(index) {
        var name = $(this).attr('name')
        var val = $(this).val()
        if ((array.indexOf(name) == -1) && (array.indexOf(val) == -1)) {
            if (val.length !== 0) {
               empty = 1
               return empty
            }
        }
    })
    return empty
}


$.fn.set_filter = function(options) {

	//List default values
	var defaults = {
        slider: $("a[rel*=filter]"),
        filter: $(this),
        child_forms: $(this).find('form'),
        empty: $(this).empty_form(),
        callback: function() {},
        direct: ''
	},
	settings = $.extend({}, defaults, options);

    if (settings.empty == 1) {
      $.fn.down(settings)
    } else {
      $.fn.up(settings)
    }

    settings.slider.click(function(){
      if (settings.direct == 'up') {
          $.fn.up(settings)
      } else {
          $.fn.down(settings)
      }

    })
}


}) (jQuery)

// Working variant
/*$.fn.down = function(options) {
    options.filter.toggle('slow')
    options.child_forms.toggle('slow')
}

$.fn.up = function(options){
    options.filter.toggle('slow')
    if (options.child_forms.show())
      options.child_forms.toggle('slow')
}

$.fn.empty_form = function() {
    var count = $(this).find('input');
    var array = ['utf8', undefined, NaN, null]
    var empty = 0;

    count.each(function(index) {
        var name = $(this).attr('name')
        var val = $(this).val()

        if ((array.indexOf(name) == -1) && (array.indexOf(val) == -1)) {
            if (val.length !== 0) {
               empty = 1
               return empty
            }
        }
    })
    return empty
}


$.fn.set_filter = function(options) {

	//List default values
	var defaults = {
        slider: $('a[rel*=btn-slide]'),
        filter: $(this),
        child_forms: $(this).find('form'),
        empty: $(this).empty_form(),
        callback: function() {}
	},
	settings = $.extend({}, defaults, options);

    if (settings.empty == 1) {
      $.fn.down(settings)
    } else {
      $.fn.up(settings)
    }
    settings.slider.click(function(){
      settings.filter.toggle('slow', settings.child_forms.toggle('slow'))

    })
}  */

 // delimiter

/*$.fn.customStep = function(now, obj) {
	now; // текущее значение анимированного параметра

	obj.elem;  // объект анимации
	obj.prop;  // параметр который анимируется
	obj.start; // начальное значение
	obj.end;   // конечное значение

	obj.pos;   // коэффициент, изменяется от 0 до 1
	           // значение now вычисляется как now = (obj.end - obj.start) * obj.pos

	obj.options; // опции настроек анимации
}


$.fn.down = function(filter) {
    var child_forms = filter.find('form')
    var height = 0
      child_forms.each(function(index) {
          height += $(this).height()
      })
     filter.animate({
        height: height,
        padding: 15
     }, {step: $.fn.customStep});
     $(this).addClass("active");
       child_forms.each(function(index) {
          $(this).addClass('active')
       })
     return false;
    child_forms.toggle('slow')
}

$.fn.up = function(filter) {
    var child_forms = filter.find('form')
     filter.animate({
        height: 0,
        padding: 0
     }, {step: $.fn.customStep});
     $(this).addClass("active");
       child_forms.each(function(index) {
          $(this).removeClass('active')
       })
     return false;
    child_forms.toggle('slow')
} */