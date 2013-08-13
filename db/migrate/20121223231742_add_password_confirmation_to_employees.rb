class AddPasswordConfirmationToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :password_confirmation, :string
  end
end
