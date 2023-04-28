class DropProductosTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :productos
  end
end
