class JobApplicationsController < ApplicationController
  before_action :authenticate_applicant!

  def create
    if current_applicant.already_applied? Job.find_by_id(params.dig(:job, :job_id))
      redirect_to Job.find_by_id(params.dig(:job, :job_id)), alert: 'Already applied'
    else
      JobApplication.create(job_id: params.dig( :job, :job_id), applicant_id: current_applicant.id)
      redirect_to(jobs_path, notice: 'Applied to the job successfully')
    end
  # Probably should look for more specific exceptions.
  rescue StandardError => ex
    redirect_to Job.find_by_id(params.dig(:job, :job_id)), alert: 'Unable to apply, please try again later'
  end
end
