class CreateProjectRequests < ActiveRecord::Migration
  def change
    create_table :project_requests do |t|
      t.string :project_help
      t.integer :employee_id

      t.timestamps
    end
  end
end
