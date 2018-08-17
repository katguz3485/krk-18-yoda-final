# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  authenticated :user do
    root 'documents#index', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end

  get 'about', to: 'root#about'

  root 'welcome#home'

  resources :documents
  get 'digitize', to: 'documents#new'
  get 'dashboard', to: 'documents#index'
  resources :buckets
end
