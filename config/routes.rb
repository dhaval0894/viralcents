Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Landing page route
  root 'static_pages#index'

  #facebook login
  get 'auth/:provider/callback' => 'sessions#create'
  
  get 'auth/failure' => redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  #user_panel
  get 'dashboard' => 'user_panel#dashboard'
  get 'my_stories' => 'user_panel#my_stories'
  get 'stories' => 'user_panel#stories'


end
