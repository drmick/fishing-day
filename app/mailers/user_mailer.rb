class UserMailer < ApplicationMailer

  def after_reg(user)
    @user = user
    mail(to: @user.email, subject: 'Вам выделен сектор!')
  end

  def no_sector(user)
    @user = user
    mail(to: @user.email, subject: 'Свободных секторов нет')
  end
end
