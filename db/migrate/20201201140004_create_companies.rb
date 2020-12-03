class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :address
      t.integer :size
      t.integer :year_founded
      t.integer :revenue
      t.text :synopsis
      t.references :account
      t.timestamps
    end
  end
end
