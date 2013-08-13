namespace :db do
  namespace :development do

  desc "Fill database with sample data"
  task :sample_data => :environment do
    require 'populator'
    require 'faker'
    
        
    [Employee, ProjectRequest, Response, Skill, DeveloperSkill, DesiredSkill, RequestSelection].each(&:delete_all)
    skill_array = ['PHP', 'MySQL', 'C+', 'Apache', 'Ruby on Rails', 'SQL Server', 'Linux']
    department = ["IT", "Security", "Programming"]
    group = ["Development", "Interface Design", "QA", "Infrasructure"]
    position = ["Engineer", "Analyst", "Project Lead", "UI Specialist", "QA Specialist"]
    post_once = []
    x = 0
    item = 0
    Skill.populate 7 do |skill|
      skill.language = skill_array.slice(x)
      x += 1
    end
    def rand_time(from, to=Date.now)
        Date.at(rand_in_range(from.to_f, to.to_f))
    end

    128.times do
     e = Employee.new(
      :employee_name  => Faker::Name.first_name,
      :last_name => Faker::Name.last_name,
      :employee_email => Faker::Internet.email,
      :password => "password",
      :password_confirmation => "password",
      :years_with_company => rand(1..9),
      :manager => Faker::Name.name,
      :department => department.sample,
      :group => group.sample,
      :position => position.sample,
      :description => Faker::Lorem.sentences(3).join(" ")
      )
     e.save!
      (1..7).each do |x|
      dev = DeveloperSkill.new(
        :employee_id => e.id,
        :skill_id => x,
        :level => rand(0..4)
      
        )
      dev.save!
      end
      (1..7).each do |x|
       des = DesiredSkill.new(  
        :employee_id => e.id,
        :skill_id => x,
        :level => rand(0..4)
      )
      des.save!
      end
    
    end
  employees = Employee.all
  emp_length = employees.length
  emp_length -= 1
  employee_counter = 0
  while employee_counter != 3 do
    employee_array = rand(0..emp_length)
    employee = employees.slice(employee_array)
      if employee.location.nil?
         employee.location = "Chicago"
         employee.save
         employee_counter += 1
    
   1.times do
    start_date = rand(6.months).ago
    end_date = (start_date + 6.months)
    item = rand(skill_array.length)
    relevant_skill =  skill_array.slice(item, skill_array.length - item)
    post_once << employee.id
    pr = ProjectRequest.new(
        
        :start_date  => start_date,
        :end_date => end_date,
        :title => Faker::Lorem.words(5).join(" ").capitalize,
        :employee_id => employee.id,
        :group => group.sample,
        :office => employee.location,
        :relevant_skill =>  relevant_skill.join(", "),
        :rstatus => 'Active',
        :project_help => Faker::Lorem.sentences(3).join(" ")
        )
    pr.save!
    end
   end
  end
  employee_counter = 0
  while employee_counter != 32 do
    employee_array = rand(0..emp_length)
    employee = employees.slice(employee_array)
      if employee.location.nil?
         employee.location = "Chicago"
         employee.save
         employee_counter += 1
    
    1.times do
    start_date = rand(6.months).ago
    end_date = (start_date + 6.months)
    item = rand(skill_array.length)
    relevant_skill =  skill_array.slice(item, skill_array.length - item)
    
    pr = ProjectRequest.new(
        
        :start_date  => start_date,
        :end_date => end_date,
        :title => Faker::Lorem.words(5).join(" ").capitalize,
        :employee_id => employee.id,
        :office => employee.location,
        :group => group.sample,
        :relevant_skill =>  relevant_skill.join(", "),
        :rstatus => 'Active',
        :project_help => Faker::Lorem.sentences(3).join(" ")
        )
    pr.save!
    end
    end
  end
  employee_counter = 0
  while employee_counter != 10 do
    employee_array = rand(0..emp_length)
    employee = employees.slice(employee_array)
      if employee.location.nil?
         employee.location = "Chicago"
         employee.save
         employee_counter += 1
    end
  end
  employee_counter = 0
  while employee_counter != 20 do
    employee_array = rand(0..emp_length)
    employee = employees.slice(employee_array)
      if employee.location.nil?
         employee.location = "Boston"
         employee.save
         employee_counter += 1
    
    1.times do
    start_date = rand(6.months).ago
    end_date = (start_date + 6.months)
    item = rand(skill_array.length)
    relevant_skill =  skill_array.slice(item, skill_array.length - item)
    pr = ProjectRequest.new(
        :relevant_skill => [],
        :start_date  => start_date,
        :end_date => end_date,
        :title => Faker::Lorem.words(5).join(" ").capitalize,
        :employee_id => employee.id,
        :office => employee.location,
        :group => group.sample,
        :relevant_skill =>  relevant_skill.join(", "),
        :rstatus => 'Active',
        :project_help => Faker::Lorem.sentences(3).join(" ")
        )
    pr.save!
    end
    end
  end
  employee_counter = 0
  while employee_counter != 32 do
    employee_array = rand(0..emp_length)
    employee = employees.slice(employee_array)
      if employee.location.nil?
         employee.location = "Houston"
         employee.save
         employee_counter += 1
      end
  end
   
 employee_counter = 0
  while employee_counter != 14 do
    employee_array = rand(0..emp_length)
    employee = employees.slice(employee_array)
      if employee.location.nil?
         employee.location = "San Francisco"
         employee.save
         employee_counter += 1
    
     3.times do
    start_date = rand(6.months).ago
    end_date = (start_date + 6.months)
    item = rand(skill_array.length)
    relevant_skill =  skill_array.slice(item, skill_array.length - item)
    pr = ProjectRequest.new(
       
        :start_date  => start_date,
        :end_date => end_date,
        :title => Faker::Lorem.words(5).join(" ").capitalize,
        :employee_id => employee.id,
        :group => group.sample,
        :office => employee.location,
        :relevant_skill =>  relevant_skill.join(", "),
        :rstatus => 'Active',
        :project_help => Faker::Lorem.sentences(3).join(" ")
        )
    pr.save!
    end
    end
  end
  employee_counter = 0
  while employee_counter != 1 do
    employee_array = rand(0..emp_length)
    employee = employees.slice(employee_array)
      if employee.location.nil?
         employee.location = "London"
         employee.save
         employee_counter += 1
      
    2.times do
    start_date = rand(6.months).ago
    end_date = (start_date + 6.months)
    item = rand(skill_array.length)
    relevant_skill =  skill_array.slice(item, skill_array.length - item)
    pr = ProjectRequest.new(
       
        :start_date  => start_date,
        :end_date => end_date,
        :title => Faker::Lorem.words(5).join(" ").capitalize,
        :employee_id => employee.id,
        :group => group.sample,
        :office => employee.location,
        :relevant_skill =>  relevant_skill.join(", "),
        :rstatus => 'Active',
        :project_help => Faker::Lorem.sentences(3).join(" ")
        )
    pr.save!
    end
    end
  end
  employee_counter = 0
  while employee_counter != 11 do
    employee_array = rand(0..emp_length)
    employee = employees.slice(employee_array)
      if employee.location.nil?
         employee.location = "London"
         employee.save
         employee_counter += 1
    end
  end
  employee_counter = 0
  while employee_counter != 4 do
    employee_array = rand(0..emp_length)
    employee = employees.slice(employee_array)
      if employee.location.nil?
         employee.location = "Mumbai"
         employee.save
         employee_counter += 1
    end
  end
  employee_counter = 0
  while employee_counter != 1 do
    employee_array = rand(0..emp_length)
    employee = employees.slice(employee_array)
      if employee.location.nil?
         employee.location = "Mumbai"
         employee.save
         employee_counter += 1
    
    1.times do
    start_date = rand(6.months).ago
    end_date = (start_date + 6.months)
    item = rand(skill_array.length)
    relevant_skill =  skill_array.slice(item, skill_array.length - item)
    pr = ProjectRequest.new(
        
        :start_date  => start_date,
        :end_date => end_date,
        :title => Faker::Lorem.words(5).join(" ").capitalize,
        :employee_id => employee.id,
        :group => group.sample,
        :office => employee.location,
        :relevant_skill =>  relevant_skill.join(", "),
        :rstatus => 'Active',
        :project_help => Faker::Lorem.sentences(3).join(" ")
        )
    pr.save!
    end
    end
  end
    
  ten_times_counter = 0
  employees.each do |employee|
    if employee.id != post_once.slice(0) && employee.id != post_once.slice(1) 
      if employee.id != post_once.slice(2) && employee.location != "Houston"
        if employee.location != "London"
        ten_times_counter += 1
        10.times do
        start_date = rand(6.months).ago
        end_date = (start_date + 6.months)
        item = rand(skill_array.length)
        relevant_skill =  skill_array.slice(item, skill_array.length - item)
        pr = ProjectRequest.new(
          
          :start_date  => start_date,
          :end_date => end_date,
          :title => Faker::Lorem.words(5).join(" ").capitalize,
          :employee_id => employee.id,
          :group => group.sample,
          :office => employee.location,
          :relevant_skill =>  relevant_skill.join(", "),
          :rstatus => 'Active',
          :project_help => Faker::Lorem.sentences(3).join(" ")
         )
        pr.save!
        end
      end
      end
    end
    if ten_times_counter == 2
      break
    end
  end
  employees = Employee.all
  project_requests = ProjectRequest.all
  project_requests.each do |project_request|
    project_request.update_attribute :created_at, rand(6.months).ago
  end
 
  emp_length = employees.length
  response_counter = 0
  self_counter = 0
  office_counter = 0
  local_selection = 0
  selection_counter = 0
  project_requests.each do |project_request|
      if project_request.office == "London"
        3.times do
        re = Response.new(
          :project_request_id => project_request.id,
          :message => Faker::Lorem.words(5).join(" ").capitalize,
          :employee_id => rand(1..emp_length),
          :created_at => project_request.start_date + 1.day,
         )
        re.save!
        response_counter += 1
        end
      end
    end
  personal_selection = 0
  project_requests.each do |project_request|
    if project_request.office != "Mumbai" && project_request.office != "London"
      x = rand(0..emp_length - 1)
      emp_id = employees.slice(x).id
      if emp_id == project_request.employee_id
        re = Response.new(
          :project_request_id => project_request.id,
          :message => Faker::Lorem.words(5).join(" ").capitalize,
          :employee_id => emp_id,
          :created_at => project_request.start_date + 2.days,
        )
        re.save!       
        response_counter += 1
        self_counter += 1
        if personal_selection == 0
             rs = RequestSelection.new(
                    :employee_id => emp_id,
                    :project_request_id => project_request.id,
                    :response_id => re.id,
                    :comment => Faker::Lorem.words(5).join(" ").capitalize,
                    :created_at => re.created_at,
                  )
                  rs.save!
                  personal_selection += 1
                  selection_counter += 1
                  project_request.request_status = 1
                  project_request.save
                  
                end
      end
        if self_counter == 2
          break
        end
    end
  end
 
    project_requests.each do |project_request|
        if project_request.office != "Mumbai" && project_request.request_status != 1
          x = rand(0..emp_length - 1)
          emp_location = employees.slice(x).location
          emp_id = employees.slice(x).id
          if emp_location == project_request.office 
                re = Response.new(
                  :project_request_id => project_request.id,
                  :message => Faker::Lorem.words(5).join(" ").capitalize,
                  :employee_id => emp_id,
                  :created_at => project_request.start_date + 4.days,
                )
                re.save!
                response_counter += 1
                office_counter += 1
                if local_selection <= 7
                 rs = RequestSelection.new(
                    :employee_id => emp_id,
                    :project_request_id => project_request.id,
                    :response_id => re.id,
                    :comment => Faker::Lorem.words(5).join(" ").capitalize,
                    :created_at => re.created_at + 3,
                  )
                  rs.save!
                  local_selection += 1
                  selection_counter += 1
                  project_request.request_status = 1
                  project_request.save
                  
                end
          end
          if office_counter == 9
            break
          end
        end
    end

  if response_counter <= 70
    project_requests.each do |project_request|
      if project_request.office != "Mumbai" 
        if project_request != "London"
            x = rand(0..emp_length - 1)
            emp_id = employees.slice(x).id
                re = Response.new(
                  :project_request_id => project_request.id,
                  :message => Faker::Lorem.words(5).join(" ").capitalize,
                  :employee_id => emp_id,
                  :created_at => project_request.start_date + 8.days,
                )
              re.save!
              response_counter += 1
        end
      end
        if response_counter == 70
            break
        end
    end
  end
    responses = Response.all
    if selection_counter < 50
      responses.each do |response|
        if response.project_request.request_status != 1
          rs = RequestSelection.new(
            :employee_id => response.employee_id,
            :project_request_id => response.project_request_id,
            :response_id => response.id,
            :comment => Faker::Lorem.words(5).join(" ").capitalize,
            :created_at => response.created_at + 5,
             )
                  rs.save!
                  selection_counter += 1
                  project_request = ProjectRequest.find(response.project_request_id)
                  project_request.request_status = 1
                  project_request.save
          if selection_counter == 50
            break
          end
        end
      end
    end
    project_requests = ProjectRequest.all
     request_counter = 0
    project_requests.each do |project_request|
    if project_request.request_status != 1
      project_request.update_attribute :rstatus, 'Cancel'
      request_counter += 1
    end
    if request_counter == 8
      break
    end
  end
  end

  end
end
  