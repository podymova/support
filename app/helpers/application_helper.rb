module ApplicationHelper

  def sortLink(attr, url, name)
    #u = url.split('?')
    #params = []
    #params = "search%5Bmeta_sort=#{attr}.asc%5B"
    #uu = url + params.join('&')
    #u = url.merge(:search => {:meta_sort => "#{attr}.asc"})
    link_to name, url, :rel => 'sortLink', :id => "sort_link_#{attr}"
  end

  def get_model_name model
    a = model.split('::')
    aa = a.last.split('_')
    @model = aa.join('::').classify.constantize
    #@attr = model_name.human_attribute_name(attr)
  end

  def get_model_attr model, attr
    @attr = model.human_attribute_name(attr)
  end

end
