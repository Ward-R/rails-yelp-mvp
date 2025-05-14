class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      # when it saves -> go to the restaurants show page
      redirect_to restaurant_path(@restaurant)
    else
      # when it doesnt save -> show the form again
      render 'new', status: :unprocessable_entity # throws a 422 (for Turbo)
    end
  end
  def index
    @restaurants = Restaurant.all
  end

  def restaurant_params
    # Strong params -> white listing the attributes users can give us in the form
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
