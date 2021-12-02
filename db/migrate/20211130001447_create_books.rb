class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name, null: false
      t.float :balance
      t.timestamps
    end
  end
end
