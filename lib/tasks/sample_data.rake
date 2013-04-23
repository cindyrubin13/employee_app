namespace :db do

  desc "Fill database with sample data"
  task populate: :environment do
    require 'populator'
    require 'faker'
   
        
    [Employee, ProjectRequest, Response, Skill, DeveloperSkill, DesiredSkill, RequestSelection].each(&:delete_all)
    skill_array = ['PHP', 'MySQL', 'C+', 'Apache', 'Ruby on Rails', 'SQL Server', 'Linux']
   
    x = 0
    item = 0
    Skill.populate 7 do |skill|
      skill.language = skill_array.slice(x)
      x += 1
    end
    Employee.populate 1 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'Chicago'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
      ProjectRequest.populate  1 do |project_request|
        project_request.relevant_skill = []
        project_request.start_date  = rand(6.months).ago
        project_request.end_date = project_request.start_date + 6.months
        project_request.title = Populator.words(1..5).titleize
        project_request.group = employee.group
        project_request.office = 'Chicago'
        project_request.employee_id = employee.id
        item = rand(skill_array.length)
        project_request.relevant_skill =  skill_array.slice(item, skill_array.length - item)
        project_request.project_help = Populator.sentences(1..3)
      end
  end
  request_selection_counter = 0
    Employee.populate 2 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'Chicago'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
      ProjectRequest.populate  1 do |project_request|
         project_request.relevant_skill = []
        project_request.start_date  = rand(6.months).ago
        project_request.end_date = project_request.start_date + 6.months
        project_request.title = Populator.words(1..5).titleize
        project_request.group = employee.group
        item = rand(skill_array.length)
        project_request.relevant_skill =  skill_array.slice(item, skill_array.length - item)
        project_request.office = 'Chicago'
        project_request.employee_id = employee.id
        project_request.project_help = Populator.sentences(1..3)
         Response.populate 1 do |response|
          response.employee_id = employee.id
          response.project_request_id = project_request.id
          response.message = Populator.sentences(1..3)
          response.status = 1
           if request_selection_counter != 1
                request_selection_counter += 1
                RequestSelection.populate 1 do |request_selection|
                  request_selection.employee_id = employee.id
                  request_selection.project_request_id = project_request.id
                  request_selection.response_id = response.id
                  project_request.request_status = 1
                end
              end
        end
      end
    end
    Employee.populate 11 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'Chicago'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
    end

    Employee.populate 16 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'Chicago'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
      ProjectRequest.populate  1 do |project_request|
         project_request.relevant_skill = []
        project_request.start_date  = rand(6.months).ago
        project_request.end_date = project_request.start_date + 6.months
        project_request.title = Populator.words(1..5).titleize
        project_request.group = employee.group
        item = rand(skill_array.length)
        project_request.relevant_skill =  skill_array.slice(item, skill_array.length - item)
        project_request.office = 'Chicago'
        project_request.employee_id = employee.id
        project_request.project_help = Populator.sentences(1..3)
      end
    end
    
   Employee.populate 13 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'Chicago'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
    end

    Employee.populate 2 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'Chicago'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
      ProjectRequest.populate  3 do |project_request|
         project_request.relevant_skill = []
        project_request.start_date  = rand(6.months).ago
        project_request.end_date = project_request.start_date + 6.months
        project_request.title = Populator.words(1..5).titleize
        project_request.group = employee.group
        item = rand(skill_array.length)
        project_request.relevant_skill =  skill_array.slice(item, skill_array.length - item)
        project_request.office = 'Boston'
        project_request.employee_id = employee.id
        project_request.project_help = Populator.sentences(1..3)
        Response.populate 1 do |response|
          response.employee_id = rand(Employee.count)
          response.project_request_id = project_request.id
          response.message = Populator.sentences(1..3)
          response.status = 1
        end
      end

    end
