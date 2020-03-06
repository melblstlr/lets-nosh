class RestaurantsController < ApplicationController
  def index

    @diets = []
    Diet.pluck(:diet_name).each do |diet|
      d = params.fetch("#{diet}", false)
      if d != false
        @diets.push(diet)
      end
    end

    if @diets == nil
      @restaurants = Restaurant.all.order({ :restaurant_name => :desc })
    else 
      compliant_restaurants = []
      Restaurant.all.each do |restaurant|
      rd = restaurant.diet.pluck(:diet_name)
      compliance = []

         
        @diets.each do |search|
          if rd.include?(search)
            compliance.push(true)
          end
        end

        if compliance.count == @diets.count
          compliant_restaurants.push(restaurant.id)
        end
        
      end
      @restaurants = Restaurant.where({:id => compliant_restaurants}).order({ :restaurant_name => :desc })
    end
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

  def destroy
    the_id = params.fetch("path_id")
    @restaurant = Restaurant.where({ :id => the_id }).at(0)

    @restaurant.destroy

    redirect_to("/restaurants", { :notice => "Restaurant deleted successfully."} )
  end


end
