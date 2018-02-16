Rails.application.routes.draw do
  
  get 'login', to: redirect('/auth/instagram'), as: 'login'
  delete 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'home', to: 'home#show'
  get 'info', to: 'me#user_info'
  get 'media/:media_id', to: 'me#user_media'

  root to: "home#show"
end
