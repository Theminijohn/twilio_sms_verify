Rails.application.routes.draw do

  # The Bawz
  root 'pages#home'

  # Devise
  devise_for :users

end
