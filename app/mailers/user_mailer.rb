class UserMailer < ApplicationMailer

  def after_reg(user)
    @user = user
    mail(to: @user.email, subject: 'Вам выделен сектор!')
  end

  def no_sector(user)
    @user = user
    mail(to: @user.email, subject: 'Свободных секторов нет')
  end

  def expo(exp)
    @expo = exp
    mail(to: "infiltrator53@gmail.com, sale@fishingday.moscow", subject: 'РЕГИСТРАЦИЯ НА ЯРМАРКУ!')
  end
end
