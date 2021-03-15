class VehiclesController < ApplicationController
	
  def index
    # if has_role?(:owner)
    @vehicle= Vehicle.all
      # @vehicle= current_user.vehicle.all
    # end
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
        format.html { redirect_to vehicles_path, notice: 'Successfully Added New Car.....' }
        format.json { render :new, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes(vehicle_params)
      flash[:notice] = "Car info updated."
      redirect_to @vehicle
    else
      render :edit
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    flash[:alert] = 'Car deleted.'
    redirect_to vehicles_url
  end

  # private
  private
    def vehicle_params
      params.require(:vehicle).permit(:license, :PlateNumber, :manufacturer, :model, :hourlyRentalRate, :style, :status, :city, :state, :country, :mobile)
    end
  
end
