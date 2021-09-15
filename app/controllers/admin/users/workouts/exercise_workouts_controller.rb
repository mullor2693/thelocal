class Admin::Users::Workouts::ExerciseWorkoutsController < Admin::Users::Workouts::ApplicationController
  before_action :set_workout_exercise_workouts
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  # GET /exercise_workouts
  # GET /exercise_workouts.json
  def index
  end

  # GET /exercise_workouts/1
  # GET /exercise_workouts/1.json
  def show
  end

  # GET /exercise_workouts/new
  def new
    @exercise_workout = @exercise_workouts.new()
  end

  # GET /exercise_workouts/1/edit
  def edit
  end

  # POST /exercise_workouts
  # POST /exercise_workouts.json
  def create
    @exercise_workout = @exercise_workouts.new(exercise_workout_params)
    @exercise_workout.workout = @workout
    respond_to do |format|
      if @exercise_workout.save
        format.html { redirect_to [:admin, @user, @workout, @exercise_workout], notice: 'Exercise was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @user, @workout, @exercise_workout] }
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
        format.html { redirect_to [:admin, @user, @workout, @exercise_workout], notice: 'Exercise was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @user, @workout, @exercise_workout] }
      else
        format.html { render :edit }
        format.json { render json: @exercise_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_workouts/1
  # DELETE /exercise_workouts/1.json
  def destroy
    @workout.exercise_workouts.where(exercise: @exercise_workout).destroy_all
    respond_to do |format|
      format.html { redirect_to admin_user_workout_exercise_workouts_path(@user, @workout), notice: 'Exercise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_exercise_workouts
      @exercise_workouts = @workout.exercise_workouts
    end

    def set_exercise
      @exercise_workout = @exercise_workouts.find_by(id: params[:id])
      redirect_to admin_user_workout_exercise_workouts_path(@user, @workout), alert: 'Exercise not found on the workout.' if @exercise_workout.blank?
    end

    # Only allow a list of trusted parameters through.
    def exercise_workout_params
      params.require(:exercise_workout).permit(:exercise_id, :serie_type, :serie_rest, :notes)
    end
end
