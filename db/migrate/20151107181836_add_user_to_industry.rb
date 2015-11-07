class AddUserToIndustry < ActiveRecord::Migration
  def change
    add_column :industries, :user_id, :integer
  end
end
