class ReviewsController < ApplicationController
  before_action :set_category, only: [:new, :create, :edit, :update, :index]
  before_action :authenticate_user!

  def index
    @reviews = Review.includes(:category).order(id: "DESC").page(params[:page]).per(3)

  end

  def show
    @review = Review.find(params[:id])
    @comments = @review.comments  
    @comment = current_user.comments.new
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

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def ranking
    @all_ranks = Review.find(Like.group(:review_id).order('count(review_id) desc').limit(3).pluck(:review_id))
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