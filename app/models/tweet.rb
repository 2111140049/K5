class Tweet < ApplicationRecord
   has_many :likes
    has_many :likes_users, through: :likes, source: :tweet 
    has_many :likes, dependent: :destroy #ツイートを消すといいねも消え
    has_many :like_users, source: :user, through: :likes
    def like(user)
    likes.create(user_id: user.id)
    end
    
    def unlike(user)
    likes.find_by(user_id: user.id).destroy
    end
    
    def liked?(user) #いいね済みか調べる(true / false)
    like_users.include?(user)
    end
end
