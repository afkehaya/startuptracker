class ChangeDatatypeOnSubmissionsFromStringToText < ActiveRecord::Migration
   def up
    change_column :submissions, :description, :text, :limit => nil
  end

  def down
    change_column :submissions, :description, :string
  end
end
