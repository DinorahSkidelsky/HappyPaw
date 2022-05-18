class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.text :observation
      t.string :phone_number
      t.boolean :confirmation
      t.references :user, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
