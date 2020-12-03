class AddDataToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :photo, :string
  end
end
