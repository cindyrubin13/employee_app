module EmployeesHelper
	# Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(employee, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(employee.employee_email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: employee.employee_name, class: "gravatar")
  end



def show_skill_and_level(skill_level)
       
        if skill_level.level != 0
        
         
         language = Skill.find_by_id(skill_level.skill_id).language
         level = skill_level.level
         @skillname.push(language)
         @skillname.push(level)

       end
 end
    

end