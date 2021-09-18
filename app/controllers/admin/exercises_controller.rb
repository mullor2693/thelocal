class Admin::ExercisesController < Admin::ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Entrenamiento", :admin_dashboard_training_path
  add_breadcrumb "Ejercicios", :admin_exercises_path

  # GET /exercises
  # GET /exercises.json
  def index
    @q = Exercise.ransack(params[:q])
    @exercises = @q.result(distinct: true)
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to [:admin, @exercise], notice: 'Exercise was successfully created.' }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new }
        format.js { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to [:admin, @exercise], notice: 'Exercise was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to admin_exercises_url, notice: 'Exercise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find_by(id: params[:id])
      redirect_to admin_exercises_url, alert: 'Exercise not found on the system.' if @exercise.blank?
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:name, :description, :categories, :muscle_groups)
    end
end
