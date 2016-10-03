class User < ActiveRecord::Base
  
  has_many :folders
  has_many :archives
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # Setup accessible (or protected) attributes for your model 
  
  
    validates :email, :presence => true, :uniqueness => true
end
