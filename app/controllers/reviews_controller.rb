class ReviewsController < ApplicationController
  before_action :set_category, only: [:new, :create, :edit, :update, :index]
  before_action :authenticate_user!

  def index
    @reviews = Review.includes(:category).order(id: "DESC")
  end

  def show
    @review = Review.find(params[:id])
  end


  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = "登録が完了しました。"
      redirect_to("/")
    else
      render("/reviews/new")
    end
  end

  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def set_category
    @category_parent = Category.where(ancestry: nil)
  end



  def review_params
    params.require(:review).permit(
      :name,
      :description,
      :price,
      :texture,
      :image,
      :category_id)
  end

end