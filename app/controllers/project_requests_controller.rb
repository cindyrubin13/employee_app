class ProjectRequestsController < ApplicationController
  before_filter :signed_in_employee, only: [:create, :destroy]
  def my_requests
     @project_requests = ProjectRequest.find_all_by_employee_id(current_employee)
     @rewards = Reward.all
     @evaluations = Evaluation.all
     @responses = Response.all
     @request_selections = RequestSelection.all
     @current_date = DateTime.now
 
  end
     
   

 

  # GET /project_requests
  # GET /project_requests.json
  def index
    @project_requests = ProjectRequest.all
    @request_selections = RequestSelection.all

    @responses = Response.find(:all, :conditions => :project_request_id == :id)
    @employee = Employee.all
    @developer_skills = DeveloperSkill.find_all_by_employee_id(current_employee.id)
    @desired_skills = DesiredSkill.find_all_by_employee_id(current_employee.id)
    @skills = Skill.all

     @current_date = DateTime.now
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_requests }
    end
  end

  # GET /project_requests/1
  # GET /project_requests/1.json
  def show
   
    @project_request = ProjectRequest.find_by_employee_id(current_employee)
    @current_date = DateTime.now
    if  @project_request.nil?
        flash[:error] = "No Project Requests have been posted for you"
        redirect_to employee_path(current_employee)
    end


   
  end

  # GET /project_requests/new
  # GET /project_requests/new.json
  def new
    @project_request = ProjectRequest.new
     @skills = Skill.all
     @current_date = DateTime.now
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_request }
    end
  end

  # GET /project_requests/1/edit
  def edit
    @project_request = ProjectRequest.find(params[:id])
     @current_date = DateTime.now
     @skills = Skill.all

    relevant_skill = params[:relevant_skill]

    if !params[:relevant_skill].nil?
      relevant_skill = @project_request.relevant_skill.split(", ")
    end   


  end

  # POST /project_requests
  # POST /project_requests.json
  def create
    
     @project_request = current_employee.project_requests.build(params[:project_request])
     @current_date = DateTime.now
     @project_request.relevant_skill = params[:relevant_skill].to_a
     @project_request.relevant_skill = @project_request.relevant_skill.join(", ")
     @skills = Skill.all
    if @project_request.save
     
      redirect_to project_requests_path
    else
      redirect_to new_project_request_path(@project_request)
     
      
    end

   
  end

  # PUT /project_requests/1
  # PUT /project_requests/1.json
  def update
    @project_request = ProjectRequest.find(params[:id])
    @current_date = DateTime.now

    @project_request.relevant_skill = params[:relevant_skill].to_a
    @project_request.relevant_skill = @project_request.relevant_skill.join(", ")
    @skills = Skill.all 
    respond_to do |format|
      if @project_request.update_attributes(params[:project_request])
        @project_request.update_request_status(@project_request) 
        format.html { redirect_to _my_requests_path }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_requests/1
  # DELETE /project_requests/1.json
  def destroy
   @project_request = ProjectRequest.find(params[:id])
   @project_request.delete
     
    respond_to do |format|
      format.html { redirect_to my_requests_url }
      format.json { head :no_content }
    end
  end
end
