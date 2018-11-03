Rails.application.routes.draw do
  resources :jobs
  devise_for :applicants, controllers: {
    registrations: 'applicants/registrations',
  }
  devise_for :employers, controllers: {
    registrations: 'employers/registrations'
  }
  post 'job_applications', to: 'job_applications#create', as: :job_applications

  root :to => "application#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
