Rails.application.routes.draw do
  resources :users
  resources :transaction_entries, path_names: {new: 'new/(:user_id)' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
