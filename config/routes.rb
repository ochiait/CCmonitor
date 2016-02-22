Rails.application.routes.draw do
  namespace :student do
  get 'sessions/index'
  end

  get 'static/index'

  match 'sign_up' => 'student/sessions#create', :via => [:get, :post]
end
