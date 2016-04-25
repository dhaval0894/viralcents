Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  

      mount Sidekiq::Web ,at: '/sidekiq'


  # Landing page route

  root 'static_pages#index'

  
  #facebook login
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  #static_pages contact form
  post 'add_contact' => 'static_pages#add_contact'
  
  #user_panel
  get 'dashboard' => 'user_panel#dashboard'
  get 'user_stories' => 'user_panel#user_stories'
  get 'post' => 'user_panel#tweet'
  get 'stories' => 'user_panel#stories'
  get 'leaderboard' => 'user_panel#leaderboard'
  #post to twitter
  get 'tweet' => 'user_panel#post_to_twitter'


  get 'settings' => 'user_panel#settings'

  get 'settings_save_contact' => 'user_panel#settings_save_contact'
  get 'settings_save_email' => 'user_panel#settings_save_email'

  
  get 'settings_save_email' => 'user_panel#settings_save_email'
  
  get 'settings_save_contact' => 'user_panel#settings_save_contact'
  
  #transaction history
  get 'transactions' => 'user_panel#transactions'


  get 'referrals' => 'user_panel#referrals'
  #Get details for mobile recharge
  get 'recharges' => 'user_panel#recharges'
  #show recharge details
  put 'recharges' => 'user_panel#addrecharge'
  #get user wallet details
  get 'wallet' =>'user_panel#wallet'
  #store facebook post id
  post 'user_stories/addStory_id' => 'user_panel#add_fbStory_id'
  #get unique url per user per story
  get 'bitly' => 'user_panel#bitly'
  post 'add_referral_link' => "user_panel#add_referral_link"
   
   #show coupons in coupons page
   get 'show_coupons' =>'user_panel#show_coupons'
   get '/coupon_detail/:id' =>'user_panel#coupon_detail'
   get 'my_coupons' =>'user_panel#my_coupons'
   post 'map_coupon' =>'user_panel#map_coupon'

end
