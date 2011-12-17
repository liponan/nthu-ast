class Program < ActiveRecord::Base
  has_one :contact
  has_many :blocks
  has_many :program_items
end
