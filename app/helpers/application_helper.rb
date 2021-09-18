module ApplicationHelper
    include Turbo::StreamsHelper
    include Turbo::FramesHelper

    GLOBAL_STATUSES = ["primary", "info", "warning", "danger", "success", "none"]
    STATUSES = ["info", "warning", "danger", "success", "none"]
    WEEK_DAYS = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sábado", "Domingo"]
    R_OPTS = {every: [:day, :week, :month, :year]}

    def tailwind_classes_for(flash_type)
        {
            notice: "bg-green-400 border-l-4 border-green-700 text-white",
            error:   "bg-red-400 border-l-4 border-red-700 text-black",
        }.stringify_keys[flash_type.to_s] || flash_type.to_s
    end

    def format_date(datetime)
        datetime = datetime&.to_datetime
        datetime&.present? ? datetime.strftime("%d/%m/%Y") : nil
    end

    def format_datetime(datetime)
        datetime = datetime&.to_datetime
        datetime&.present? ? datetime.strftime("%d/%m/%Y, %H:%M") : nil
    end

    def format_duration(duration)
        duration = duration&.to_i
        duration&.present? ? ActiveSupport::Duration.build(duration) : nil
    end

    def valid_json?(string)
        !!JSON.parse(string)
        rescue JSON::ParserError
        false
    end

    def track(event_type, object, data = {})
        TrackingLog.track(event_type, object, data, request.remote_ip, current_user)
    end

    # View helpers
    def remote_link(data_link, text, options={})
        link_class = options[:class] ? "ajaxNew #{options[:class]}" : "ajaxNew"
        return "<a class='#{link_class}' href='#{url_for data_link}'>#{text}</a>".html_safe
    end
    
    def remote_icon_link(data_link, icon_name, options={})
        link_class = options[:class] ? "uk-icon ajaxNew remote-icon-link #{options[:class]}" : "uk-icon ajaxNew remote-icon-link"
        icon_class = options[:'icon-class'] ? "#{options[:'icon-class']}" : ""
        return "<a class='#{link_class}' href='#{url_for data_link}'><span class='#{icon_class}' uk-icon='#{icon_name}'></span></a>".html_safe
    end

    def remote_fa_icon_link(data_link, icon_name, options={})
        link_class = options[:class] ? "uk-icon ajaxNew #{options[:class]}" : "uk-icon ajaxNew"
        icon_class = options[:'icon-class'] ? "#{options[:'icon-class']}" : ""
        return "<a class='#{link_class}' href='#{url_for data_link}'><i class='#{icon_name}'></i></a>".html_safe
    end

    def span_show_error(error_attr)
        tag.span(error_attr.first.upcase_first, class: "uk-text-danger uk-text-small") if error_attr.present?
    end

    # input_field: this helper allows you to create easy inputs with errors
    def input_field(form, input_attr, input_type = :text_field, data: {})
        tag.div(class:"uk-margin") do
            form.label(input_attr, data[:name], class: "uk-form-label") + 
            tag.div(class:"uk-form-controls") do
                eval("form."+input_type.to_s+"(input_attr, class: 'uk-input')").html_safe + span_show_error(form.object.errors.try(:[], input_attr))
            end
        end
    end
end
