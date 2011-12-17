class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|
      t.string :name, :null=>false
      t.string :audience, :null=>false, :default=>0
      t.string :date
      t.integer :event_status_id, :null=>false, :default=>0
      t.integer :block_1, :null=>false, :dedault=>'f'
      t.integer :block_2, :null=>false, :dedault=>'f'
      t.integer :block_3, :null=>false, :dedault=>'f'
      t.string :pid, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :programs
  end
end
