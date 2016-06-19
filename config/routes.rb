Rails.application.routes.draw do
  resources :teams, shallow: true do
    resources :projects do
      resources :todos, except: [:edit, :new] do
        put :retore, on: :member
      end
    end
  end
end
