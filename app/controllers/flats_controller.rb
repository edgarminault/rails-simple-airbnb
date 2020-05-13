class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def new
    @restaurant = Restaurant.new # needed to instantiate the form_for
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end

    # no need for app/views/restaurants/create.html.erb
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
