class FriendsController < ApplicationController
    layout 'dashboard'
    def new
        @friends_id = current_user.followers.pluck(:followed_id)
        @users = User.where.not(id: @friends_id + [current_user.id])
    end

    def create
        @followed = User.find(params[:id])
        current_user.followers.create!(followed_id: @followed.id)
    end
end