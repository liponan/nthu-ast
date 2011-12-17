class CreateClubActivities < ActiveRecord::Migration
  def self.up
    create_table :club_activities do |t|
      t.boolean :club, :default=>"F"
      t.string :remark
      t.timestamps
    end
  end

  def self.down
    drop_table :club_activities
  end
end
