class Book < ApplicationRecord
   belongs_to :user
   has_many :bets
   has_many :players
end
