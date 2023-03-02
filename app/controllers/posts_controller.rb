class PostsController < ApplicationController

  before_action :today_date

  def today_date
    @today_date = Time.zone.now
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title,:start_at,:end_at,:is_all_day,:description))

    if @post.save
      redirect_to posts_url, notice: "スケジュールを登録しました"
    else
      flash.now[:failure] = "スケジュールの登録に失敗しました"
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params.require(:post).permit(:title, :start_at, :end_at, :is_all_day, :description))
      redirect_to posts_url, notice: "スケジュールを編集しました"
    else
      flash.now[:failure] = 'スケジュールの編集に失敗しました'
      render "edit" 
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  
    flash[:notice] = 'スケジュールを削除しました'
    redirect_to posts_url, status: :see_other
  end
end

private

  def post_params
    params.require(:post).permit(:name, :description)
  end