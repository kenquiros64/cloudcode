class ArchivesController < ApplicationController
  before_action :authenticate_user!, :except => [:get, :show]

  # GET /archives
  # GET /archives.json
  def index
    if user_signed_in? 
      @archives = current_user.archives.order("uploaded_file_file_name desc")       
    end
  end

  # GET /archives/1
  # GET /archives/1.json
  def show
    if user_signed_in? 
      @archive = current_user.archives.find(params[:id])
    else
      @archive = Archive.find(params[:id])
    end
  end

  # GET /archives/new
  def new
    @archive = current_user.archives.build     
    if params[:folder_id] #if we want to upload a file inside another folder 
     @current_folder = current_user.folders.find(params[:folder_id]) 
     @archive.folder_id = @current_folder.id 
    end
  end
   #authenticate for users before any methods is called 
  
  # GET /archives/1/edit
  def edit
    @archive = current_user.archives.find(params[:id]) 
  end
  
  def get 
    if user_signed_in? 
      archive = current_user.archives.find_by_id(params[:id]) 
    else
      archive = Archive.find_by_id(params[:id]) 
    end
    
    if archive 
         send_file archive.uploaded_file.path, :type => archive.uploaded_file_content_type 
    else
      flash[:error] = "Stop! You can not manage private files of other users!"
      redirect_to archives_path 
    end
  end

  # POST /archives
  # POST /archives.json
  def create
    @archive = current_user.archives.build(archive_params)
    if @archive.save 
      flash[:notice] = "Successfully uploaded the file."
    
      if @archive.folder #checking if we have a parent folder for this file 
        redirect_to browse_path(@archive.folder)  #then we redirect to the parent folder 
      else
        redirect_to root_url 
      end      
    else
      render :action => 'new'
    end
  end

  # PATCH/PUT /archives/1
  # PATCH/PUT /archives/1.json
  def update
    @archive = current_user.archives.find(params[:id]) 
    respond_to do |format|
      if @archive.update(archive_params)
        format.html { redirect_to @archive, notice: 'Archive was successfully updated.' }
        format.json { render :show, status: :ok, location: @archive }
      else
        format.html { render :edit }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archives/1
  # DELETE /archives/1.json
  def destroy
    @archive = current_user.archives.find(params[:id]) 
    @archive.destroy
    respond_to do |format|
      format.html { redirect_to archives_url, notice: 'Archive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def archive_params
      params.require(:archive).permit(:uploaded_file,:folder_id)
    end
end
