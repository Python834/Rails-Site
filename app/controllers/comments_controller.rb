class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @product = Product.find(params[:product_id])
    @product.comments.create(comment_params)
    @product.save
    redirect_to product_path(@product.id)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product.id)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:author, :opinion, :rating, :product_id)
    end
end
