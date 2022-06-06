Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events, onry: [:index, :new, :create]

  resources :genres, onry: [:create, :index, :edit, :update]

  resources :items, onry: [:new, :create, :edit, :update]

  get 'users/my_page' => 'user#show'
  get 'users/confirm' => 'user#confirm'
  resources :users, onry: [:edit, :update] do

    collection do
      patch 'withdraw'
    end

  end



end
