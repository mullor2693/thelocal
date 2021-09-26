class TrainingsController < ApplicationController
  add_breadcrumb "Home", :authenticated_root_path
  add_breadcrumb "Entrenamientos", :trainings_path, only: %i[ show edit]
  before_action :set_training, only: %i[ show edit update destroy ]
  before_action :set_header_text, only: [:index]

  # GET /trainings or /trainings.json
  def index
    @trainings = Training.all
  end

  # GET /trainings/1 or /trainings/1.json
  def show
  end

  # GET /trainings/new
  def new
    @training = Training.new
    render :edit
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings or /trainings.json
  def create
    @training = Training.new(training_params)
    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: "Training was successfully created." }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1 or /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: "Training was successfully updated." }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1 or /trainings/1.json
  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url, notice: "Training was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    def set_header_text
      @header_text = "En esta seccion podras controlar tus entrenamientos, 
                          creando rutinas de ejercicios especificas para tus objetivos. 
                          También tendras acceso a las rutinas creadas por tu entrenador, 
                          para que puedas revisarlas siempre que lo necesites."
    end

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit(:name, :description)
    end
end
