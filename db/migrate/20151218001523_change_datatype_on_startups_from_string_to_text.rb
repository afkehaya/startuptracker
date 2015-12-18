class ChangeDatatypeOnStartupsFromStringToText < ActiveRecord::Migration
  def up
    change_column :startups, :description, :text, :limit => nil
  end

  def down
    change_column :startups, :description, :string
  end
end
