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
      title: params[:review][:title],
      rating: params[:review][:rating],
      content: params[:review][:content],
      picture: params[:review][:picture],
      shelter_id: params[:shelter_id]
      })

      review.save
      redirect_to "/shelters/#{review.shelter_id}"

    # if !review.save
    #   flash[:alert] = "All fields are required except for picture"
    #   render :new
    # else
    # redirect_to "/shelters/#{review.shelter_id}"
    # end

    # review = Review.create(review_params)
    # if review.valid?
    #   redirect_to "/shelters/#{review.shelter_id}"
    # else
    #   flash[:errors] = review.errors.full_messages
    # end

  end

  def edit
    @review = Review.find_by_id(params[:id])
  end

  def update
    review = Review.find_by_id(params[:id])
    review.update({
      title: params[:review][:title],
      rating: params[:review][:rating],
      content: params[:review][:content],
      picture: params[:review][:picture],
      shelter_id: params[:shelter_id]
      })
      review.save
      redirect_to "/shelters/#{review.shelter_id}"
  end


  def destroy
    Review.destroy(params[:id])
    redirect_to "/shelters/#{review.shelter_id}"
  end
  # private
  # def review_params
  #      params.require(:review).permit(:title, :rating, :content, :picture, :shelter_id)
  # end

end
