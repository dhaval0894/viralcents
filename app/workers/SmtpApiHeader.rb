
require 'json'

class SmtpApiHeader

  def wallet_info
   
          @user_wallets = []
          @users = User.all
      @users.each do |user|
          @wallet_refrence = Wallet.find_by user_id: user.id
          @each_user_balance = @wallet_refrence.balance
          @user_wallets.push(@each_user_balance)
      end
  
      return @user_wallets
  end

def user_mail_info
         @all_user_emails = []
         @users = User.all
      @users.each do |user|
           @all_user_emails.push(user.email)
      end
  return @all_user_emails
end

def user_names
       @all_user_names = []
          @users = User.all
       @users.each do |user|
           @all_user_names.push(user.name)
        end
    return @all_user_names
end

def all_stories_title
       @story_titles = []
       @stories = Story.all.take(1)
       @stories.each do |story|
           @story_titles.push(story.title)
       end
    return @story_titles   
end


  def initialize()
    @data = {}
  end

  def addTo(to)
    @data['to'] ||= []
    @data['to'] += to.kind_of?(Array) ? to : [to]
  end

  def addSubVal(var, val)
    if not @data['sub']
      @data['sub'] = {}
    end
    if val.instance_of?(Array)
      @data['sub'][var] = val
    else
      @data['sub'][var] = [val]
    end
  end

  def setUniqueArgs(val)
    if val.instance_of?(Hash)
      @data['unique_args'] = val
    end
  end


  def setCategory(cat)

    @data['category'] = cat
  end

  def addFilterSetting(fltr, setting, val)
    if not @data['filters']
      @data['filters'] = {}
    end
    if not @data['filters'][fltr]
      @data['filters'][fltr] = {}
    end
    if not @data['filters'][fltr]['settings']
      @data['filters'][fltr]['settings'] = {}
    end
    @data['filters'][fltr]['settings'][setting] = val
  end

  def asJSON()
    json = JSON.generate @data
    return json.gsub(/(["\]}])([,:])(["\[{])/, '\\1\\2 \\3')
  end

  def as_string()
    json  = asJSON()
    str = 'X-SMTPAPI: %s' % json.gsub(/(.{1,72})( +|$\n?)|(.{1,72})/,"\\1\\3\n")
    return str
  end

end