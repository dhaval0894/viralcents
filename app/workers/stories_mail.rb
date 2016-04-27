class StoriesMail

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence backfill: true do
      daily(1)
  end

  def perform()
    @list_of_users = User.all
    #create list of all users      
      @list_of_users.each do |each_user|
            if each_user.email != nil
                ViralcentsMailer.send_story_email(each_user.name,each_user.email).deliver
            end
      end
      
      
  end
end

