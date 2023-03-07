class CreateApprentices < ActiveRecord::Migration[6.1]
  def change
    create_table :apprentices do |t|
      t.integer :identificacion
      t.string :primernombre
      t.string :segundonombre
      t.string :primerapellido
      t.string :segundoapellido
      t.string :correo
      t.boolean :estado
      t.integer :ficha

      t.timestamps
    end
  end
end
