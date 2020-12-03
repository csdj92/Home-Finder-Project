class AddBuyerOrRealtorToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :is_buyer, :boolean
    add_column :accounts, :is_realtor, :boolean
  end
end
