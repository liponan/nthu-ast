class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :program_id
      t.string :name
      t.string :email
      t.string :unit
      t.string :title
      t.string :phone
      t.string :mobile
      t.string :fax
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
