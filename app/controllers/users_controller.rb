class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "新規登録しました"
      redirect_to :users
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to :users
      else
        render "edit"
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "削除しました"
    redirect_to :users
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :age, :infomation)
  end
end
