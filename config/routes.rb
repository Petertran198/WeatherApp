Rails.application.routes.draw do
  get 'test', to: "welcome#test"
  get 'index', to: "welcome#index"
  post 'index', to: "welcome#index"
  get 'previous_cities', to: "welcome#previous_cities"
  get 'city', to: "welcome#city"
  root 'welcome#test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
