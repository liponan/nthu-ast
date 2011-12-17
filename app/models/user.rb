class User < ActiveRecord::Base
  has_many :contacts
  has_many :programs, :through=>:contacts
  has_many :faqs
  validates_uniqueness_of :email
  validates_confirmation_of :password, :on => :create 
  validates_length_of :password, :within => 6..20
  # If a user matching the credentials is found, returns the User object.
  # If no matching user is found, returns nil.
  def self.authenticate(user_info)
    find_by_email_and_password(user_info[:email], user_info[:password])
  end  
end
