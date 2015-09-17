class RemoveUserFields < ActiveRecord::Migration
  def change
    remove_column :users, :address
    remove_column :users, :phone_number_primary
    remove_column :users, :phone_number_secondary
    remove_column :users, :terms_of_service
    remove_column :users, :age_verification
  end
end
