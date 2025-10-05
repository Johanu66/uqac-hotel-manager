class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :type_chambre, null: false, foreign_key: true
      t.references :chambre, null: false, foreign_key: true
      t.date :date_arrivee
      t.date :date_depart
      t.integer :statut, default: 0
      t.decimal :prix_total
      t.datetime :date_creation

      t.timestamps
    end
  end
end
