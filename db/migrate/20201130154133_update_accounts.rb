class UpdateAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column(:accounts, :provider, :string, limit: 50, null: false, default: '')
    add_column(:accounts, :uid, :string, limit: 500, null: false, default: '')
  end
end
