class AddUserFields < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :integer
    add_column :users, :phone_number_primary, :integer
    add_column :users, :phone_number_secondary, :integer
    add_column :users, :terms_of_service, :boolean, default: false
    add_column :users, :age_verification, :boolean, default: false
    add_column :users, :role, :string
  end

  def down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip_code
    remove_column :users, :phone_number_primary
    remove_column :users, :phone_number_secondary
    remove_column :users, :terms_of_service
    remove_column :users, :age_verification
    remove_column :users, :role
  end
end
