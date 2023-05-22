class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(
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
      flash[:notice] = "予約情報の確認をし再度お試しください"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(
      :title,
      :start_date,
      :end_date,
      :all_day,
      :introduction
      ))
      flash[:notice] = "スケジュールの更新をしました"
      redirect_to :posts
    else
      flash[:notice] = "再度更新をしてください"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "予約をキャンセルしました"
    redirect_to :posts
  end
end
