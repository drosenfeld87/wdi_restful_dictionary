Rails.application.routes.draw do
  resources :entries
  root 'entries#index'# resources :entries, except: [:destroy]
  # resources :entries, only: [:index, :show]
end
