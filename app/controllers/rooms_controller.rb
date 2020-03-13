class RoomsController < ApplicationController
  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      redirect_to listing_room_url(@room)
    else
      render 'new'      
    end
  end

  def listing
    @room = Room.find(params[:id])
  end

  def pricing
    @room = Room.find(params[:id])
  end

  def description
    @room = Room.find(params[:id])
  end

  def photo_upload
    @room = Room.find(params[:id])
  end

  def amenities
    @room = Room.find(params[:id])
  end

  def location
    @room = Room.find(params[:id])
  end

  private
  def room_params
    params.require(:room).permit(:name,:home_type,:room_type,:guest_count,:bedrooms_count,:bathrooms_count,:price,:summary,:has_tv,:has_heating,:has_internet,:has_aircon,:has_kitchen,:address,:is_active)
  end
end
