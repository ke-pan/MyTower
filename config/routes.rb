Rails.application.routes.draw do
  resources :teams do
    resources :projects, only: [:index, :create, :new]
  end
  resources :projects, only: [:show, :destroy, :update, :edit] do
    resources :todos, except: [:edit, :new] do
      member do
        put :restore
        put :pause
        put :run
        put :finish
        put :reopen
        put :assign
      end
    end
  end
  resources :user
end
