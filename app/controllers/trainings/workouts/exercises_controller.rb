class Trainings::Workouts::ExercisesController < Trainings::Workouts::ApplicationController
  before_action :set_user_exercises
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  # GET /exercises
  # GET /exercises.json
  def index
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_exercises
      @exercises = @workout.exercises
    end

    def set_exercise
      @exercise = @exercises.find_by(id: params[:id])
      redirect_to workouts_exercise_workouts_path, alert: 'Exercise workout not found on the workout.' if @exercise.blank?
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:name, :description)
    end
end
