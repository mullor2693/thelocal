class WorkoutsController < ApplicationController
  before_action :set_user_workouts
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Entrenamiento", :dashboard_training_path
  add_breadcrumb "Workouts", :workouts_path
  # GET /workouts
  # GET /workouts.json
  def index
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    @workout = @workouts.new
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = @workouts.new(workout_params)
    @workout.creator = @current_user
    respond_to do |format|
      if @workout.save
        UserWorkout.create(user: @current_user, workout: @workout)
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_workouts
      @workouts = @current_user.workouts
    end

    def set_workout
      @workout = @workouts.find_by(id: params[:id])
      redirect_to workouts_path, alert: 'Entramiento no encontrado.' if @workout.blank?
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:name, :description, weekdays: [])
    end
end
