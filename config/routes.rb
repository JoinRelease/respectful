require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :user
  root to: 'landing#index'
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  put '/lead_new' => 'leads#create', as: :new_lead

  # authenticated :user do
  #   root 'user/users#show', as: :authenticated_root
  # end

  namespace :user do
    resources :after_signup
    resources :burial_plans
    resources :burial_cemetery_plans
    resources :burial_mausoleum_plans
    resources :cremation_plans
    # get '/registration'      => 'users#registration'
    # patch '/registration/update' => 'users#update', as: :registration_update
    get '/plans/new' => 'plans#new', as: :plan_new
    # patch '/burial_plans/update' => 'burial_plans#update', as: :burial_update
    # get '/burial_plans/new' => 'burial_plans#new', as: :burial_new
    # patch '/cremation_plans/update' => 'cremation_plans#update', as: :cremation_update
    # get '/cremation_plans/new' => 'cremation_plans#new', as: :cremation_new
    # get '/burial_cemetery_plan/new' => 'burial_cemetery_plans#new', as: :burial_cemetery_new
    # patch '/burial_cemetery/update' => 'burial_cemetery_plans#update', as: :burial_cemetery_update
    # get '/burial_mausoleum_plan/new' => 'burial_mausoleum_plans#new', as: :burial_mausoleum_new
    # patch '/burial_mausoleum/update' => 'burial_mausoleum_plans#update', as: :burial_mausoleum_update
  end


  devise_scope :user do
    get 'signup'   => 'devise/registrations#new', id: 'signup'
    get '/login'   => 'devise/sessions#new', id: 'login'
    post 'login'   => 'devise/sessions#create'
    delete 'logout'=> 'devise/sessions#destory', id: 'logout'
  end

  get '/about'    => 'high_voltage/pages#show', id: 'about'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'

end
