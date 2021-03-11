class User < ApplicationRecord
  has_many :vehicle
  resourcify
  rolify
  validates_presence_of :email
  devise :database_authenticatable, :registerable, :recoverable, :rememberable

  validates_uniqueness_of :email, :case_sensitive => false, :allow_blank => true, :if => :email_changed?
  validates_format_of :email, :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates :first_name, :presence => true 
  validates :last_name, :presence => true
  validates :mobile, :presence => true, :numericality => true, :length => { :minimum => 10, :maximum => 10 }
  validates :dateofbirth, :presence => true
  validates :city, :presence => true
  validates :country, :presence => true
  validates :zipcode, :presence => true
  validates :address, :presence => true

  validates_confirmation_of :password, :on=>:create
  validates_length_of :password, :within => Devise.password_length, :allow_blank => true

PASSWORD_FORMAT = /\A
  (?=.{8,})          
  (?=.*\d)           
  (?=.*[a-z])        
  (?=.*[A-Z])        
  (?=.*[[:^alnum:]]) 
/x

validates :password, 
  presence: true, 
  length: { in: Devise.password_length }, 
  format: { with: PASSWORD_FORMAT }, 
  confirmation: true, 
  on: :create 

validates :password, 
  allow_nil: true, 
  length: { in: Devise.password_length }, 
  format: { with: PASSWORD_FORMAT }, 
  confirmation: true, 
  on: :update
end

