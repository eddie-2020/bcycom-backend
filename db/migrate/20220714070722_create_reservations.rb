class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :phone
      t.references :user, null: false, foreign_key: { to_table: :users }, index:true
      t.references :motorcycle, null: false, foreign_key: { to_table: :motorcycles }, index:true

      t.timestamps
    end
  end
end
