class EmployeesController < ApplicationController
   include EmployeesHelper
   before_filter :signed_in_employee, only: [:index, :edit, :update]
   before_filter :signed_in_employee, only: [:edit, :update]
   before_filter :correct_employee, only: [:edit, :update] 

  def my_requests
      @project_requests = ProjectRequest.find_all_by_employee_id(current_employee)
      @responses = Response.find_all_by_project_request_id(@project_requests)
      @request_selections = RequestSelection.find_all_by_project_request_id(@project_requests)
      @current_date = DateTime.now
  end



  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
    @project_requests = ProjectRequest.all
    @request_selections = RequestSelection.all
    @current_date = DateTime.now
   
    @skills = Skill.all
    
      

     respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new

    @employee = Employee.new
    @skills = Skill.all




    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
    @skills = Skill.all
    
  end

  # POST /employees
  # POST /employees.json
  def create

    @employee = Employee.new(params[:employee])
    @skills = Skill.all
   
      if @employee.save
         sign_in @employee
         @employee.to_developer_skills(@employee.current_skills)
         @employee.to_desired_skills(@employee.skills_interested_in)
         
         redirect_to @employee
      else
        render 'new'
      end
     
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
   @employee = Employee.find(params[:id])
   @skills = Skill.all
    
     if @employee.update_attributes(params[:employee])
        sign_in @employee
         @employee.to_developer_skills(@employee.current_skills)
         @employee.to_desired_skills(@employee.skills_interested_in)
        redirect_to @employee
      else
        render 'edit'
      end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  private
  
   def correct_employee
      @employee = Employee.find(params[:id])
      redirect_to(root_path) unless current_employee?(@employee)
    end




end
