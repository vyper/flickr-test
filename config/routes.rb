Rails.application.routes.draw do
  devise_for :users

  root 'pictures#index'
end
