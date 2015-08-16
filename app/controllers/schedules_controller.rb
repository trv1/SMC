class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  #before_action :set_post, only: [:new, :create]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.includes(:polyclinic, :post, :routines).load
.where(polyclinic_id: params[:polyclinic_id], post_id: params[:post_id])
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new(polyclinic_id: params[:polyclinic_id], post_id: params[:post_id])
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        for j in 0...@schedule.time_end.to_i-@schedule.time_begin.to_i
          if j%900==0
            Routine.create(polyclinic_id: @schedule.polyclinic_id, post_id: @schedule.post_id, schedule_id: @schedule.id, timing: @schedule.time_begin+j)
          end
        end
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end
    
    def set_post
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:polyclinic_id, :post_id, :doctor_id, :scheduleday, :cabinet, :time_begin, :time_end)
    end
end
