class CreateMotorcycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycles do |t|
      t.string :title
      t.string :model
      t.string :description
      t.float :price
      t.integer :duration
      t.integer :discount
      t.references :user, null: false, foreign_key: { to_table: :users }, index:true

      t.timestamps
    end
  end
end
