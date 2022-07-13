class AddImagesToMotorcycles < ActiveRecord::Migration[7.0]
  def change
    add_column :motorcycles, :images, :json
  end
end
