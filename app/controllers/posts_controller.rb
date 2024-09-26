class PostsController < ApplicationController
  layout 'dashboard'
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    return redirect_to posts_path, status: :created if @post.save!
    render :new, status: :unprocessable_entity
  end


  private
  def post_params
    params.require(:post).permit(:description, :number_of_likes, :image)
  end
end
