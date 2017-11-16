class StoragesController < ApplicationController
	before_action :authenticate_user! , except: [:destroy]
	before_action :set_file, only: [:download]

	def index
    	@files = Storage.where(user_id: current_user.id).all
  	end

	def new
    	@file = Storage.new
  	end

  	def create
  		@file = Storage.new(file_params)
  		if @file.save
  			@user = @file.update(user_id: current_user.id)
  			redirect_to root_path, notice: "The file #{@file.name} has been uploaded."
  		else
  			render "new"
  		end
  	end

  	def destroy
	    @file = Storage.find(params[:id])
	    @file.destroy
	    redirect_to root_path, notice:  "The file #{@file.name} has been deleted."
	end

	def download
	  #This will decrpyt the file first


	    	  	if @file.user_id == current_user.id
	  Carrierwave::EncrypterDecrypter::Downloader.decrypt(@file, mounted_as: :attachment)

	  file_path = @file.attachment.path
	  
	    File.open(file_path, 'r') do |f|
	      send_data f.read, type: MIME::Types.type_for(file_path).first.content_type,disposition: :inline,:filename => File.basename(file_path)
	  end
	    #This is to remove the decrypted file after transfer
	    File.unlink(file_path)
	end
end


  	private
	  	def set_file

	      @file = Storage.find(params[:id])
	    end
	    
		  def file_params
		    params.require(:storage).permit(:name, :attachment)
		  end
end
