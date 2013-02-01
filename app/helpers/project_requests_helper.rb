module ProjectRequestsHelper

def compare_current_skill_of_current_employee_with_relevant_skills_of_each_request(current_skill, relevant_skill)
	 @common_skill = Array.new

   
     if !current_skill.nil?
        current_skill = current_skill.split(", ")
      end
    
    
    if !relevant_skill.nil?
      relevant_skill = relevant_skill.split(", ")
    end

    @common_skill = current_skill & relevant_skill
    @score_common1 = @common_skill.length
    @common_skill = @common_skill.join(", ")

end

  def compare_skills_interested_of_current_employee_with_relevant_skills_of_each_request(interested_skills, relevant_skill) 

  	@common2_skill = Array.new

   
     if !interested_skills.nil?
        interested_skills = interested_skills.split(", ")
      end
    
    
    if !relevant_skill.nil?
      relevant_skill = relevant_skill.split(", ")
    end

    @common2_skill = interested_skills & relevant_skill
    @score_common2 = @common2_skill.length
    @common2_skill = @common2_skill.join(", ")


  end




	
end
