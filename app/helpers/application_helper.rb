module ApplicationHelper
  def get_type_icon(type_id)
    type_name = Type.find_by(id: type_id)
    if type_name.present? && type_name.icon.present?
      image_tag(type_name.icon, class: 'w-1/5 md:w-2/6')
    else
      image_tag('logo.png', class: 'w-1/5 md:w-2/6')
    end
  end
end
