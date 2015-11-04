Rails.application.routes.draw do

  root 'nav#home'
  get 'nav/home', as: :nav_home
  get 'nav/index', as: :nav
  get 'nav/map', as: :nav_map

  get 'access/register', as: :register
  post 'access/after_register', as: :after_register
  get 'access/login', as: :login
  post 'access/post_login', as: :post_login
  get 'access/after_login', as: :after_login
  get 'access/logout', as: :logout
  post 'access/after_logout', as: :after_logout
  get 'access/cancel', as: :cancel
  post 'access/after_cancel', as: :after_cancel
  get 'access/check_username', as: :check_username, defaults: {format: 'js'}
  get 'access/check_email', as: :check_email, defaults: {format: 'js'}
  post 'access/check_passhash', as: :check_passhash, defaults: {format: 'js'}
  
  namespace :access do
    resources :accounts
  end
  
end
