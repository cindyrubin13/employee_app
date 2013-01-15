class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employee_name
      t.string :employee_email
      t.string :location
      t.string :department

      t.timestamps
    end
  end
end
