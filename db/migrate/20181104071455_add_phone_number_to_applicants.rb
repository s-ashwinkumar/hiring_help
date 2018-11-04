class AddPhoneNumberToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :phone_number, :string
  end
end
