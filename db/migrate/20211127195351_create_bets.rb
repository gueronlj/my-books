class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      # t.references :player, index: true, foreign_key: true
      t.string :prop
      t.integer :value
      t.float :juice

      t.timestamps
    end
  end
end
