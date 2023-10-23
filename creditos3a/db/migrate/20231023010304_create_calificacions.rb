class CreateCalificacions < ActiveRecord::Migration[6.1]
  def change
    create_table :calificacions do |t|
      t.integer :rating
      t.text :review
      t.references :producto, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
