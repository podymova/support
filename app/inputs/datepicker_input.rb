class DatepickerInput < SimpleForm::Inputs::StringInput
  def input


    date_value = object.send(attribute_name)
    has_date_value = date_value.present?

    if has_date_value
      initial_value = I18n.l(date_value, :format => :short_date_in_numbers)
    else
      initial_value = ""
    end

    custom_options = input_html_options.merge(
      :class => "ui_datepicker",
      :value => initial_value,
      :autocomplete => "off"
    )
#    custom_options = input_html_options.merge(
#      :data => {:behaviour => 'datepicker',
#      :value => initial_value 
#    )

    @builder.text_field(attribute_name, custom_options)
  end
end
