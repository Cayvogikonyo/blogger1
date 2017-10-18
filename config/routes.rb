Rails.application.routes.draw do
  get 'password_resets/create'

  get 'password_resets/edit'

  get 'password_resets/update'

  mount Ckeditor::Engine => '/ckeditor'
	root to: 'categories#index'
	resources :categories
	resources :articles do
		resources :comments
	end
	resources :tags
	resources :authors do
		resources :users
	end
	resources :author_sessions, only: [ :new, :create, :destroy ]
	resources :password_resets

	get 'login' => 'author_sessions#new'
	get 'logout' => 'author_sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
