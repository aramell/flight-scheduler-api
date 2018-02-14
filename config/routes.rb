Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'applicaton#index'
  namespace :api do
      resources :flights
  # resources :planes do
  #   resources :flights
  # end
  end
end