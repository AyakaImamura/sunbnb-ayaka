class RoomsController < ApplicationController
  before_action :set_room, except:[:index, :new, :create]

  def index
    @rooms = current_user.rooms.paginate(page: params[:page], per_page:6)
  end

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

  def show
    # @room = Room.find(params[:id])
  end

  def update
    final_params = is_not_ready?(@room) ? room_params : room_params.merge(is_active: true)

    if @room.update(final_params)
      flash[:notice] = "Successfully update!"
    else
      flash[:notice] = "Failed to update!"
    end

    redirect_back(fallback_location: request.referer)
  end

  def preload
    today = Date.today
    reservations = @room.reservations.where("start_date >= ? OR end_date >= ?", today, today)

    render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
      conflict: has_conflict(start_date, end_date, @room)
    }

    render json: output
  end

  def listing
    # @room = Room.find(params[:id])
  end

  def pricing
    # @room = Room.find(params[:id])
  end

  def description
    # @room = Room.find(params[:id])
  end

  def photo_upload
    # @room = Room.find(params[:id])
    @photos = @room.photos
  end

  def amenities
    # @room = Room.find(params[:id])
  end

  def location
    # @room = Room.find(params[:id])
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name,:home_type,:room_type,:guest_count,:bedrooms_count,:bathrooms_count,:price,:summary,:has_tv,:has_heating,:has_internet,:has_aircon,:has_kitchen,:address,:is_active)
  end

  def has_conflict(start_date, end_date, room)
    check = room.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
    check.size > 0 ? true : false
  end
end
