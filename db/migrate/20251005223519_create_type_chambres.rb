class CreateTypeChambres < ActiveRecord::Migration[8.0]
  def change
    create_table :type_chambres do |t|
      t.string :nom
      t.text :description
      t.decimal :prix_par_nuit
      t.integer :capacite
      t.integer :nombre_total

      t.timestamps
    end
  end
end
