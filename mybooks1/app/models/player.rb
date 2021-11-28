class Player < ApplicationRecord
   belongs_to :user
   has_many :bets

   validates :name, presence: true
   validates :contact, presence: true
end
