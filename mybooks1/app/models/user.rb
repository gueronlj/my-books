class User < ApplicationRecord
   has_many :players
   has_many :bets
   has_many :books
   has_secure_password

   validates :username, presence: true
   validates :password, length: { minimum: 6 }, allow_nil: true #allow_nil so we can edit a user in the future without passing a password
end
