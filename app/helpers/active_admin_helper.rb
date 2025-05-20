module ActiveAdminHelper
  def render_json_display(json_data)
    content_tag(:pre, JSON.pretty_generate(json_data), 
      style: 'color: #ffffff; background-color: #6c757d')
  end
  
  def render_json_editor(form, attribute)
    json_value = form.object.send(attribute).present? ? 
      JSON.pretty_generate(form.object.send(attribute)) : '{}'
    
    form.text_area attribute, value: json_value, class: 'jsoneditor'
  end
end