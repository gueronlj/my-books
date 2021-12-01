class Book < ApplicationRecord
   belongs_to :user
   has_many :bets
   has_many :players

   validates :user_id, presence: true
   validates :name, presence: true
end
