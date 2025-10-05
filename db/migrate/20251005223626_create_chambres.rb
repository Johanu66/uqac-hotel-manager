class CreateChambres < ActiveRecord::Migration[8.0]
  def change
    create_table :chambres do |t|
      t.string :numero
      t.references :type_chambre, null: false, foreign_key: true
      t.integer :statut, default: 0
      t.text :description

      t.timestamps
    end
  end
end
