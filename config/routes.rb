# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    namespace :v1 do
      post '/login', to: 'sessions#login'
      post '/signup', to: 'sessions#signup'
      get '/test_authentication', to: 'test_authetication#hello_world'
    end
  end
end
