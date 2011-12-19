class Program < ActiveRecord::Base
  has_one :contact
  has_one :user, :through=>:contact
  belongs_to :event_status
  has_one :club_activity
  has_many :blocks
  has_many :program_items
end
