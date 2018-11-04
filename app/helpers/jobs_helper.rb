module JobsHelper
  def get_badge(job_id)
    badge_map = {
      "Applied" => "primary",
      "Accepted" => "success",
      "Declined" => "danger",
      "Open" => "info"
    }
    status = current_applicant.get_status_by_job(job_id) || "Open"
    "<h5><span class='badge badge-#{badge_map[status]}'>#{status}</span></h5>".html_safe
  end
end
