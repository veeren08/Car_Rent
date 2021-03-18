class VehiclesController < ApplicationController
  # load_and_authorize_resource

  def index
    @vehicle= Vehicle.all.order("created_at DESC")
    # @vehicle= current_user.vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end
  
  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end
  
  def create
    # @vehicle = Vehicle.new(vehicle_params)
    @vehicle = current_user.vehicle.create(vehicle_params)
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to root_path, notice: 'Successfully Added New Car.....' }
        format.json { render :new, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @vehicle = current_user.vehicle.find(params[:id])
    if @vehicle.update_attributes(vehicle_params)
      flash[:notice] = "Car info updated."
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @vehicle = current_user.vehicle.find(params[:id])
    @vehicle.destroy
    flash[:alert] = 'Car deleted.'
    redirect_to root_path
  end

  # private
  private
    def vehicle_params
      params.require(:vehicle).permit(:car_avatar, :license, :PlateNumber, :manufacturer, :model, :hourlyRentalRate, :style, :status, :city, :state, :country, :mobile)
    end
  
end