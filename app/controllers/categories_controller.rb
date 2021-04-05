class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def show
    @category_parent = Category.where(ancestry: nil)
    @reviews = Review.where(category_id: params[:id])
  end
end
