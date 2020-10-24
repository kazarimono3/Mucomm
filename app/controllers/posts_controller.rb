class PostsController < ApplicationController

  before_action :authenticate_user!

	def new
    @post = Post.new
    @post.audios.build
  end

  def create
    @post = Post.new(post_params)
    binding.pry
    if @post.audios.present?
      @post.save
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
    params.require(:post).permit(:caption).merge(user_id: current_user.id)
  end

  def audio_params
    params.require(:post).permit(:audio).merge(user_id: current_user.id)
  end
end

