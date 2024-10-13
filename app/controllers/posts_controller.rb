class PostsController < ApplicationController
  layout 'dashboard'
  before_action :set_post, only: [:destroy]
  def index
    @posts = Post.ordered
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      respond_to do |format|
        format.html {redirect_to(posts_path, status: :created, notice: 'Post was successfuly created')}
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy 
    @post.destroy
    redirect_to posts_path, status: :see_other
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :number_of_likes, :image)
  end
end
