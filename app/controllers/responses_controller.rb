class ResponsesController < ApplicationController
  # GET /responses
  
  def my_requests
     @my_requests = ProjectRequest.find_all_by_employee_id(current_employee)
      @responses = Response.find_all_by_employee_id(current_employee)
  end
# GET /responses.json
  def index
  
 @project_request = ProjectRequest.find(params[:project_request_id])
 @responses = @project_request.responses
  @current_date = DateTime.now


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responses }
    end
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
   
  
   @project_request = ProjectRequest.find(params[:project_request_id])
   
   @response = Response.find(params[:id])
     @current_date = DateTime.now

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @response }
    end
  end

  # GET /responses/new
  # GET /responses/new.json
  def new
   
    @project_request = ProjectRequest.find(params[:project_request_id])
   
    @response = @project_request.responses.build
    
     @current_date = DateTime.now
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response }
    end
  end

  # GET /responses/1/edit
  def edit
        @project_request = ProjectRequest.find(params[:project_request_id])
        @current_date = DateTime.now
         @response = Response.find(params[:id])
  end

  # POST /responses
  # POST /responses.json
  def create
   @project_request = ProjectRequest.find(params[:project_request_id])
    @response = @project_request.responses.build(params[:response])
   
    @employees = Employee.all
    @current_date = DateTime.now

    respond_to do |format|
      if @response.save
       
        # format.html { redirect_to project_request_responses_path @project_request, notice: 'Response was successfully created.' }
        format.html { redirect_to project_requests_path, notice: 'Response was successfully created.' }
        format.json { render json: @response, status: :created, location: @response }
      else
        format.html { render action: "new" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
   end
  end

  # PUT /responses/1
  # PUT /responses/1.json
  def update

    @project_request = ProjectRequest.find(params[:project_request_id])
   
   @response = Response.find(params[:id])
     @current_date = DateTime.now
    respond_to do |format|
      if @response.update_attributes(params[:response])
        format.html { redirect_to project_request_response_path(@project_request, @response), notice: 'Response was successfully updated.' }
        
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @project_request = ProjectRequest.find(params[:project_request_id])
    
    @response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to project_request_responses_path(@project_request) }
    
      format.json { head :no_content }
    end
  end
end
