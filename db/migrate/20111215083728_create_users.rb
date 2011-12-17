class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :userid, :string
      t.column :email, :string
      t.column :password, :string
      t.column :name, :string
      t.column :unit, :string
      t.column :title, :string
      t.column :phone, :string
      t.column :mobile, :string
      t.column :fax, :string
      t.column :power, :integer, :default=>5
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
