class UsersController < ApplicationController

	def show
    @user = User.find_by(id: params[:id])
  end

  def user_params
  	params.require(:user).permit(:name, :email, :image)
	end

	def avater_update
		@user = User.find_by(id: params[:id])
		@user.image = params[:image]
		@user.save!
		redirect_to user_path
      flash[:notice] = "投稿が保存されました"
	end
end
