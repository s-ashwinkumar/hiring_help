class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.integer :job_id, null: false
      t.integer :applicant_id, null: false

      t.timestamps null: false
      t.timestamps
    end
  end
end
