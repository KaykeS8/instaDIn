class FriendsController < ApplicationController
    layout 'dashboard'
    def new
        @users = User.all
        @friend = Friend.new
    end

    def create
        @followed = User.find(params[:id])
        Friend.create(current_user.id, @followed.id)
    end

    def destroy
    end
end
