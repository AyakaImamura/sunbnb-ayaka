class ReservationsController < ApplicationController

  def create
    @room = Room.find(params[:room_id])

    if current_user == @room.user
      flash[:alert] = "You cannot book your own property!"
    else
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      nights = (end_date - start_date).to_i

      @reservation = current_user.reservations.new(reservation_params)
      @reservation.room = @room
      @reservation.price_per_night = @room.price
      @reservation.total_price = @room.price * nights
      @reservation.save

      flash[:success] = "Successfully Booked Room!"
    end

    redirect_to room_url(@room)
  end

  private
    def reservation_params
        params.require(:reservation).permit(:start_date, :end_date)
    end
end
