module ApplicationHelper
    def get_type_icon(type_id)
        type_name = Type.where(:id => type_id)
        if type_name.first.icon.present?
            image_tag(type_name.first.icon, class: 'w-1/5 md:w-2/6')
        else
            'No Icon'
        end
    end
end
