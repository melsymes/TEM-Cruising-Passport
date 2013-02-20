Myapp10::Application.routes.draw do





scope '(:locale)', :locale => /en|es-ES|fr-FR/ do

  resources :marinas
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    collection do
      get :search
      get :validate_manager, :path => "validate_manager/:id"
      get :validate_admin, :path => "validate_admin/:id"
      get :expire_manager, :path =>  "/expire_manager/:id"
      get :revalidate_manager, :path => "/revalidate_manager/:id"
      get :remove_expired_manager, :path =>  "/remove_expired_manager/:id"
      get :validate_bertholder, :path => "/validate_bertholder/:id"
      get :expire_bertholder, :path =>  "/expire_bertholder/:id"
      get :revalidate_bertholder, :path => "/revalidate_bertholder/:id"
      get :remove_expired_bertholder, :path =>  "/remove_expired_bertholder/:id"
      get :remove_pending, :path => "/remove_pending/:id"
      #get :update, :path => "/update/:id"
    end

  end

  resources :marinas do
      collection do
        post :auto_complete_name
        get :search
        get :pending, :path => "/pending/:id"
        post :create_user
      end


  end
end

end