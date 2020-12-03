class AddGoogleImageToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :image, :text
  end
end
