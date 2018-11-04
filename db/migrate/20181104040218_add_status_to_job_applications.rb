class AddStatusToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :status, :string, default: 'Applied'
  end
end
