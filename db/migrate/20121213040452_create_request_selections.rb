class CreateRequestSelections < ActiveRecord::Migration
  def change
    create_table :request_selections do |t|
      t.integer :project_request_id
      t.integer :employee_id
      t.integer :response_id
      t.string :comment

      t.timestamps
    end
  end
end
