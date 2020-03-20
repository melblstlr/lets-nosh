class RestaurantsController < ApplicationController
 
  skip_before_action(:force_user_sign_in, {:only =>[:index, :show]}) 

  def index
      @q = Restaurant.ransack(params[:q])
      @restaurants = @q.result(:distinct => true).includes(:meals, :dietary_guidances, :diets)

    render({ :template => "restaurants/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @restaurant = Restaurant.where({:id => the_id }).at(0)

    render({ :template => "restaurants/show_meals.html.erb" })
  end

  def create
    @restaurant = Restaurant.new
    @restaurant.restaurant_name = params.fetch("query_restaurant_name")
    @restaurant.address = params.fetch("query_address")
    @restaurant.image = params.fetch("query_image")
    @restaurant.chain = params.fetch("query_chain", false)

    if @restaurant.valid?
      @restaurant.save
      redirect_to("/restaurants", { :notice => "Restaurant created successfully." })
    else
      redirect_to("/restaurants", { :notice => "Restaurant failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @restaurant = Restaurant.where({ :id => the_id }).at(0)

    @restaurant.restaurant_name = params.fetch("query_restaurant_name")
    @restaurant.address = params.fetch("query_address")
    @restaurant.image = params.fetch("query_image")
    @restaurant.chain = params.fetch("query_chain", false)

    if @restaurant.valid?
      @restaurant.save
      redirect_to("/restaurants/#{@restaurant.id}", { :notice => "Restaurant updated successfully."} )
    else
      redirect_to("/restaurants/#{@restaurant.id}", { :alert => "Restaurant failed to update successfully." })
    end
  end

  def select
    name = params.fetch("query_restaurant_name")
    @restaurant = Restaurant.where({:restaurant_name => name}).at(0)
    redirect_to("/add_meal/#{@restaurant.id}")
  end

  def destroy
    the_id = params.fetch("path_id")
    @restaurant = Restaurant.where({ :id => the_id }).at(0)

    @restaurant.destroy
    redirect_to("/restaurants", { :notice => "Restaurant deleted successfully."} )
  end

  def add
    render({:template => "/restaurants/add_new_restaurant.html.erb"})
  end

end
