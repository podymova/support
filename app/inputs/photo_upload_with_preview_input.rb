class PhotoUploadWithPreviewInput < SimpleForm::Inputs::FileInput
  def input
    image = object.send(attribute_name)
    if image.present?
      wrapper = template.content_tag(:div) do
        
        preview_options = {
          :src => image.url,
          :alt => image.url
        }

        template.content_tag(:img, nil, preview_options)
      end

      wrapper + super
    else
      super
    end
  end
end
