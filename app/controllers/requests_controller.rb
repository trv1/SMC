class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    if @current_user.role==0
      @requests = Request.where(user_id: @current_user.id)
    else
      @requests = Request.all
    end
  end
  @@i=0
  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @@i+=1
    @request = Request.new
    @request.polyclinic = Polyclinic.where(id: params[:polyclinic_id]).first
    @request.post = Post.where(id: params[:post_id]).first
    @request.schedule = Schedule.where(id: params[:schedule_id]).first
    @request.routine = Routine.where(id: params[:routine_id]).first
    @request.user = User.where(id: session[:user_id]).first
    if Request.count == 0
      @request.number = @@i
    else
      @request.number = (Request.last.number.to_i+1).to_s
    end
    @request.date = Time.now
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @@i+=1
    #raise @polyclinic.inspect
    @request = Request.new(request_params)
    Request.all.to_a.each do |r|
      if @request.polyclinic.id == r.polyclinic.id && @request.post.id == r.post.id && @request.schedule.id == r.schedule.id && @request.routine.id == r.routine.id
        flash[:danger]="Заявка с такими параметрами уже существует"
        redirect_to root_path
        return false
      end
    end
    @request.user = User.where(id: session[:user_id]).first
    if Request.count == 0
      @request.number = @@i
    else
      @request.number = (Request.last.number.to_i+1).to_s
    end
    @request.date = Time.now
    
    respond_to do |format|
      if @request.save
        format.html { redirect_to root_path, notice: 'Request was successfully created.' }
        #format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:number, :polyclinic_id, :post_id, :routine_id, :schedule_id, :user_id, :date)
    end
end
