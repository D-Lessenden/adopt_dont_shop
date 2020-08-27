class ReviewsController < ApplicationController

  def index
    if params[:shelter_id]
      @shelter_id = params[:shelter_id]
      @reviews = Review.where shelter_id: params[:shelter_id]
     else
      @reviews = Review.all
     end
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    review = Review.new({
      title: params[:title],
      rating: params[:rating],
      content: params[:content],
      picture: params[:picture],
      shelter_id: params[:shelter_id]
      })

      if review.save
        redirect_to "/shelters/#{review.shelter_id}"
      else
        flash[:alert] = "Title, rating, and content are required fields"
        redirect_to "/shelters/#{review.shelter_id}/reviews/new"
      end

  end

  def edit
    @review = Review.find_by_id(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update({
      title: params[:title],
      rating: params[:rating],
      content: params[:content],
      picture: params[:picture],
      })

      if review.save
        redirect_to "/shelters/#{review.shelter_id}"
      else
        flash[:alert] = "Title, rating, and content are required fields"
        redirect_to "/reviews/#{review.id}/edit"
      end
  end


  def destroy
    Review.destroy(params[:id])
    redirect_to "/shelters"
  end
  # private
  # def review_params
  #      params.require(:review).permit(:title, :rating, :content, :picture, :shelter_id)
  # end

end
