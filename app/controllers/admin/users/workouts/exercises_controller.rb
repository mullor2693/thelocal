class Admin::Users::Workouts::ExercisesController < Admin::Users::Workouts::ApplicationController
  before_action :set_workout_exercises
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  # GET /exercises
  # GET /exercises.json
  def index
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @exercise = @exercises.new()
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = @exercises.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        @workout.exercises << @exercise
        format.html { redirect_to [:admin, @user, @workout, @exercise], notice: 'Exercise was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @user, @workout, @exercise] }
      else
        format.html { render :new }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to [:admin, @user, @workout, @exercise], notice: 'Exercise was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @user, @workout, @exercise] }
      else
        format.html { render :edit }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @workout.exercise_workouts.where(exercise: @exercise).destroy_all
    respond_to do |format|
      format.html { redirect_to admin_user_workout_exercises_path(@user, @workout), notice: 'Exercise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_exercises
      @exercises = @workout.exercises
    end

    def set_exercise
      @exercise = @exercises.find_by(id: params[:id])
      redirect_to admin_user_workout_exercises_path(@user, @workout), alert: 'Exercise not found on the workout.' if @exercise.blank?
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:name, :description)
    end
end
