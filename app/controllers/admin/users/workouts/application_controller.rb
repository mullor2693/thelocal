class Admin::Users::Workouts::ApplicationController < Admin::Users::ApplicationController
    before_action :get_workout

    private

    def get_workout
        @workout = @user.workouts.find_by(id: params[:workout_id])
        redirect_to admin_user_workouts_path(@user) if @workout.nil?
    end
        
end
