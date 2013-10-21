(function(jQuery) {


// Global settings array
$.fn.settings = {}


// Main function
$.fn.addressLine = function(options) {

    var street = $('#street').val()
    var house = $('#house').val()

	//List of default values
	var defaults = {
        source: Routes.api_streets_path({format: 'json'}),
        source_load: Routes.address_line_api_streets_path({format: 'json'}),
        submit: false,
        result: $('#search-result'),
        child: $(this).find('input[type=text]'),
        container:  $(this),
        type: 'street',
        street: street ? street : 0,
        house: house ? house : 0,
        value: [],
        toSendValue: '',
        params: '&address%5Bvalue%5D=tmp',
        load:true
	}

    $.fn.settings = $.extend({}, defaults, options)

       // On load element
      if ($.fn.settings.load == true)
        $.fn.onload()


    $.fn.settings.child.keyup(function(e){

      if (e.keyCode == 27)
        hide_result()
      else {
        hide_result()
        set_toSendValue(e.keyCode)
        $.fn.send()
      }

    })

}





// Send data
$.fn.send = function() {
   //parse()

   //$.fn.settings = $.extend({}, $.fn.settings, pars);


   // Отправляем данные на сервер и получаем ответ
   var obj = $.fn.settings.result
     // Отправляем
     $.ajax({
       url: $.fn.settings.source,
       type: "GET",
       dataType : "json",
       data:($.fn.settings.params),
       success: function(xhr){
           obj.html('').set_position().html(xhr.responseText);
       },
       complete: function(xhr){
           obj.html('').set_position().html(xhr.responseText);
           $.fn.mass_handler(xhr.responseText)
           $.fn.settings = $.extend({}, $.fn.settings, {params: '&address%5Bvalue%5D=tmp'});
       }
     })
}





// Callback function
$.fn.mass_handler = function(data) {
    var node = $.fn.settings.result
    if (data.length !== 0) {

      // При нажатии на li событие onclick
      $('li[rel*=addressLine]').click(function(){
          $(this).select_item()
          $.fn.send()
      })
    } else {
      hide_result()
    }

}





// Set position
$.fn.set_position = function() {
    var node = $.fn.settings.child
    var top = node.offset().top + node.height() + 15;
    var left = node.offset().left;

    $(this).css({'top': top, 'left': left, 'z-index': 10}).show();

    return $(this)
}




// On click on li
$.fn.select_item = function() {
    var id = $(this).attr('data-item')
    var source = $(this).attr('data-source')
    var type = $(this).attr('data-type')
    var value

    $('#search-' + type).attr('value', id)   // Form saf
    $('#' + type).attr('value', id)          // form bellow

    $.fn.settings.toSendValue = ''
    //set_toSendValue('')
      if (type === 'street')
         set_value($(this).html() + '-')


  $.fn.settings.params = $.fn.settings.params.replace('tmp', $.fn.settings.toSendValue)
  $.fn.settings.source = source
  hide_result()
}




$.fn.onload = function() {
    var s = $.fn.settings.street
    $.get(Routes.api_street_path(s, {format: 'json'}), {house: $.fn.settings.house}, function(data) {
        var address = data.join('-')
        $.fn.settings.child.val(address)
    })
}


function set_toSendValue(k) {
      var t = $.fn.settings.toSendValue
      var r
      switch (k) {
        case 27:
          r = ''
          break;
        case 8:
          r = t.slice(0,-1)
          break;
        case 46:
          r = ''
          break;
        default:
          r = t + String.fromCharCode(k)

      }

   $.fn.settings = $.extend({}, $.fn.settings, {toSendValue: r, params: $.fn.settings.params.replace('tmp', r)});
}


function set_value(v) {
   var value = $.fn.settings.value
    value.push(v)
   $.fn.settings = $.extend({}, $.fn.settings, {value: value})
   $.fn.settings.child.attr('value', value.join('-')).focus()
}


function hide_result() {
   $.fn.settings.result.hide().html('')
}





})(jQuery); //End document