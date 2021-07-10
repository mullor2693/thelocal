class Admin::Homeworks::ApplicationController < Admin::ApplicationController
	before_action :set_homework

	protected
	def set_homework
		@homework = Homework.find_by(id: params[:homework_id])
    if @homework.blank?
      redirect_to(admin_homeworks_path, alert: "La tarea no existe, revise los datos.")
      return
    end
  end

end
