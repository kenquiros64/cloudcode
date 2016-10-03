class Folder < ActiveRecord::Base
    acts_as_tree :order => :name
    
    has_many :archives, :dependent => :destroy
    belongs_to :user
end
