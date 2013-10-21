function FormCallback(form_node) {

  /*this.send = function() {
     ajax = $.ajax({
        type: "GET",
        url: Routes.api_admin_streets_path({format: 'json'}),
        data: ({value: $('#search').attr('value')}),
        dataType : "json", 
        success: function () {
            alert('123');
        }
     });
  }     */

  this.on_success = function(handler) {
    form_node.bind('ajax:success', function(xhr, data) {
      self = form_node
      handler(data)
    })
  }

  this.on_failure = function(handler) {
    form_node.bind('ajax:error', function(jq, error, status) {
      data = JSON.parse(error.responseText)
      self = form_node
      handler(data)
    })
  }   

}