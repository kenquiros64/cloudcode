class Archive < ActiveRecord::Base
    belongs_to :user
    
    belongs_to :folder
  
    #set up "uploaded_file" field as attached_file (using Paperclip) 
    has_attached_file :uploaded_file, 
               :url => "/assets/get/:id", 
               :path => ":Rails_root/archives/:id/:basename.:extension"
      
    validates_attachment_size :uploaded_file, :less_than => 10.megabytes
    validates_attachment_file_name :uploaded_file, :matches => 
    [/py\Z/, /java\Z/, /cs\Z/, /scala\Z/,  /rb\Z/, /js\Z/, /html\Z/, /css\Z/, /tex\Z/, /c\Z/, /cpp\Z/]
    validates_attachment_presence :uploaded_file
end