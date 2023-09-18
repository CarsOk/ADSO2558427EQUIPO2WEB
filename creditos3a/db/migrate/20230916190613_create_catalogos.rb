class CreateCatalogos < ActiveRecord::Migration[6.1]
  def change
    create_table :catalogos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
