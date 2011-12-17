class CreateBlockTypes < ActiveRecord::Migration
  def self.up
    create_table :block_types do |t|
      t.string :name
      t.string :remark
      t.timestamps
    end
  end

  def self.down
    drop_table :block_types
  end
end