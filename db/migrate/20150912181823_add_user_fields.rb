class AddUserFields < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :address, :string
    add_column :users, :zip_code, :integer
    add_column :users, :phone_number_primary, :string
    add_column :users, :phone_number_secondary, :string
    add_column :users, :terms_of_service, :boolean, default: false, null: false
    add_column :users, :age_verification, :boolean, default: false, null: false
  end

  def down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :country
    remove_column :users, :address
    remove_column :users, :zip_code
    remove_column :users, :phone_number_primary
    remove_column :users, :phone_number_secondary
    remove_column :users, :terms_of_service
    remove_column :users, :age_verification
  end
end
