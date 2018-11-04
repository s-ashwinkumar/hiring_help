class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :message
      t.integer :applicant_id
      t.integer :employer_id
      t.string :direction, default: 'sent'
      t.timestamps
    end
  end
end
