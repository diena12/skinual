class MypagesController < ApplicationController
  before_action :set_user
  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to mypage_path(@user)
  end

  def review_lists
  end

  def like_reviews
  end

  def comment_lists
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :skin_type, :profile, :image)
  end
end
