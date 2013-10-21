/*
*  Style of form elements
*/
$.fn.setFormElement = function() {

    var inputs = $(this).find('input,select').not('input[type=submit]').not('input[type=checkbox]')
    inputs.each(function(){
        var t = $(this).attr('type')
        var i = $(this)
          var form = i.closest('form')
          //var l = $('<div>').attr({class:'form-line'}).appendTo(form)
              i.removeClass('required')
               .addClass('optional')
               .removeAttr('required')
               .closest('div').removeClass('required')
                              .addClass('optional')
                              .find('label').removeClass('required')
                              .addClass('optional').find('abbr').remove()

    })

}



/*
 *
 */
function check_all_model(obj) {

   // If any of model checkboxes is checked check_all_model will be checked too
   obj.each(function(e){
       var model = $(this)
       var parent = model.closest("tr");
       var ch = []
       parent.find('input[type*=checkbox]').each(function(e){
         if ($(this).attr('checked') == 'checked')
           ch[e] = 1
         else
           ch[e] = 0
       })

       if ($.inArray(1, ch) > 0)
         model.attr('checked', true)


   })

   // Check/Uncheck all
   obj.change(function(){
        if ($(this).attr('checked') == 'checked')
          var value = true
        else
          var value = false

       var parent = $(this).closest("tr");
        parent.find('input[type*=checkbox]').each(function(e){
            $(this).attr('checked', value)
        })
   });
}


/*
 *
 */
function GetUsersList() {
  $('#users-content').load(Routes.api_users_path({format: 'json'}))

  $('#send2user').click(function(){
     $.get(Routes.api_users_path({format: 'json'}), function(data){alert('123'); })
  })

}


/*
 *   Ajax search and color syntax
 */
function colorSyntax(obj) {

    obj.closest('form').submit();
    var p = obj.closest('form').serializeArray()
    $('#modalUsersList').load(Routes.search_api_users_path({format: 'json'}), p)

    obj.keyup(function(){
    var stext = obj.val()
    obj.closest('form').submit();
    var p = obj.closest('form').serializeArray()
    $('#modalUsersList').load(Routes.search_api_users_path({format: 'json'}), p, function(data){
       var content = $(this).find('.search-cell');
       content.each(function(){
           var item = $(this).html()
             if (item.indexOf(stext) >= 0) {
                $(this).html(item.replace(stext, "<span>" + stext + "</span>"))
                $(this).find('span').addClass('foundText')
             }

       })
    })

    })

}

/*
 *   Disable all form elements with :rel => form2Disable
 */
function disableForm(v) {
  var obj = $('form[rel*=form2Disable]').find('input, select')
  if (v == 1) {
      obj.attr('disabled', 'true')
  } else {
      obj.removeAttr('disabled')
  }
}



/*
* Фильтр работает с ajax.
* AjaxFilter - основная функция
* submitAjaxFilter - callback функция при сабмите формы фильтра
* form[rel*=AjaxSearchForm] - для использования формы фильтра с ajax нужно
* опрелить :rel => 'AjaxSearchForm'
* #AjaxFilterResult - Div, куда загружается результат
* */
function AjaxFilter(qtype, url){
    var form = $('form[rel*=AjaxSearchForm]')
    /*
     *  При сабмите формы фильтра выполняется submitAjaxFilter(qtype),
     *  где qtype - тип действия
     *  send - получаем данные, используя форму фильтра
     *  reset - очищаем форму
     *  Это при загрузке страницы. При сабмите формы вручную см. обработчик во вьюхе
     */
    form.submit(submitAjaxFilter(qtype, url));
}

function submitAjaxFilter(qtype, url){
    var page, sort;
    var obj = $('#AjaxFilterResult')
    var source = obj.attr('data-source')
    var parent = obj.attr('data-parent_id')
    var parent_name = obj.attr('data-parent_name')
    var form = $('form[rel*=AjaxSearchForm]')

    if (typeof(url) == "string") {
      var param = parseUrl2Array(url)

        page = (param['page'] !== undefined) ? param['page'] : page = 1

        sort = (param['search%5Bmeta_sort%5D'] !== undefined) ? param['search%5Bmeta_sort%5D'] : null
    } else
      page = 1


    if (sort) {
            // Создаем динамически input для sort
            $('<input>').attr({type:'hidden',
                               name:'search[meta_sort]',
                               id:'dynamic_sort_' + sort})
                      .val(sort)
                      .appendTo(form)
    }


    if (page) {
            // Создаем динамически input для page
            $('<input>').attr({type:'hidden',
                               name:'page',
                               id:'dynamic_page_' + page})
                      .val(page)
                      .appendTo(form)
    }

    if (parent_name) {
        if (qtype == 'send') {
            // Создаем динамически input для parent_id
            $('<input>').attr({type:'hidden',
                               name:'search[' + parent_name + '_equals]',
                               id:'dynamic_' + parent_name})
                      .val(parent)
                      .appendTo(form)
        }
    }


    if (qtype == 'reset') {
           // Очищаем форму
           form.find('input,select')
               .each(function(){
                   $(this).val('')
               })
           // Удаляем элемент parent_id
           $('#dynamic_' + parent_name).remove();
           // Удаляем элемент page
           $('input[id*=dynamic_page]').each(function(){
              $(this).remove();
           })
           $('#dynamic_sort_' + sort).remove();
           // Сворачиваем фильтр
           $(".filter").set_filter();
    }

    // Параметры для отправки на сервер
    var params = form.serializeArray()

        // Отправляем
        $.ajax({
           url: source,
           type: "GET",
           dataType : "json",
           data:(params),
           beforeSend: function(){
                obj.html('').addClass('ajax')
           },
           success: function(xhr, data){
                alert('xhr.responseText');
           },
           error: function(xhr) {
               //var err = eval("(" + xhr.responseText + ")");
               //alert(xhr.responseText);
               //obj.html(xhr.responseText).css({'background':'transparent'});
           },
           complete: function(xhr){
               obj.removeClass('ajax').html(xhr.responseText)

                // Перезаписываем href у sortLink
                if ((qtype == 'send')&&(sort)) {
                    if (url.match(/asc/gi)) {
                        what = 'asc'
                        on = 'desc'
                    } else {
                        what = 'desc'
                        on = 'asc'
                    }
                    $('#' + param['linkId']).attr('href', url.replace(what, on))
                }

           }

        })

    // Удаляем элементы
    if (qtype == 'send') {
        $('#dynamic_page_' + page).remove();
            if (sort) {
                $('#dynamic_sort_' + sort).remove();
            }
    }


}

function parseUrl2Array(url){
      var array = url.split('?')
      var params = {}
        params['controller'] = array[0]
        var other =  array[1].split('&')
         for (var i in other) {
           var a = other[i].split('=')
           params[a[0]] = a[1]
         }
      return params
}













