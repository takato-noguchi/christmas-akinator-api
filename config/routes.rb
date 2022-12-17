Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/games/new', to: 'games#new'
    resources :games, only: %i[new create update] do
      member do
        get 'give_up', to: 'games#giveup'
        get 'challenge', to: 'games#challenge'
        get 'correct', to: 'games#correct'
      end
    resources :progresses, only: %i[new create]
  end
end
