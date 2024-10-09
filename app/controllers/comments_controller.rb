class CommentsController < ApplicationController
    layout 'dashboard'
    before_action :find_post, only: [:index, :create]

    def index
        @comments = Comment.where(post_id: params[:post_id]).order(id: :desc)
        @comment = Comment.new
    end
    
    def create
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            respond_to do |format|
                format.html { redirect_to(post_comments_path(@post), status: :created)}
                format.turbo_stream 
            end
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
