class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.integer :identificacion
      t.string :nombre
      t.string :sexo
      t.string :edad
      t.string :direccion

      t.timestamps
    end
  end
end
