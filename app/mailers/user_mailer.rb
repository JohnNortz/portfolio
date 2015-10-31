class UserMailer < ApplicationMailer
  default from: 'IAmADevRofl@gmail.com'

  def welcome_email(user)
    @user = user
    @url = "http://google.com/"
    puts "|||||||||||||||||||user_mailer.rb |||||||||||||||||||"

    mail(to: @user.email, subject: 'Thank you for signing up!')
  end
end
