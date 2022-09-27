Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events, onry: %i[index new create destroy]
  get 'events/show' => 'events#show'

  resources :genres, onry: %i[new create index edit update]

  resources :items, onry: %i[new create edit update]

  get 'users/my_page' => 'users#show'
  get 'users/confirm' => 'users#confirm'
  resources :users, onry: %i[edit update] do
    collection do
      patch 'withdraw'
    end
  end
end
