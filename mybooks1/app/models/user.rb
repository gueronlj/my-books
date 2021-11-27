class User < ApplicationRecord
   has_many :players
   has_many :taken_bets, through: :bets, source: :player
   has_secure_password

   validates :username, presence: true
   validates :password, presence: true

   validates :password, length: { minimum: 8 }, allow_nil: true #allow_nil so we can edit a user in the future without passing a password
end
