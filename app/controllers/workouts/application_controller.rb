class Workouts::ApplicationController < ApplicationController
    before_action :get_workout

    private

    def get_workout
        @workout = @current_user.workouts.find_by(id: params[:workout_id])
        redirect_to workouts_path if @workout.nil?
    end
end
