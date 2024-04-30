Rails.application.routes.draw do
  root 'dashboard#index'
  get 'dashboard/index', to: 'dashboard#index'
end
