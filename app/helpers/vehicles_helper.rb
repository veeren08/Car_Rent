module VehiclesHelper
	def car_fields 
    	[:license, :PlateNumber, :manufacturer, :model, :hourlyRentalRate, :style, :status, :city, :status, :country, :mobile] 
  end

  def showvehicles(vehicle)
  	if has_role?(:admin)
  		vehicle.status == "Available" || vehicle.status == "Cancel" || vehicle.status == "Reserved"
  	elsif has_role?(:owner)
  		vehicle.user_id==current_user.id
  	else
  		vehicle.status == "Available"
  	end
  end

  def button_per(vehicle)
		has_role?(:owner) || has_role?(:admin)
  end

end
 