class AddBookToBets < ActiveRecord::Migration[6.1]
  def change
      add_reference :bets, :book, foreign_key: true
  end
end
