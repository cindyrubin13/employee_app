module ProjectRequestsHelper
def current_skill_score(rel_skill)
	
	
	@developer_skills.each do |dev_skill|
		language = Skill.find_by_id(dev_skill.skill_id).language
			
				if language == rel_skill
					@emp_skills.push(language)
					@emp_skills.push(dev_skill.level)
					@skill_score.push(dev_skill.level)
					break
				end
			
	end

@skill_score
@emp_skills
end
	
end
