class NotificationMailSender

  include Sidekiq::Worker
  
  def perform(name,email)
    ViralcentsMailer.send_notification_email(name,email).deliver  
  end
end










  
