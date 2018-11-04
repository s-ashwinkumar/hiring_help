Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :jobs
  devise_for :applicants, controllers: {
    registrations: 'applicants/registrations',
  }
  devise_for :employers, controllers: {
    registrations: 'employers/registrations'
  }
  post 'job_applications', to: 'job_applications#create', as: :job_applications


  get 'applicants/profile', to: 'applicant#applicant_profile', as: 'applicant_profile'
  get 'employer/profile', to: 'employer#employer_profile', as: 'employer_profile'
  get '/login', to: 'application#login', as: 'login'
  get '/signup', to: 'application#signup', as: 'signup'
  post 'accept_application', to: 'job_applications#accept'
  post 'decline_application', to: 'job_applications#decline'
  post 'start_job', to: 'job_applications#start_job'
  post 'finish_job', to: 'job_applications#finish_job'
  get 'get_chat', to: 'messages#get_messages'
  post 'send_message', to: 'messages#push_message'
  post 'receive_message', to: 'messages#receive_message'
  root :to => "application#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
