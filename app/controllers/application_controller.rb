class ApplicationController < ActionController::Base
  devise_group :user, contains: [:applicant, :employer]

  def index
    redirect_to jobs_path if helpers.user_signed_in?
  end
end
