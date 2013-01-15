class AddManagerToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :manager, :string
  end
end
