Rails.application.routes.draw do
  
  get 'login', to: redirect('/auth/instagram'), as: 'login'
  delete 'logout', to: 'sessions#destroy'#, as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'home', to: 'home#show'
  get 'me', to: 'me#show', as: 'me'
  get 'info', to: 'sessions#show'

  root to: "home#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