Employee.populate 8 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'Boston'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
      ProjectRequest.populate  4 do |project_request|
         project_request.relevant_skill = []
        project_request.start_date  = rand(6.months).ago
        project_request.end_date = project_request.start_date + 6.months
        project_request.title = Populator.words(1..5).titleize
        project_request.group = employee.group
        item = rand(skill_array.length)
        project_request.relevant_skill =  skill_array.slice(item, skill_array.length - item)
        project_request.office = 'Boston'
        project_request.employee_id = employee.id
        project_request.project_help = Populator.sentences(1..3)
      
      end
    end
    Employee.populate 2 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'Boston'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
      ProjectRequest.populate  11 do |project_request|
         project_request.relevant_skill = []
        project_request.start_date  = rand(6.months).ago
        project_request.end_date = project_request.start_date + 6.months
        project_request.title = Populator.words(1..5).titleize
        project_request.group = employee.group
        item = rand(skill_array.length)
        project_request.relevant_skill =  skill_array.slice(item, skill_array.length - item)
        project_request.office = employee.location
        project_request.employee_id = employee.id
        project_request.project_help = Populator.sentences(1..3)
        
    end
  end
     Employee.populate 10 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'Boston'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
       ProjectRequest.populate  1 do |project_request|
         project_request.relevant_skill = []
        project_request.start_date  = rand(6.months).ago
        project_request.end_date = project_request.start_date + 6.months
        project_request.title = Populator.words(1..5).titleize
        project_request.group = employee.group
        item = rand(skill_array.length)
        project_request.relevant_skill =  skill_array.slice(item, skill_array.length - item)
        project_request.office = employee.location
        project_request.employee_id = employee.id
        project_request.project_help = Populator.sentences(1..3)
        Response.populate 1 do |response|
              response.employee_id = rand(Employee.count)
              response.project_request_id = project_request.id
              response.message = Populator.sentences(1..3)
              response.status = 1
        end
      end
    end
    
     Employee.populate 32 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'Houston'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
    end
     Employee.populate 12 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'San Francisco'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end 
       ProjectRequest.populate  1 do |project_request|
         project_request.relevant_skill = []
        project_request.start_date  = rand(6.months).ago
        project_request.end_date = project_request.start_date + 6.months
        project_request.title = Populator.words(1..5).titleize
        project_request.group = employee.group
        item = rand(skill_array.length)
        project_request.relevant_skill =  skill_array.slice(item, skill_array.length - item)
        project_request.office = employee.location
        project_request.employee_id = employee.id
        project_request.project_help = Populator.sentences(1..3)
        Response.populate 1 do |response|
          response.employee_id = rand(Employee.count)
          response.project_request_id = project_request.id
          response.message = Populator.sentences(1..3)
          response.status = 1
        end
        
      end
    end
    
    Employee.populate 2 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'San Francisco'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
      ProjectRequest.populate  4 do |project_request|
         project_request.relevant_skill = []
        project_request.start_date  = rand(6.months).ago
        project_request.end_date = project_request.start_date + 6.months
        project_request.title = Populator.words(1..5).titleize
        project_request.group = employee.group
        item = rand(skill_array.length)
        project_request.relevant_skill =  skill_array.slice(item, skill_array.length - item)
        project_request.office = employee.location
        project_request.employee_id = employee.id
        project_request.project_help = Populator.sentences(1..3)
        Response.populate 1 do |response|
          response.employee_id = rand(Employee.count)
          response.project_request_id = project_request.id
          response.message = Populator.sentences(1..3)
          response.status = 1
        end
        
      end
    end
     Employee.populate 2 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'London'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
      ProjectRequest.populate  3 do |project_request|
        project_request.relevant_skill = []
        project_request.start_date  = rand(6.months).ago
        project_request.end_date = project_request.start_date + 6.months
        project_request.title = Populator.words(1..5).titleize
        project_request.group = employee.group
        item = rand(skill_array.length)
        project_request.relevant_skill =  skill_array.slice(item, skill_array.length - item)
        project_request.office = employee.location
        project_request.employee_id = employee.id
        project_request.project_help = Populator.sentences(1..3)
        
      end
    end
    Employee.populate 10 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'London'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
    end
    Employee.populate  1 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'Mumbai'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
      ProjectRequest.populate  5 do |project_request|
         project_request.relevant_skill = []
        project_request.start_date  = rand(6.months).ago
        project_request.end_date = project_request.start_date + 6.months
        project_request.title = Populator.words(1..5).titleize
        project_request.group = employee.group
        item = rand(skill_array.length)
        project_request.relevant_skill =  skill_array.slice(item, skill_array.length - item)
        project_request.office = employee.location
        project_request.employee_id = employee.id
        project_request.project_help = Populator.sentences(1..3)
        
      end
    end
    Employee.populate   4 do |employee|
      employee.employee_name  = Faker::Name.first_name
      employee.last_name = Faker::Name.last_name
      employee.employee_email = Faker::Internet.email
      employee.password = 'password'
      employee.password_confirmation = 'password'
      employee.location = 'Mumbai'
      employee.years_with_company = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
      employee.manager = Faker::Name.name
      employee.department = ['IT', 'Security' 'Programming']
      employee.group = ['Development', 'Interface Design', 'QA', 'Infrasructure']
      employee.position = ['Engineer', 'Analyst', 'Project Lead', 'UI Specialist', 'QA Specialist']
      employee.description = Populator.sentences(2..4)
      DeveloperSkill.populate 7 do |developer_skill|
        developer_skill.employee_id = employee.id
        developer_skill.skill_id = rand(1..7)
        developer_skill.level = rand(0..4)
      end
      DesiredSkill.populate 7 do |desired_skill|
        desired_skill.employee_id = employee.id
        desired_skill.skill_id = rand(1..7)
        desired_skill.level = rand(0..4)
      end
    end
   
    project_requests = ProjectRequest.find_all_by_office('London')
    project_requests.each do |project_request|
    Response.populate 3 do |response|
          response.employee_id = rand(Employee.count)
          response.project_request_id = project_request.id
          response.message = Populator.sentences(1..3)
          response.status = 1
        end
      end
    request_selection_counter = 0
    response_counter = 0
    employees = Employee.all
    project_requests = ProjectRequest.all
    employees.each do |employee|
      project_requests.each do |project_request|
        if response_counter != 9
          if project_request.office != 'Mumbai'
            if employee.location == project_request.office
              Response.populate 1 do |response|
              response.employee_id = employee.id
              response.project_request_id = project_request.id
              response.message = Populator.sentences(1..3)
              response.status = 1
              response_counter += 1
              if request_selection_counter != 7
                request_selection_counter += 1
                RequestSelection.populate 1 do |request_selection|
                  request_selection.employee_id = employee.id
                  request_selection.project_request_id = project_request.id
                  request_selection.response_id = response.id
                  project_request.request_status = 1
                  project_request.save
                end
              end
              end
            end
          end 
        end
      end
    end
    response_counter = 0
    even_number = 0
    employees.each do |employee|
      project_requests.each do |project_request|
        if response_counter != 5
          if project_request.office != 'Mumbai'
            if employee.location != project_request.office
              Response.populate 1 do |response|
              response.employee_id = rand(Employee.count)
              response.project_request_id = project_request.id
              response.message = Populator.sentences(1..3)
              response.created_at = project_request.created_at + even_number.days
              response.status = 1
              response_counter += 1
              even_number += 2
              end
            end
          end 
        end
      end
    end
    selection_counter = 0
    while selection_counter <= 41 do
      response = rand(Response.count)
      if response != 0
        response = Response.find(response)
        project_request = ProjectRequest.find(response.project_request_id)
        if project_request.request_status != 1
          project_request.request_status = 1
          project_request.save
          RequestSelection.populate 1 do |request_selection|
            request_selection.employee_id = response.employee_id
            request_selection.project_request_id = response.project_request_id
            request_selection.response_id = response.id
            selection_counter += 1
          end
        end
      end
    end
    
  end
end
  
     