class MessagesController < ApplicationController
  def receive_message
    byebug
    Message.receive!(
      employer_id: current_employe.id,
      applicant: Applicant.last,
      text: params[:message]
    )
  end

  def push_message
    Message.send!(
             employer_id: current_employe.id,
             applicant_id: Job.find_by_id(params[:job_application_id]).applicant_id,
             text: params[:message]
    )
  end

  def get_messages
    job_application = JobApplication.find_by_id(params[:job_application_id])


    messages = Message.where(employer_id: job_application.job.employer_id, applicant_id: job_application.applicant_id)
      .order('created_at ASC')
      .map do |message|
        {
          message: message.message,
          side: message.direction == 'sent' ? 'left' : 'right'
        }
      end
    respond_to do |format|
      format.json {render json: { applicant_name: job_application.applicant.full_name, messages: messages } }
    end
  end
end
