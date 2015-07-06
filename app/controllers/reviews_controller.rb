class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  respond_to :html

  def create
    @blog = Blog.find(params[:blog_id])
    @blog.reviews.create(review_params)
    @blog.save
    redirect_to blog_path(@blog.id)
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @review = @blog.reviews.find(params[:id])
    @review.destroy
    redirect_to blog_path(@blog.id)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :author, :opinion, :rating, :thumbnail)
    end
end
