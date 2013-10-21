$(function() {
  var ui = new UI()
  ui.init()
})


//function hide_auth_ui() {
//  $('#layer').hide()
//  $('#layer .layer_bl').hide()
//}


$(function() {

    $('body').setFormElement()

    // Search users - Ajax
    colorSyntax($('input[rel*=ajaxSearch]'))

   //GetUsersList();

    // Filter with ajax
    AjaxFilter('send', 1);


    //******************

    //******************



   // Roles - Rights
   var models_node = $('input[id*=model]');
   check_all_model(models_node);



  // Check/Uncheck all
    $('input[id*=check_all]').change(function() {
        if ($(this).attr('checked') == 'checked')
          var value = true
        else
          var value = false

        $('#float_form').find('input[name*=item]').each(function(e){
            $(this).attr('checked', value)
        })
    })

       // Slide
          $(".filter").set_filter();

          /*$(".new-comment").set_filter({
             slider: $("a[rel*=new-comment]"),
             callback: function(){
                  $('#ppr-hards').animate({'top': $('#ppr-extends').position().top + $('#ppr-extends').height()+20}, 500, $(this).pprHeight())
             }
          });
          $(".new-attach").set_filter({
             slider: $("a[rel*=new-attach]"),
             callback: function(){
                  $('#ppr-hards').animate({'top': $('#ppr-extends').position().top + $('#ppr-extends').height()+20}, 500, $(this).pprHeight())
             }
          }); */
       // set ppr layout
         // $(this).setLayout();


  });