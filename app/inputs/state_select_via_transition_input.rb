class StateSelectViaTransitionInput < SimpleForm::Inputs::CollectionInput
  def input
    label_method = :human_to_name
    value_method = :event
    
    possible_transitions = transitions_of attribute_name
    human_state_name = current_human_state_name_of attribute_name

    state_event_name = "#{attribute_name}_event"
    
    options = input_options.merge(:include_blank => human_state_name)

    @builder.collection_select(
      state_event_name, possible_transitions, value_method, label_method,
      options, input_html_options
    )
  end

  private
    def transitions_of(state_name)
      object.send("#{state_name}_transitions")
    end

    def current_human_state_name_of(state_name)
      object.send("human_#{state_name}_name")
    end
end
