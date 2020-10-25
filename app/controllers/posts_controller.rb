class PostsController < ApplicationController

  before_action :authenticate_user!

	def new
    @post = Post.new
    @post.audios.build
  end

  def create
    @post = Post.create(post_params)
    if @post.audios.present?
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def index
    @posts = Post.limit(10).includes(:audios, :user).order('created_at DESC')
  end

private
  def post_params
    params.require(:post).permit(:caption,audios_attributes:[:audio]).merge(user_id: current_user.id)
  end
end

