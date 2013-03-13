module RewardsHelper

def find_employee(project_request_id)
	@employee_id =  RequestSelection.find_by_project_request_id(project_request_id).employee_id
end	

def find_employee_name(employee_id)
	first_name =  Employee.find_by_id(employee_id).employee_name
	last_name =  Employee.find_by_id(employee_id).last_name
	@name = first_name + "  " + last_name
end	

def find_number_of_days(employee_id)
	start_date =  ProjectRequest.find_by_id(employee_id).start_date
	end_date =  ProjectRequest.find_by_id(employee_id).end_date
	@days = (end_date.to_date - start_date.to_date).to_i
end	
def days_array(days)
	@selectdays = []
	(0..days).each do |day|
	@selectdays.push(day) 
	end
end

	

end
