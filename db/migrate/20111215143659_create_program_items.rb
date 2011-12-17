class CreateProgramItems < ActiveRecord::Migration
  def self.up
    create_table :program_items do |t|
      t.integer :program_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :program_items
  end
end
