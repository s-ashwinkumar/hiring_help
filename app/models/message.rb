class Message < ApplicationRecord
  belongs_to :applicant
  belongs_to :employer
  def self.client(current_employer)
    @client ||=  Nexmo::Client.new(api_key: current_employer.nexmo_api_key,
                                   api_secret: current_employer.nexmo_secret_id)
  end

  def self.from_number(current_employer)
    @from_number ||= client(current_employer).numbers.list.numbers.first.msisdn
  end

  def left_or_right
    direction.downcase == 'sent' ? 'left' : 'right'
  end

  def self.send!(applicant:, employer:, text:)
    message = create!(employer_id: employer.id, applicant_id: applicant.id, message: text)
    client(employer).sms.send(from: from_number(employer), to: applicant.phone_number, text: text )
    message.send_cable
  end

  def self.receive!(employer:,applicant:, text:)
    message = create!(employer_id: employer.id, applicant_id: applicant.id, message: text, direction: 'Received')
    message.send_cable
  end

  def send_cable
    ActionCable.server.broadcast 'messages',
                                 applicant_name: applicant.full_name,
                                 message: message,
                                 direction: left_or_right
  end
end
