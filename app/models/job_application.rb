class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :applicant
  has_many :messages, dependent: :destroy

  def processed?
    status != 'Applied'
  end
end
