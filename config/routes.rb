require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users
  # namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/' do
  namespace :api, defaults: {format: :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      get 'profile', action: :show_profile, controller: 'users'
      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :courses
      resources :topics
      resources :cards
      resources :topic_progresses, only: [:index, :create, :update]
      resources :user_courses
    end
  end
end
