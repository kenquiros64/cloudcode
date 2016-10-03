class HomeController < ApplicationController
  def index
    if user_signed_in? 
       #show only root folders (which have no parent folders) 
       @folders = current_user.folders.roots.order("name ASC")
         
       #show only root files which has no "folder_id" 
       #@archives = current_user.archives.where("folder_id is NULL").order("uploaded_file_file_name desc")       
    else
       #show only root public folders (which have no parent folders) 
       @folders = Folder.where("parent_id is NULL AND is_private = ?", false).order("name ASC")
    end
  end
  
  def browse 
    if user_signed_in? 
      #get the folders owned/created by the current_user 
      @current_folder = current_user.folders.find_by_id(params[:folder_id])  
      
      if @current_folder 
    
        #getting the folders which are inside this @current_folder 
        @folders = @current_folder.children 
    
        #We need to fix this to show files under a specific folder if we are viewing that folder 
        @archives = @current_folder.archives.order("uploaded_file_file_name ASC")
    
        render :action => "index"
      else
        redirect_to root_url, flash: {error: "Stop! You can not see private folders of other users!"}
      end
      
    else
      #get the current folder
      @current_folder = Folder.find(params[:folder_id])
      
      if not @current_folder.is_private
        #getting the folders which are inside this @current_folder 
        @folders = @current_folder.children 
    
        #We need to fix this to show files under a specific folder if we are viewing that folder 
        @archives = @current_folder.archives.order("uploaded_file_file_name ASC")
    
        render :action => "index"
      else
        #flash[:error] = "Stop! You can not see private folders of other users!"
        redirect_to root_url, flash: {error: "Stop! You can not see private folders of other users!"}
      end
      
    end
  end
  
  def public 
    #show only root public folders (which have no parent folders) 
    @folders = Folder.where("parent_id is NULL AND is_private = ?", false).order("name ASC")
  end
  
  def public_browse 
    
    #get the current folder
    @current_folder = Folder.find(params[:folder_id])
    
    if not @current_folder.is_private
      #getting the folders which are inside this @current_folder 
      @folders = @current_folder.children 
  
      #We need to fix this to show files under a specific folder if we are viewing that folder 
      @archives = @current_folder.archives.order("uploaded_file_file_name ASC")
  
      render :action => "public"
    else
      #flash[:error] = "Stop! You can not see private folders of other users!"
      redirect_to root_url, flash: {error: "Stop! You can not see private folders of other users!"}
    end
    
  end
  
  
end
