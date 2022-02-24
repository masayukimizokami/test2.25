class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "コメント新規投稿しました"
      redirect_to :users
    else
      render "posts"
    end
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to :users
      else
        render "edit"
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to :users
  end



  private
  def post_params
    params.require(:post).permit(:contents, :user_id)
  end
end
