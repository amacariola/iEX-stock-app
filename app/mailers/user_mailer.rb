class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email(user)
    @user = user

    mail(to: @user.email, subject: 'Welcome to iEX!')
  end

  def pending_email(user)
    @user = user

    mail(to: @user.email, subject: 'Please wait for your account to be approved!')
  end
end
