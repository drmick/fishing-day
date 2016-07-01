class UserMailer < ApplicationMailer

  def after_reg(user)
    @user = user
    mail(to: @user.email, subject: 'After reg')
  end
end
