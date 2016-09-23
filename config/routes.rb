Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :web do
    root "operations#index"
    resources :sources
    resources :operations
  end
end
