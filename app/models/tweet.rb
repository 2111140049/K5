class Tweet < ApplicationRecord
   has_many :likes
    has_many :likes_users, through: :likes, source: :tweet 
end
