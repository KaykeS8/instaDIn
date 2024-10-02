class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]

    def create
        @post.likes.create(user_id: current_user.id)
        @post.number_of_likes += 1
        @post.save
        redirect_to(post_path)
    end

    def destroy
        @like.destroy if already_liked?
        @post.number_of_likes -= 1
        @post.save
        redirect_to(post_path)
    end

    private
    def find_post
        @post = Post.find(params[:post_id])
    end

    def find_like
        @like = @post.likes.find(params[:id])
    end

    def already_liked?
        Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end
end