class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      t.string :player
      t.string :prop
      t.float :value
      t.boolean :win

      t.timestamps
    end
  end
end
