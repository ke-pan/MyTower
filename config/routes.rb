Rails.application.routes.draw do
  resources :teams do
    resources :projects, only: [:index, :create, :new]
  end
  resources :projects, only: [:show, :destroy, :update, :edit] do
    resources :todos, except: [:edit, :new] do
      put :retore, on: :member
    end
  end
  resources :user
end
