Rails.application.routes.draw do
  namespace :student do
  get 'sessions/index'
  end

  get 'static/index'
  namespace :student do
  get 'signup', to: 'sessions#index'
  end

end
