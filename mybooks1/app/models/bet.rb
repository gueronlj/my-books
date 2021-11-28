class Bet < ApplicationRecord
   belongs_to :user

   validates :player_id, presence: true
   validates :prop, presence: true
   validates :value, presence: true
end
