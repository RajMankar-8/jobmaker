class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.send_greeting_notification.subject
  #
  def send_greeting_notification
    @greeting = "Welcome to Jobmaker platform "

    mail to: "to@example.org"
  end
end
