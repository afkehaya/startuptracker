class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :business
      t.string :description

      t.timestamps
    end
  end
end
