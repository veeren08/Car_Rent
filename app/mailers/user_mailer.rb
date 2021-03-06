class UserMailer < ApplicationMailer
    default from: 'veerendragupta52525@gmail.com'
    
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to Car Rental')
    end
    
    def reservation_done(user, vehicle)
        @user = user
        @vehicle = vehicle
        mail(to: @user.email, subject: 'Car Reservation Successful Done')
    end

    def reservation_done_ow(user, vehicle, ow)
        @user = user
        @vehicle = vehicle
        @ow = ow
        mail(to: @ow.email, subject: 'Car Reservation Successful Done')
    end

    def return_car_ow(user, vehicle, ow, rent)
        @user = user
        @vehicle = vehicle
        @ow = ow
        @rent = rent
        mail(to: @ow.email, subject: 'Car Reservation Successful Done')
    end

    def return_car(user, vehicle, rent)
        @user = user
        @vehicle = vehicle
        @rent = rent
        mail(to: @user.email, subject: 'Car Return Successful Done')
    end
end
