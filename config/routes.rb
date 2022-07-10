# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    namespace :v1 do
      post '/login', to: 'sessions#login'
      post '/signup', to: 'sessions#signup'

      namespace :my_account do
        get '/', to: 'users#show'
        patch '/', to: 'users#update'
        delete '/', to: 'users#destroy'
      end

      get '/is_authenticated', to: 'is_authenticated#index'
    end
  end
end
