class Trainings::WorkoutsController < Trainings::ApplicationController
  before_action :set_training_workouts
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
   
  # GET /trainings/:id/workouts
  def index
  end

  # GET /trainings/:id/workouts/1
  def show
  end

  # GET /trainings/:id/workouts/new
  def new
    @workout = @workouts.new
    render :edit
  end

  # GET /trainings/:id/workouts/1/edit
  def edit
  end

  # POST /trainings/:id/workouts
  def create
    @workout = @workouts.new(workout_params)
    @workout.creator = @current_user
    if @workout.save
      UserWorkout.create(user: @current_user, workout: @workout)
      redirect_to @workout, notice: 'Workout was successfully created.'
    else
      render :edit
    end
  end

  # PATCH/PUT /trainings/:id/workouts/1
  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: 'Workout was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trainings/:id/workouts/1
  def destroy
    @workout.destroy
    redirect_to workouts_url, notice: 'Workout was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_workouts
      @workouts = @training.workouts
      add_breadcrumb "Entrenamientos", :trainings_path
      add_breadcrumb @training.name, @training
      add_breadcrumb "Workouts", :workouts_path
    end

    def set_workout
      @workout = @workouts.find_by(id: params[:id])
      redirect_to trainings_workout_trainings_path, alert: 'Workout training not found on the training.' if @workout.blank?
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:name, :description, weekdays: [])
    end
end
