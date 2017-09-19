Rails.application.routes.draw do
  get 'pictures/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'cont', to: 'cont#index'
    get 'cont/index'
    get 'images/index'
    get 'images', to: 'images#index'
    get 'images', to: 'images#new'
    get 'pictures/index'
    get 'pictures', to: 'pictures#index'
    get 'pictures/add'
    get 'pictures/edit/:id', to: 'pictures#edit'
    post 'pictures/edit/:id', to: 'pictures#update'
    post 'pictures/add', to: 'pictures#create'
    patch 'pictures/edit/:id', to: 'pictures#update'
    get 'pictures/delete/:id', to: 'pictures#delete'
    get 'pictures/csv_download', to: 'pictures#csv_download'
    resources :images
    resources :images do
        member do
            get 'show_image'
        end
    end
end
