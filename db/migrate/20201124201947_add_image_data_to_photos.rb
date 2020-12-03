class AddImageDataToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :image_data, :text
  end
end
