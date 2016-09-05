Rails.application.routes.draw do

  devise_for :users

  root 'books#index'

  resources :books do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end

end
