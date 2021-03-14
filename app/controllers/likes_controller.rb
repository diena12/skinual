class LikesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @like = Like.create(review_id: @review.id, user_id: current_user.id)
    respond_to do |format|
      if @like.save
        format.js 
      end
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @like = Like.find_by(user_id: current_user.id, review_id: @review.id)
    @like.destroy
  end
end