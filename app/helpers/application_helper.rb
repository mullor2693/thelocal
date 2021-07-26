module ApplicationHelper
    include Turbo::StreamsHelper
    include Turbo::FramesHelper

    GLOBAL_STATUSES = ["primary", "info", "warning", "danger", "success", "none"]
    STATUSES = ["info", "warning", "danger", "success", "none"]
    WEEK_DAYS = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sábado", "Domingo"]
    R_OPTS = {every: [:day, :week, :month]}

    def toastr_flash
        flash.each_with_object([]) do |(type, message), flash_messages|
            type = 'success' if type == 'notice'
            type = 'error' if type == 'alert'
            text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
            flash_messages << text.html_safe if message
        end.join("\n").html_safe
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
end
