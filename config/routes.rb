Rails.application.routes.draw do
  resources :portfolios
  # get 'pages/home'

  get 'pages/contact'
  # resources is encapsulate all popular route use
  resources :blogs

  # custom routes
  root to: 'pages#home' # localhost:3000
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

end
