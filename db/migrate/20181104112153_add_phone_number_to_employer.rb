class AddPhoneNumberToEmployer < ActiveRecord::Migration[5.2]
  def change
    add_column :employers, :phone_number, :string
  end
end
