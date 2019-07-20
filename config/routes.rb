Rails.application.routes.draw do
  namespace :api do
    devise_for :users
    # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    get  '/workouts/', to: 'workouts#index'
    post '/workouts/', to: 'workouts#create'
    get '/workouts/:id/', to: 'workouts#show'
    put '/workouts/:id/', to: 'workouts#update'
    delete '/workouts/:id/', to: 'workouts#destroy'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
