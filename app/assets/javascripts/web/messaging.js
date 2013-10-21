function Messaging(channel_source, node) {

  var _update_callback = function() {}

  this.init = function(update_callback) {
    if(update_callback != null) {
      _update_callback = update_callback
    }

    preload_messages()
    //PrivatePub.subscribe(channel, handler)
  }

  function preload_messages() {
    $.get(channel_source, mass_handler)
  }

  function mass_handler(mass_data) {
    var action = "/admin/pprs/"+mass_data[0].ppr+"/users";
    var value = "<form action='"+action+"' method='post'>";

    for(var i = 0; i < mass_data.length; i++) {
      value += format(mass_data[i]);
      //node.prepend(format(mass_data[i]))
    }
    value += "<input type='submit' value='OK'></form>";
    node.prepend(value)

    _update_callback()
  }

  function handler(data) {
    node.append(format(data))
    _update_callback()
  }

  function format(data) {
    return "<p><input type='checkbox' name='c["+data.id+"]' value='"+data.id+"' />"+data.name+"</p>"
  }

  function format_date(date_string) {
    var date = new Date(date_string)
    var hours = date.getHours()
    var minutes = date.getMinutes()

    if(minutes < 10) {
      minutes = "0" + minutes
    }
    
    return hours + ":" + minutes 
  }
}
