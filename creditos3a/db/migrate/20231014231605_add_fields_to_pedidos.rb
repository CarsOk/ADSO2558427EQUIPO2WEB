class AddFieldsToPedidos < ActiveRecord::Migration[6.1]
  def change
    add_column :pedidos, :comentarios, :text
    add_column :pedidos, :metodo_pago, :string
  end
end
