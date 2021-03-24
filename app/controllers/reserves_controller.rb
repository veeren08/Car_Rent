class ReservesController < ApplicationController
	def index
		@ve = Vehicle.find(params[:vehicle_id])
    @reservation = Reservation.all.order("created_at DESC")
  end
end
