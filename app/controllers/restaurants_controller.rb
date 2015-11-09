class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all 
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(
      name: params[:restaurant][:name],
      description: params[:restaurant][:description],
      address_1: params[:restaurant][:address_1],
      address_2: params[:restaurant][:address_2],
      phone_number: params[:restaurant][:phone_number]
      )

    if @restaurant.save
      redirect_to action: :show, id: @restaurant.id
    else
      redirect_to action: :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant.find(params[:restaurant][:attributes])
    if @restaurant.update(params[:restaurant][:attributes])
      redirect_to action: :show, id: @restaurant.id
    else
      redirect_to action: :show, id: @restaurant.id
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to action: :index
  end
end
