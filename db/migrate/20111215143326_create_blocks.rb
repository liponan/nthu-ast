class CreateBlocks < ActiveRecord::Migration
  def self.up
    create_table :blocks do |t|
      t.integer :block_type_id
      t.string :time
      t.integer :program_id
      t.string :remark
      t.timestamps
    end
  end

  def self.down
    drop_table :blocks
  end
end
