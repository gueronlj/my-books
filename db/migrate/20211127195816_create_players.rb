class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :contact, null: false
      t.float :balance
      t.integer :wins
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
