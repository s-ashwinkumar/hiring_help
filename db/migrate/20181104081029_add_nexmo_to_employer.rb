class AddNexmoToEmployer < ActiveRecord::Migration[5.2]
  def change
    add_column :employers, :nexmo_api_key, :string
    add_column :employers, :nexmo_secret_id, :string
  end
end
