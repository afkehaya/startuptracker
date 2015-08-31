class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :startupable_type
      t.integer :startupable_id
      t.integer :user_id
      t.string :company
      t.string :url

      t.timestamps
    end
  end
end
