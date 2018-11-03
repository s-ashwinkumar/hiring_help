module JobsHelper
  def get_badge(job)
    badge_type, text = current_applicant.already_applied?(job) ? ["success","Applied"] : ["info","Open"]
    "<span class='badge badge-pill badge-#{badge_type}'>#{text}</span>".html_safe
  end
end
