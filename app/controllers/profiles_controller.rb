class ProfilesController < ApplicationController
    layout "dashboard"
    def show
        @posts = Post.where(user_id: current_user.id)
    end

    def edit
    end
end
