class AddProductoIdToContactospqrs < ActiveRecord::Migration[6.1]
  def change
    add_reference :contactospqrs, :producto, foreign_key: true
  end
end
