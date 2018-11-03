# This is to prevent access of signup or signin pages once logged in.
module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if user_signed_in?
      redirect_to(root_path) && return
    end
  end
end