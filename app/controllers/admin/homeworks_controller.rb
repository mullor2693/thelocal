class Admin::HomeworksController < Admin::ApplicationController
  before_action :set_homework, only: %i[ show edit update destroy ]

  # GET admin/homeworks
  def index
    @homeworks = Homework.all
  end

  # GET admin/homeworks/1
  def show
  end

  # GET admin/homeworks/new
  def new
    @homework = Homework.new
  end

  # GET admin/homeworks/1/edit
  def edit
  end

  # POST admin/homeworks
  def create
    @homework = Homework.new(homework_params)
    respond_to do |format|
      if @homework.save
        format.html { redirect_to [:admin, @homework], notice: "Homework was successfully created." }
      else
        format.html { render new_admin_homework_path(@homework), status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT admin/homeworks/1
  def update
    respond_to do |format|
      if @homework.update(homework_params)
        format.html { redirect_to [:admin, @homework], notice: "Homework was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @homework] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE admin/homeworks/1
  def destroy
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to admin_homeworks_url, notice: "Homework was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def homework_params
      params.require(:homework).permit(:title, :description)
    end
end
