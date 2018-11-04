class Applicant < ApplicationRecord
  include UserConcern
  acts_as_taggable_on :skills
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :jobs, join_table: 'job_applications', dependent: :destroy
  has_many :job_applications


  def get_status_by_job(job_id)
    job_applications.where(job_id: job_id).first.try(:status)
  end
end
