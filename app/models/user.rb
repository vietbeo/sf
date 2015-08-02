class User < ActiveRecord::Base
#  attr_accessor :user_name, :email

  # Validate User.user_name  
  validates :user_name, presence: true, uniqueness: {case_sensitive: false}
  validates_format_of :user_name, :with => /\A[A-Za-z0-9_]+\z/

  # Validate User.email
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  
  # Validate Password
  validates :password, length: { minimum: 6 }


  has_secure_password

end
