Rails.application.routes.draw do
  root 'topics#index'

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
