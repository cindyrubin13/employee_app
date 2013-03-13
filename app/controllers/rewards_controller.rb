class RewardsController < ApplicationController
  # GET /rewards
  # GET /rewards.json
  def index
    @employee = Employee.find(params[:employee_id])
    #@project_request = ProjectRequest.find(params[:project_request_id])
    #@response = Response.find(params[:response_id])
     @current_date = DateTime.now
    @rewards = Reward.all
    @skills = Skill.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rewards }
    end
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
   # @project_request = ProjectRequest.find(params[:project_request_id])
     @current_date = DateTime.now
     @skills = Skill.all
    @employee = Employee.find(params[:employee_id])
   # @response = Response.find(params[:response_id])
   @reward = Reward.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reward }
    end
  end

  # GET /rewards/new
  # GET /rewards/new.json
  def new
    #@project_request = ProjectRequest.find(params[:project_request_id])
  @employee = Employee.find(params[:employee_id])
    @current_date = DateTime.now
    @reward = @employee.rewards.build
     @skills = Skill.all
   # @employee = Response.find(params[:employee_id])
    #@reward = Response.find(params[:response_id])
   
    #@reward = @response.rewards.build
   # @reward = Reward.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reward }
    end
  end

  # GET /rewards/1/edit
  def edit
    #@project_request = ProjectRequest.find(params[:project_request_id])
     @employee = Employee.find(params[:employee_id])
    # @response = Response.find(params[:response_id])
    @reward = Reward.find(params[:id])
     @skills = Skill.all
      @current_date = DateTime.now
  end

  # POST /rewards
  # POST /rewards.json
  def create
   # @project_request = ProjectRequest.find(params[:project_request_id])
    @employee = Employee.find(params[:employee_id])
    @reward = @employee.rewards.build(params[:reward])
  
    @skills = Skill.all
     @current_date = DateTime.now
   # @response = Response.find(params[:response_id])
   # @reward = @response.rewards.build(params[:reward])
    #@reward = Reward.new(params[:reward])

    respond_to do |format|
      if @reward.save
       
        format.html { redirect_to project_requests_path }
        format.json { render json: @reward, status: :created, location: @reward }
      else
        format.html { render action: "new" }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rewards/1
  # PUT /rewards/1.json
  def update
     #@project_request = ProjectRequest.find(params[:project_request_id])
    @employee = Employee.find(params[:employee_id])
    @reward = Reward.find(params[:id])
     @skills = Skill.all
      @current_date = DateTime.now

    respond_to do |format|
      if @reward.update_attributes(params[:reward])
       
        format.html { redirect_to @reward, notice: 'Reward was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1
  # DELETE /rewards/1.json
  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy

    respond_to do |format|
      format.html { redirect_to rewards_url }
      format.json { head :no_content }
    end
  end
end
