class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job_application, only: [:accept, :decline, :send_message]

  def create
    if current_applicant.get_status_by_job Job.find_by_id(params.dig(:job, :job_id))
      redirect_to Job.find_by_id(params.dig(:job, :job_id)), alert: 'Already applied'
    else
      JobApplication.create(job_id: params.dig( :job, :job_id), applicant_id: current_applicant.id)
      redirect_to(jobs_path, notice: 'Applied to the job successfully')
    end
  # Probably should look for more specific exceptions.
  rescue StandardError => ex
    redirect_to Job.find_by_id(params.dig(:job, :job_id)), alert: 'Unable to apply, please try again later'
  end

  def accept
    # job_application.status = 'Accepted'
    Message.testing("asdfadsf","234234")
    job_application.save!
  end

  def decline
    # job_application.status = 'Declined'
    job_application.save!
  end

  def send_message
    Message.send!(to: @job_application.applicant.phone_number, text: params[:message] )
  end

  private
  def set_job_application
    @job_application = JobApplication.find_by_id(params[:job_application_id])
  end

end
