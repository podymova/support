class TimepickerInput < SimpleForm::Inputs::StringInput
  def input

    time_value = object.send(attribute_name)
    has_time_value = time_value.present?

    if has_time_value
      initial_value = I18n.l(time_value, :format => :short_time_in_numbers)
    else
      initial_value = ""
    end

    custom_options = input_html_options.merge(
      :class => "ui_timepicker",
      :value => initial_value 
    )

    @builder.text_field(attribute_name, custom_options)
  end
end
