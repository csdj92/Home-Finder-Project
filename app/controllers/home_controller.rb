class HomeController < ApplicationController
  def main
    @properties = Property.latest
  end
end
