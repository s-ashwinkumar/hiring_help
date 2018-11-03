module ApplicationHelper
  def destroy_user_session_path
    return destroy_applicant_session_path if applicant_signed_in?
    return destroy_employer_session_path if employer_signed_in?
  end
end
