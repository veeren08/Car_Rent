module ReservationsHelper

  def car_owner(re)
    User.find(Vehicle.find(re.vehicle_id).user_id).first_name
  end

  def owner_per(re)
    Vehicle.find(re.vehicle_id).user_id==current_user.id
  end

  def user_name(re)
    User.find(re.user_id).first_name
  end

  def plat_no(re)
    Vehicle.find(re.vehicle_id).PlateNumber
  end

  def style(re)
    Vehicle.find(re.vehicle_id).style
  end
  
  def im(re)
    Vehicle.find(re.vehicle_id)
  end
  # def cancleorcomplete(re)
    # if has_role?(:owner) && current_user.id == Vehile.find(re.vehicle_id).user_id
      # re.reservationstatus == "Complete" || re.reservationstatus == "Cancel" 
    # end
  # end 

  def reservation_fields 
    [:id, :checkouttime, :pickuptime, :expectedreturntime, :returntime, :user_id, :vehicle_id, :reservationstatus] 
  end
  
  def field_text(field)
    translation = {:id=>"Index", :checkouttime=>"Check out time", :pickuptime=>"Pick up time", 
      :expectedreturntime=>"Expected return time", :returntime=>"Return time", 
      :user_id=>"User", :vehicle_id=>"Vehicle", :reservationstatus=>"Status"}
    translation[field]
  end
    
end
