class Admin::Homeworks::EventsController < Admin::Homeworks::ApplicationController
  before_action :set_events
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET admin/homeworks/1/events
  def index
  end

  # GET admin/homeworks/1/events/1
  def show
  end

  # GET admin/homeworks/1/events/new
  def new
    @event = @events.new
  end

  # GET admin/homeworks/1/events/1/edit
  def edit
  end

  # POST admin/homeworks/1/events
  def create
    @event = @events.new(event_params)
    @event.creator = @current_user
    respond_to do |format|
      if @event.save
        format.turbo_stream
        format.html { redirect_to [:admin, @homework, @event], notice: "Event was successfully created." }
        format.json { render admin_homework_event_path(@homework, @event), status: :created, location: [:admin, @homework, @event] }
      else
        format.html { render new_admin_homework_event_path(@homework, @event), status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT admin/homeworks/1/events/1
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to [:admin, @homework, @event], notice: "Event was successfully updated." }
        format.json { render admin_homework_event_path(@homework, @event), status: :ok, location: [:admin, @homework, @event] }
      else
        format.html { render edit_admin_homework_event_path(@homework, @event), status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE admin/homeworks/1/events/1 or admin/homeworks/1/events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_homework_events_path(@homework), notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_events
      @events = @homework.events
    end
    
    def set_event
      @event = @events.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :description, :start_date, :end_date, :is_full_event, :is_recurring, :parent_event_id, :assignee_ids => [], :manager_ids => [])
    end
end
