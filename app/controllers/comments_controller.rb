class CommentsController < ApplicationController
    layout 'dashboard'
    before_action :find_post, only: [:index]

    def index
        @comments = Comment.where(post_id: params[:post_id])
    end

    private
    def find_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:description)
    end
end
