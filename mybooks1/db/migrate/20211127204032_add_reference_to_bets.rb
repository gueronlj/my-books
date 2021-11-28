class AddReferenceToBets < ActiveRecord::Migration[6.1]
  def change
     add_reference :bets, :user, index: true, foreign_key: true
     add_reference :bets, :player, index: true, foreign_key: true
  end
end
