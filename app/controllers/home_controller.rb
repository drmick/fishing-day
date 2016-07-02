class HomeController < ApplicationController
  def index
    redirect_to show_sector_path(sector:1, unique_key:12345)
  end

  def show_sector

  end
end
