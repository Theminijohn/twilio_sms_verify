Rails.application.routes.draw do

  # The Bawz
  root 'pages#home'

  # Devise
  # The path is a personal thing. I generally don't like
  # my urls including /user/
  devise_for :users, path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register' },
    controllers: {
      registrations: 'registrations'
    }

end
