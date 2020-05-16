Rails.application.routes.draw do
  devise_for :users
  
  root 'homes#top'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :book_comments,only:[:create,:destroy] 
    resource :favorites,only:[:create, :destroy]
end
    resources :book_comments,only: [:destroy]

  
  get 'home/about' => 'homes#about'

end
