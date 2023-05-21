class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(
      :content,
      :title,
      :start_date,
      :end_date,
      :all_day,
      :introduction
      ))
    if @post.save
        flash[:notice] = "スケジュールの予約が完了しました"
        redirect_to :posts
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を消去しました"
    redirect_to :posts
  end
end
