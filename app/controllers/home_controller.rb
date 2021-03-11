class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :aboutus]
  def index
  end
end
