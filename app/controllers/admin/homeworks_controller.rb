class Admin::HomeworksController < Admin::ApplicationController
  before_action :set_homework, only: %i[ show edit update destroy ]

  # GET admin/homeworks
  def index
    @homeworks = Homework.all
    @homework = Homework.new
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
        format.turbo_stream
        # format.turbo_stream {
        #   @homeworks = Homework.all
        #   @homework = Homework.new
        #   homework_component = Admin::Table::HomeworkComponent.new(view_context: view_context, homework: @homework)
        #   homework_component.broadcast_prepend
        # }
        # format.turbo_stream { Admin::Table::HomeworkComponent.new(view_context: view_context, homework: @homework).broadcast_prepend }
        format.html { redirect_to [:admin, :homeworks], notice: "Homework was successfully created." }
      else
        format.turbo_stream { Admin::Table::HomeworkComponent.new(view_context: view_context, homework: @homework).broadcast_replace }
        format.html { render new_admin_homework_path(@homework), status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT admin/homeworks/1
  def update
    respond_to do |format|
      if @homework.update(homework_params)
        format.turbo_stream {
          homework_component = HomeworkComponent.new(view_context: view_context, homework: @homework)
          if @homework.destroyed?
            homework_component.broadcast_remove
          elsif @homework.updated_at == @homework.created_at
            homework_component.broadcast_prepend
          else
            homework_component.broadcast_replace
          end
          @homeworks = Homework.all
          @homework = Homework.new
          render turbo_stream: turbo_stream.replace([:admin, :homeworks], partial: "admin/homeworks/form", locals: {homework: @homework }) 
        }
        format.html { redirect_to [:admin, :homeworks], notice: "Homework was successfully updated." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace([:admin, :homeworks], partial: "admin/homeworks/form", locals: {homework: @homework }) }
        format.html { render :edit, status: :unprocessable_entity }
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
