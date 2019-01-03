class ReviewsController < ApplicationController

  def index
    @price = params[:price]

    if @price.present?
      @reviews = Review.where(price: @price)
    else
      @reviews = Review.all
    end

  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(form_params)
    if @review.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(form_params)
    redirect_to review_path(@review)
  end

  private

  def form_params
    params.require(:review).permit(:title, :body, :score, :restaurant, :ambiance, :price, :cuisine)
  end
end

