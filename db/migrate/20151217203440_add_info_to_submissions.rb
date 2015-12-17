class AddInfoToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :url, :string
    add_column :submissions, :name, :string
  end
end
