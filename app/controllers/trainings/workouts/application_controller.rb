class Trainings::Workouts::ApplicationController < Trainings::ApplicationController
    before_action :get_workout

    private

    def get_workout
        @workout = @training.workouts.find_by(id: params[:workout_id])
        redirect_to training_path(@training) if @workout.nil?
    end
end
