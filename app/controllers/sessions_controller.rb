class SessionsController < ApplicationController

def new
end

def create

	employee = Employee.find_by_employee_email(params[:session][:employee_email].downcase)
  if employee &&  employee.authenticate(params[:session][:password])
    
      sign_in employee
      redirect_to project_requests_path

    # Sign the user in and redirect to the user's show page.
  else
  	flash.now[:error] = 'Invalid email/password combination' # Not quite right!
    flash.now[:error] = "Invalid email/password combination: email #{params[:session][:employee_email].downcase}  employee #{employee} password #{params[:session][:password]}"

    

      render 'new'

    # Create an error message and re-render the signin form.
  end

 

end

def destroy
	sign_out 
    redirect_to root_url
end








end
