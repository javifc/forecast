Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :forecasts, only: [:index, :show]
  root 'home#home'
end
