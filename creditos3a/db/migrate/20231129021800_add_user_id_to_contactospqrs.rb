class AddUserIdToContactospqrs < ActiveRecord::Migration[6.1]
  def change
    add_reference :contactospqrs, :user, foreign_key: true
  end
end
