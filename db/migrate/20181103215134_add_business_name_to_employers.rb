class AddBusinessNameToEmployers < ActiveRecord::Migration[5.2]
  def change
    add_column :employers, :business_name, :string
  end
end
