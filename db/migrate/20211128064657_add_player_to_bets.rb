class AddPlayerToBets < ActiveRecord::Migration[6.1]
  def change
     add_reference :bets, :player, foreign_key: true
  end
end
