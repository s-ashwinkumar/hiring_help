class Job < ApplicationRecord
  belongs_to :employer
  has_and_belongs_to_many :applicants, join_table: 'job_applications', dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true

  # If employer return only their job posts. Else all posts
  def self.get_jobs(employer: nil)
    return all unless employer
    employer.jobs
  end

  def applicant_names
    applicants.map(&:full_name).uniq.join(' , ')
  end

  def employer_name
    employer.full_name
  end
end
