class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:receive_message]
  def receive_message
    Message.receive!(
      employer: Employer.find_by_phone_number(params[:to]),
      applicant: Applicant.find_by_phone_number(params[:msisdn]),
      text: params[:text]
    )
    render json: {
      status: 200,
    }.to_json
  end

  def push_message
    job_application = JobApplication.find_by_id(params[:job_application_id])
    Message.send!(
             employer: current_employer,
             applicant: job_application.applicant,
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
