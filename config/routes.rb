Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :users do 
    resources :users
  end 

  root 'homes#index'
  resources :homes
  resources :job_categorys
  namespace :admin do 
    resources :jobs
    get 'my_jobs', :to => 'jobs#my_jobs'
  end
end
