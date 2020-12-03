class DashboardController < ApplicationController
  before_action :set_sidebar, except: [:show]
  def index
    @properties = Property.all
  end
  

  private 

  def set_sidebar
    @show_sidebar = true
  end
end
