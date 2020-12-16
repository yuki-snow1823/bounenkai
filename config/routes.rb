Rails.application.routes.draw do
  root to:'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  get 'danger' => 'books#danger', as: "danger"
  get 'ougon' => 'users#ougon', as: "ougon"
  get 'correct' => 'users#correct', as: "correct"
  get 'dangerbtn' => 'users#dangerbtn', as: "dangerbtn"
  get "zoma" => "boss#zoma", as: "zoma" 
  get "clear" => "boss#clear", as: "clear" 
end
