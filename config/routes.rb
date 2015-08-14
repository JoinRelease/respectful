Rails.application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'home'
  devise_for :user



  get '/users' => 'users#show'
  match '/users', to: 'users#update', via: [:patch]
  get '/users/registration_final' => 'users#final_registration'
  get 'users/registration' => 'users#registration'


  get '/about'    => 'high_voltage/pages#show', id: 'about'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'

  get '/home', to: redirect('/')

  devise_scope :user do
    get    'signup' => 'devise/registrations#new', id: 'signup'
    get '/login' => 'devise/sessions#new', id: 'login'
    post 'login' => 'devise/sessions#create'
    delete 'logout' => 'devise/sessions#destory', id: 'logout'
  end
end
