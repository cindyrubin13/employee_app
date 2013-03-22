module RewardsHelper



def find_number_of_days(project_request_id)
	start_date =  ProjectRequest.find_by_id(project_request_id).start_date
	end_date =  ProjectRequest.find_by_id(project_request_id).end_date
   (end_date.to_date - start_date.to_date).to_i
end	


def days_array(days)
	(0..days).each do |day| 
	end
end

	

end
