class FlatsController < ApplicationController
  def index
    if params[:query].present?
      @flats = Flat.where('name ILIKE ?', "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
  end

  def new
    @flat = Flat.new # needed to instantiate the form_for
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end

    # no need for app/views/restaurants/create.html.erb
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
