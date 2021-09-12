class ExerciseWorkoutsController < ApplicationController
  before_action :set_exercise_workout, only: [:show, :edit, :update, :destroy]

  # GET /exercise_workouts
  # GET /exercise_workouts.json
  def index
    @exercise_workouts = ExerciseWorkout.all
  end

  # GET /exercise_workouts/1
  # GET /exercise_workouts/1.json
  def show
  end

  # GET /exercise_workouts/new
  def new
    @exercise_workout = ExerciseWorkout.new
  end

  # GET /exercise_workouts/1/edit
  def edit
  end

  # POST /exercise_workouts
  # POST /exercise_workouts.json
  def create
    @exercise_workout = ExerciseWorkout.new(exercise_workout_params)

    respond_to do |format|
      if @exercise_workout.save
        format.html { redirect_to @exercise_workout, notice: 'Exercise workout was successfully created.' }
        format.json { render :show, status: :created, location: @exercise_workout }
      else
        format.html { render :new }
        format.json { render json: @exercise_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_workouts/1
  # PATCH/PUT /exercise_workouts/1.json
  def update
    respond_to do |format|
      if @exercise_workout.update(exercise_workout_params)
        format.html { redirect_to @exercise_workout, notice: 'Exercise workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercise_workout }
      else
        format.html { render :edit }
        format.json { render json: @exercise_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_workouts/1
  # DELETE /exercise_workouts/1.json
  def destroy
    @exercise_workout.destroy
    respond_to do |format|
      format.html { redirect_to exercise_workouts_url, notice: 'Exercise workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_workout
      @exercise_workout = ExerciseWorkout.find_by(id: params[:id])
      redirect_to diets_path, alert: 'Exercise workout not found.' if @exercise_workout.blank?
    end

    # Only allow a list of trusted parameters through.
    def exercise_workout_params
      params.require(:exercise_workout).permit(:exercise_id, :workout_id, :serie_type, :serie_reps, :serie_rest, :notes, :series => {})
    end
end
