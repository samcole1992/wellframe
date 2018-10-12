Rails.application.routes.draw do

  resources :medications do
      resources :patients do
      patch 'assign'
      patch 'remove'
    end
  end

  resources :patients
end
