Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events, onry: [:index, :show, :new, :create, :destroy]

  resources :genres, onry: [:new, :create, :index, :edit, :update]

  resources :items, onry: [:new, :create, :edit, :update]

  get 'users/my_page' => 'users#show'
  get 'users/confirm' => 'users#confirm'
  resources :users, onry: [:edit, :update] do

    collection do
      patch 'withdraw'
    end

  end



end
