SprotsStore::Application.routes.draw do
  #resources :tasks

  resources :task_lists

  get "home/index"
  root 'home#index'
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/  }


  namespace :api, defaults: {format: :json} do 
    resources :task_lists, only: [:index, :create, :update, :destroy, :show] do
      resources :tasks, only: [:index, :create, :update, :destroy]
    end
  end

  get "/sample" => "home#sample"
 
end
