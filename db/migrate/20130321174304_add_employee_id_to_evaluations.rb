class AddEmployeeIdToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :employee_id, :integer
  end
end
