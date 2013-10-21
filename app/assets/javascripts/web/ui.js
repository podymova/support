function UI() {
  this.init = function() {
    init_bootstrap_ui()
    init_jquery_ui()
    init_tab_select()
  }

  function init_bootstrap_ui() {
    $("a[rel=popover]").popover()
    $(".tooltip").tooltip()
    $("a[rel=tooltip]").tooltip()

    $('.tabs').tabs()
  }

  function init_jquery_ui() {
    $(".ui_datepicker").datepicker()
    $(".ui_timepicker").timepicker()
  }

  function init_tab_select(){
    $('a[data-toggle="tab"]').on('shown', function (e) {
      localStorage.setItem('adminlastTab', $(e.target).attr('href'));
    });

    var lastTab = localStorage.getItem('adminlastTab');
    if (lastTab) {
        $('a[href="'+lastTab+'"]').tab('show');
    }
  }
}
