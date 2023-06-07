class CreateContactospqrs < ActiveRecord::Migration[6.1]
  def change
    create_table :contactospqrs do |t|
      t.string :nombre
      t.string :email
      t.string :asunto
      t.text :mensaje

      t.timestamps
    end
  end
end
