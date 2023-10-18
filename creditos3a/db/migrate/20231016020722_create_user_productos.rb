class CreateUserProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_productos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
