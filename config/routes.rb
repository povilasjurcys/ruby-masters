Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'learning/topics#index'

  namespace :authentication do
    resource :session, only: %i[new destroy]
  end

  namespace :admin do
    resources :topics
    resources :students, only: :index
  end

  namespace :learning do
    resources :topics, only: %i[index show] do
      resource :accomplishment
    end
  end

  get 'auth/:provider/callback' => 'authentication/sessions#create'
end
