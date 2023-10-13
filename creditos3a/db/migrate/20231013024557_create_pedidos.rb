class CreatePedidos < ActiveRecord::Migration[6.1]
  def change
    create_table :pedidos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
