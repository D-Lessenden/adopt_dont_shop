class ReviewsController < ApplicationController
  def index
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    review = Review.new({
      title: params[:review][:title],
      rating: params[:review][:rating],
      content: params[:review][:content],
      picture: params[:review][:picture],
      shelter_id: params[:shelter_id]
      })
    review.save
    redirect_to "/shelters/#{review.shelter_id}"
  end

  # private
  # def review_params
  #      params.require(:review).permit(:tile, :rating, :content, :picture, :shelter_id)
  # end

end
