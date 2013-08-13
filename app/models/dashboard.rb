class Dashboard < ActiveRecord::Base
  # attr_accessible :title, :body

  def select_all(report)
  	 ActiveRecord::Base.connection.select_all(report)
  end
  def project_request_report

   select_all("select  strftime('%m/%d/%Y', p.created_at) as posted_date,
	 p.title, p.office, e.employee_name, e.last_name
	 from project_requests p 
	 left outer join request_selections rs on p.id = rs.project_request_id
	 left outer join employees e on rs.employee_id=e.id order by office,
 	 strftime('%Y%m%d', p.created_at) asc") 
  
  end

  def overall_report
  	 select_all("select created_date, sum(request_count) as requests, 
 	sum(c_requests) as canceled_requests,   
 	sum(response_count) as has_responses,   
 	sum(selection_count) as has_selections  
 	   from (select p.id, count(distinct p.id) as request_count,   
 	   strftime('%Y-%m', p.created_at) as created_date,   
 	    (select count(p.rstatus) where p.rstatus= 'Cancel') as c_requests,   
 	        CASE WHEN (count(r.id) = 0) THEN 0 ELSE 1 END as response_count,  
 	        CASE WHEN count(rs.id) = 0 THEN 0 ELSE 1 END as selection_count   
 	            from  project_requests p 
 	            left outer join responses r on p.id = r.project_request_id   
 	            left outer join request_selections rs on r.id = rs.response_id        
 	    where datetime(p.created_at) >= datetime('now', '-5 month')  
 	    group by p.id   
 	    order by strftime('%Y-%m', p.created_at))   
    group by created_date order by created_date")
  end

  def time_report
  select_all("select less_equal_1, between_1_and_3, between_3_and_6, more_than_6 from  
    	(select count(p.id) as more_than_6 from project_requests p 
    		left outer join request_selections rs on p.id = rs.project_request_id 
    		where (julianday(rs.created_at) - julianday(p.created_at)) > 6), 
		(select count(p.id) as between_3_and_6 from project_requests p 
			left outer join request_selections rs on p.id = rs.project_request_id 
			where (julianday(rs.created_at) - julianday(p.created_at) <= 6) & (julianday(rs.created_at) - julianday(p.created_at) > 3 )),
		(select count(p.id) as between_1_and_3 from project_requests p 
			left outer join request_selections rs on p.id = rs.project_request_id 
			where (julianday(rs.created_at) - julianday(p.created_at) <= 3) & (julianday(rs.created_at) - julianday(p.created_at) > 1)), 
	    (select count(p.id) as less_equal_1 from project_requests p
	        left outer join request_selections rs on p.id = rs.project_request_id 
	        where (julianday(rs.created_at) - julianday(p.created_at)) <= 1)")

  end

  def developer_skill_report
   select_all("select count(ds.skill_id) as TOTAL, s.language,  
	 	sum( CASE WHEN e.location = 'Chicago'   THEN 1 ELSE 0 END) as Chicago,
	    sum( CASE WHEN e.location = 'Boston'   THEN 1 ELSE 0 END) as Boston,   
	    sum( CASE WHEN e.location = 'Mumbai'   THEN 1 ELSE 0 END) as Mumbai,   
	 	sum( CASE WHEN e.location = 'San Francisco'   THEN 1 ELSE 0 END) as San_Francisco,  
	 	sum( CASE WHEN e.location = 'London'   THEN 1 ELSE 0 END) as London,  
	 	sum( CASE WHEN e.location = 'Houston'   THEN 1 ELSE 0 END) as Houston   
	 from developer_skills ds   
	 join skills s on ds.skill_id = s.id   
	 join employees e on ds.employee_id = e.id   
	 where ds.level  != 0   
	 group by s.id")
   end


   def average_report
   select_all("select  s.language as language,   
	          round(avg(case when e.location='Chicago' then ds.level  end), 2)  as Chicago,
              round(avg(case when e.location='Boston' then ds.level  end), 2) as Boston,      
              round(avg(case when e.location='Mumbai' then ds.level end), 2) as Mumbai,            
              round(avg(case when e.location='San Francisco' then ds.level  end),2)  as San_Francisco,      
              round(avg(case when e.location='London' then ds.level end) ,2) as London,        
              round(avg(case when e.location='Houston' then ds.level  end), 2) as Houston        
            from developer_skills ds
            join skills s on ds.skill_id = s.id               
            join employees e on ds.employee_id = e.id              
            where ds.level  != 0 group by s.id")
    end

  def three_month_report
    select_all("select  e.location,    
    	count(CASE WHEN p.office = 'Chicago'  THEN e.location   END) as Chicago,
        count(CASE WHEN p.office = 'San Francisco' THEN e.location   END) as San_Francisco,  
        count(CASE WHEN p.office = 'Houston'  THEN e.location   END) as Houston,    
        count(CASE WHEN p.office = 'London' THEN e.location   END) as London,    
        count(CASE WHEN  p.office = 'Mumbai' THEN  e.location   END) as Mumbai,
        count(CASE WHEN  p.office = 'Boston' THEN  e.location   END) as Boston  
     from request_selections rs  
     left outer join employees e on e.id = rs.employee_id 
     left outer join project_requests p on p.id = rs.project_request_id 
     where date(p.created_at)  between date('2012-11-18') AND date('2012-11-18', '+5 month')    AND p.office != e.location  
     group by e.location")
  end

   def six_month_report
    select_all("select  e.location,   
     	count(case when p.office = 'Chicago'  THEN e.location   END) as Chicago,  
      	count(case when p.office = 'San Francisco' THEN e.location   END) as San_Francisco,   
      	count(case when p.office = 'Houston'  THEN e.location   END) as Houston, 
        count(case when p.office = 'London' THEN e.location   END) as London,  
        count(case when  p.office = 'Mumbai' THEN  e.location   END) as Mumbai,
        count(case when  p.office = 'Boston' THEN  e.location   END) as Boston  
       from request_selections rs  left outer join employees e on e.id = rs.employee_id 
       left outer join project_requests p on p.id = rs.project_request_id 
       where date(p.created_at)  between date('2012-11-18') AND date('2012-11-18', '+2 month')   AND p.office != e.location 
       group by e.location")
   end

   def volunteer_report
    select_all("select  e.last_name, e.employee_name,  
      	count(distinct case when ( datetime(p.created_at) >= datetime('now', '-1 month')) THEN p.office END) as first_month,   
      	count(distinct case when ( datetime(p.created_at) >= datetime('now', '-2 month')) THEN p.office  END) as second_month,  
      	count(distinct case when ( datetime(p.created_at) >= datetime('now', '-3 month')) THEN p.office  END) as third_month, 
      	count(distinct case when (datetime(p.created_at) >= datetime('now', '-4 month')) THEN p.office  END) as fourth_month, 
      	count(distinct case when ( datetime(p.created_at) >= datetime('now', '-5 month')) THEN p.office  END) as fifth_month,  
      	count(distinct case when ( datetime(p.created_at) >= datetime('now', '-6 month')) THEN p.office  END) as sixth_month    
      from request_selections rs 
      left outer join employees e on e.id = rs.employee_id 
      left outer join project_requests p on p.id = rs.project_request_id     
      group by e.last_name,  e.employee_name    
      order by e.last_name, e.employee_name")
    end


end
