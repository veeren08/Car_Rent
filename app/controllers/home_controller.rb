class HomeController < ApplicationController
  # load_and_authorize_resource
  
  before_action :authenticate_user!, except: [:index, :aboutus]
  def index
  end
end
