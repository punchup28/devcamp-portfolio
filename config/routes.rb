Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  # get 'pages/home'
  get 'pages/contact'
  # resources is encapsulate all popular route use
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  # custom routes
  root to: 'pages#home' # localhost:3000
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
end
