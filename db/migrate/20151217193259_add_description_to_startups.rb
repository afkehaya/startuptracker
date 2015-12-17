class AddDescriptionToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :description, :string
  end
end
