class ClearLabelInput < SimpleForm::Inputs::CollectionInput
  def input

    label_method = ''

    @builder.collection_select(
      attribute_name, possible_transitions, value_method, label_method,
      options, input_html_options
    )
  end
end