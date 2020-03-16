class PhotosController < ApplicationController
  def create
    @room = Room.find(params[:room_id]) #each photos velongs to rooms
    #This is Photos controller. That's why need params[:room_id]

    if params[:images]
      params[:images].each do |img|
        @room.photos.create(image: img) #create and save photos to databese
      end

      @photos = @room.photos #get all photos that belong to @room
      redirect_back(fallback_location: request.referer, notice:"Saved...")
    end #redirect_back is back to the page where you did the action
  end


  def destroy
    @photo = Photo.find(params[:id])
    room = @photo.room
  
    @photo.destroy
    @photos = Photo.where(room_id: room.id)
  
    respond_to :js
  end

  # def destroy
  #   @photo = Photo.find(params[:id])
  #   @photo.destroy
    
  #   redirect_back(fallback_location: request.referer, notice: "Saved...")
  # end
end
