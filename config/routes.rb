Rails.application.routes.draw do
  resources :checklist_root_causes
  resources :checklists
  resources :root_causes
  resources :kpis
  resources :scales
  resources :carriers
  resources :vessels
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
