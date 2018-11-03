# This is to prevent access of signup or signin pages once logged in.
module UserConcern
  extend ActiveSupport::Concern

  def full_name
    "#{first_name} #{last_name}"
  end
end