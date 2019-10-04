class PostsController < ApplicationController
  def index
    @posts=Post.all
  end

  def new
  @posts=Post.new
  end

  def create
    post = Post.create(post_params)
    post.user_id= current_user.id
    post.save
    redirect_to "/"
  end

  def show
    @post= Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

 def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    Post.find(params["id"]).destroy
    redirect_to posts_path
  end

  def perfil
  end
  
  private
  def post_params
    params.require(:post).permit(:caption, :picture)
  end
end
