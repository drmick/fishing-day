class HomeController < ApplicationController
  def index

    p 1
    #UserMailer.after_reg(User.first).deliver_now
    p 2


    #
    # (1..1).each do |i|
    #   u = User.new
    #
    #
    #   count = User.active.count
    #   if count < 300
    #
    #     u.sector = u.get_sector_id
    #     u.email = u.sector.to_s + '@qwe.r'
    #     u.password = u.sector.to_s+ '12345678'
    #     u.save!
    #   end
    # end


  end
end
