Rails.application.routes.draw do
  namespace :student do
  get 'sessions/index'
  end

  get 'static/index'
  get 'static/register' => 'static#register'
  get 'static/tankyou' => 'static#thankyou'
  match 'sign_up' => 'student/sessions#create', :via => [:get, :post]
end
