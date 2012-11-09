Myapp10::Application.routes.draw do
  resources :marinas

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    collection do
      get :validate_manager, :path => "/validate_manager/:id"
      get :expire_manager, :path =>  "/expire_manager/:id"
      get :revalidate_manager, :path => "/revalidate_manager/:id"
      get :remove_expired_manager, :path =>  "/remove_expired_manager/:id"
      get :validate_user, :path => "/validate_user/:id"
      get :expire_user, :path =>  "/expire_user/:id"
      get :revalidate_user, :path => "/revalidate_user/:id"
      get :remove_expired_user, :path =>  "/remove_expired_user/:id"

    end

  end

  resources :marinas do
      collection do
        post :auto_complete_name
        get :search
        get :pending, :path => "/pending/:id"
      end


  end


end