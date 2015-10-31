class AddIndustriesToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :industry_id, :integer
  end
end
