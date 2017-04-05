Rails.application.routes.draw do
  root 'welcome#index'
  get 'home/index', as: 'user_root'
  get 'welcome/index'

  devise_for :users, controllers: {
      omniauth_callbacks: 'omniauth_callbacks'
  }
end
