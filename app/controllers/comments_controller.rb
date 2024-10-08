class CommentsController < ApplicationController
    layout 'dashboard'
    before_action :find_post, only: [:index, :create]

    def index
        @comments = Comment.where(post_id: params[:post_id])
        @comment = Comment.new
    end
    
    def create
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to post_comments_path(@post), status: :created
        else
            render :index, status: :unprocessable_entity
        end
    end

    private
    def find_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:description)
    end
end
