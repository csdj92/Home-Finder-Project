class AddPhotoToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :image_data, :text
  end
end
