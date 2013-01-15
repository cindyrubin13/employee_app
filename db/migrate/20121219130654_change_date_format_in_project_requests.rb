class ChangeDateFormatInProjectRequests < ActiveRecord::Migration
  def up
  	change_column :project_requests, :start_date, :datetime
  	change_column :project_requests, :end_date, :datetime
  end

  def down
  	change_column :project_requests, :start_date, :date
  	change_column :project_requests, :end_date, :date
  end
end
