class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :applicant
  has_many :messages, dependent: :destroy

  def ready_to_start?
    status != 'Accepted'
  end

  def started?
    status == 'Started'
  end

  def finished?
    status == 'Finished'
  end

  def declined?
    status == 'Declined'
  end
end
