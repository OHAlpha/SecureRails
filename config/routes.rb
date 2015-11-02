Rails.application.routes.draw do

  get 'access/register'

  get 'access/after_register'

  get 'access/login'

  get 'access/after_login'

  get 'access/logout'

  get 'access/after_logout'

  get 'access/cancel'

  get 'access/after_cancel'

  get 'access/check_username'

  get 'access/check_email'

  get 'access/check_passhash'

  root 'nav#home'
  get 'nav/home', as: :nav_home
  get 'nav/index', as: :nav
  get 'nav/map', as: :nav_map

  get 'access/login', as: :login
  post 'access/enter', as: :enter
  post 'access/verify_login', as: :verify_login
  get 'access/request', as: :request
  post 'access/authorize', as: :authorize
  get 'access/logout', as: :logout
  post 'access/exit', as: :exit
  
end
