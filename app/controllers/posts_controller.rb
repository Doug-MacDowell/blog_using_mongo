class PostsController < ApplicationController

  def index
    @posts =Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Your Post has been added to our blog!"
      redirect_to posts_path
    else
      flash[:error] = "Could not add this Post"
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

end
