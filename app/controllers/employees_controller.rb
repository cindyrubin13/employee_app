class EmployeesController < ApplicationController

   before_filter :signed_in_employee, only: [:index, :edit, :update]
   before_filter :signed_in_employee, only: [:edit, :update]
   before_filter :correct_employee, only: [:edit, :update] 


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
     @current_date = DateTime.now
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
    current_skill = params[:current_skill]
    if !params[:current_skill].nil?
   current_skill = @employee.current_skill.split(", ")
   #@current_skills = (params[:current_skill].present? ? params[:current_skill] : [])
    end   
   skills_interested_in = params[:skills_interested_in]
   if !params[:skills_interested_in].nil?
   skills_interested_in = @employee.skills_interested_in.split(", ")
   #@skills_interested_in = Employee.where("skills_interested_in IN (?)", params[:skills_interested_in])
    end




  end

  # POST /employees
  # POST /employees.json
  def create

    @employee = Employee.new(params[:employee])
      @skills = Skill.all
    current_skill = params[:current_skill]
    @employee.current_skill = current_skill.join(", ")
 
   skills_interested_in = params[:skills_interested_in]
   @employee.skills_interested_in = skills_interested_in.join(", ")
      if @employee.save
       
         sign_in @employee
         flash[:success] = "Welcome to Employee App"

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
    #params[:current_skill][:skill_languages]  ||= []
   #@employee.current_skill = (params[:current_skill].present? ? params[:current_skill] : [])
   #current_skill = params[:current_skill]
   # @employee.current_skill = current_skill.join(", ")
   @employee.current_skill = params[:current_skill]
   # skills_interested_in = params[:skills_interested_in]
   #@employee.skills_interested_in = skills_interested_in.join(", ")#@employee.current_skill = current_skill.join(", ")
   #@current_skill = params[:current_skill]
     #params[:current_skill] ||= []
    #current_skill = params[:current_skill]
    #@employee.current_skill = current_skill.join(", ")
@employee.skills_interested_in = params[:skills_interested_in]
   #@employee.skills_interested_in = params[:skills_interested_in]
   #@employee.skills_interested_in = skills_interested_in.join(", ")
     if @employee.update_attributes(params[:employee])
        flash[:success] = "Profile updated"
        
        sign_in @employee
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
