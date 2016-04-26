class StoriesMail

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence backfill: true do
      minutely(1)
  end

  def perform()
    @users = []
    @list_of_users = User.all
          
      @list_of_users.each do |each_user|
            if each_user.email != nil
                @users.append(each_user)
            end
      end
      
      StoryMailer.send_story_email(@users).deliver
  end

end

