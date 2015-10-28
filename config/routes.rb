Rails.application.routes.draw do
  namespace :admin do
    resources :moderators, only: [:index, :edit, :update]
  end
end
