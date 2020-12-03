class AddCompanyIdToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :company_id, :integer
    
  end
end
