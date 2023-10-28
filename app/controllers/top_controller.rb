class TopController < ApplicationController
    
       def main
           #use=User.new(uid: 1,pass: 'one',age: 99)
        if session[:login_uid]!=nil
            @tweets=Tweet.all
            render "main"and return
        else 
            @tweets=Tweet.all
          #  render "main"

        end
    end
    #___________tweet__________
    def new
      @tweet = Tweet.new
    end
    def create
      @tweet = Tweet.new(message: params[:tweet][:message],user_id: session[:login_uid])
      if @tweet.save
        flash[:notice] = '1レコード追加しました'
        redirect_to '/'
      else
        render 'new'
      end
    end
    def show
    @tweets=Tweet.all
        if session[:login_uid]!=nil
          @tweet = Tweet.find(session[:login_uid])
          logger.debug("show")
           render "main"
        else
            @tweets=Tweet.all
              render "main"
        end
        
    end
    def update
      @tweet = Tweet.find_by(params[:id])
      if @tweet.update(message: params[:tweet][:message])
        flash[:notice] = '1レコード更新しました'
        redirect_to '/'
      else
        render 'edit'
      end
    end
    #_____________tweet _________
    
    def login
        @tweets=Tweet.all
        require 'bcrypt'
        if User.find_by(uid: params[:uid]) 
            user =User.find_by(uid: params[:uid])
            
            if BCrypt::Password.new(user.pass) == params[:pass]
              session[:login_uid] = params[:uid]
              
              redirect_to top_main_path and return
            end
            render "main"
        end
    end
    def cID
        if User.find_by(uid: params[:uid]) 
            #エラー
            render "cID"
        else
            #正常
            require 'bcrypt'
            newpass = BCrypt::Password.create(params[:pass])
            use=User.new(uid: params[:uid],pass:  newpass, age:  params[:age])
            use.save
            @tweets=Tweet.all
            render "main"
        end
    end

    
    def top_logout_path
        session.delete(:login_uid)
        redirect_to top_main_path
    end
    
    
end
