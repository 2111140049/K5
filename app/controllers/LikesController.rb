class LikesController < ApplicationController
    def create
        tweet = Tweet.find(params[:tweet_id])
        user = User.find_by(uid: session[:login_uid])
        user.like_tweets << tweet
        redirect_to root_path
    end
    def destroy
       # logger << "add "
        #logger.debug params[:tweet_id]
        tweet = Tweet.find_by(params[:id])
        user = User.find_by(uid: session[:login_uid])
        tweet.likes.find_by(user_id: user.id).destroy
        redirect_to root_path
    end
end