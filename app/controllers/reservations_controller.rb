class ReservationsController < ApplicationController
  include ReservationsHelper
  require 'date'
  Time.zone = 'New Delhi'

  def index
    @reservation = Reservation.all.order("created_at DESC")
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def create
    vehicle_id = reservation_params[:vehicle_id]
    user_id = reservation_params[:user_id]
    user = User.find(user_id)
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:success] = 'Reservation was successfully created.'
      vehicle = Vehicle.find(@reservation.vehicle_id)
      vehicle.update_attribute(:status, "Reserved")
      @reservation.update_attribute(:reservationstatus, "Reserved")
      UserMailer.reservation_done(User.find(user_id), Vehicle.find(vehicle_id)).deliver
      redirect_to @reservation
    else
      flash[:danger] = "Can't reserve"
      redirect_to user
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:success] = 'Reservation was successfully updated.'
      redirect_to @reservation
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    Vehicle.find(@reservation.vehicle_id).update_attribute(:status, "Available")
    @reservation.destroy
    flash[:success] = 'Reservation deleted!'
    redirect_to reservations_url
  end

  def returncar
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attribute(:returntime, Time.now)
      flash[:success] = 'Car was successfully returned. Thank you!'
      @reservation.update_attribute(:reservationstatus, "Complete")
      user = User.find(@reservation.user_id)
      vehicle = Vehicle.find(@reservation.vehicle_id)
      vehicle.update_attribute(:status, "Available")
      # price = vehicle.hourlyRentalRate
      # @reservation.returntime - @reservation.checkouttime)/3600.0
      rent = 1000
      # charge = rent + price*hold_time
      flash[:success] = '#{rent} Car was successfully returned. Thank you!'
      UserMailer.return_car(User.find(@reservation.user_id), Vehicle.find(@reservation.vehicle_id), rent).deliver
      redirect_to @reservation
    end
  end

  def cancel
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attribute(:reservationstatus, "Cancel")
      Vehicle.find(@reservation.vehicle_id).update_attribute(:status, "Available")
      flash[:success] = "Reservation successfully canceled!"
      redirect_to @reservation
    end
  end

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:registrationNumber, :checkouttime, :pickuptime, :expectedreturntime, :returntime, :reservationstatus, :user_id, :vehicle_id)
    end
    
    def can_destroy
      @reservation = Reservation.find(params[:id])
      if !["Complete", "Cancel"].include?(@reservation.reservationstatus)
        flash[:danger] = "Reservation is in use, and cannot be deleted now!"
        redirect_to @reservation
        return
      end
    end
end
