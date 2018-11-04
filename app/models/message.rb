class Message < ApplicationRecord

  def self.client
    @client ||=  Nexmo::Client.new(api_key: current_employer.nexmo_api_key,
                                   api_secret: current_employer.nexmo_secret_id)
  end

  def self.from_number
    @from_number ||= client.numbers.first.msisdn
  end

  def left_or_right
    direction.downcase == 'sent' ? 'left' : 'right'
  end

  def self.send!(applicant_id:, employer_id:, text:)
    applicant = Applicant.find_by_id(to)
    message = create!(employer_id: employer_id, applicant_id: applicant_id, message: text)
    client.sms.send(from: employer_id, to: applicant_id, text: text )
    send_cable(message: text,
               direction: message.left_or_right,
               applicant_name: applicant.full_name )
  end

  def self.receive!(employer_id:,applicant:, text:)
    message = create!(employer_id: employer_id, applicant_id: applicant.id, message: text, direction: 'Received')
    send_cable(message: text,
               direction:  message.left_or_right,
               applicant_name: applicant.full_name )
  end

  def self.send_cable(message:,direction:, applicant_name:)
    ActionCable.server.broadcast 'messages',
                                 applicant_name: applicant_name,
                                 message: message,
                                 direction: direction
  end
end
