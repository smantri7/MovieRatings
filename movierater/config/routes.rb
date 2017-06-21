Rails.application.routes.draw do |map|
	resources :movies do
		resources :commets
	end
	resources :users
	resources :bosses
	root 'users#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
