class MealsController < ApplicationController
  def index
    @q = Meal.ransack(params[:q])
    @meals = @q.result(:distinct => true).includes(:restaurant, :dietary_guidances, :diets)

    render({ :template => "meals/index.html.erb" })
  end

  def show
    the_id = params.fetch("meal_id")
    @meal = Meal.where({:id => the_id }).at(0)

    render({ :template => "meals/show.html.erb" })
  end

  def create
    @meal = Meal.new
    @meal.meal_name = params.fetch("query_meal_name")
    @meal.image = params.fetch("query_image")
    @meal.description = params.fetch("query_description")
    @meal.restaurant_id = params.fetch("query_restaurant_id")
    @meal.creator_id = @current_user.id

    if @meal.valid?
      @meal.save
      redirect_to("/restaurants/#{@meal.restaurant_id}", { :notice => "Meal created successfully." })
    else
      redirect_to("/", { :notice => "Meal failed to create successfully." })
    end
  end

  def add
    @restaurant == nil
    
    render({:template => "meals/add_new_meal.html.erb"})
  end

  def add_from_restaurant
    @restaurant = Restaurant.where({:id => params.fetch("restaurant_id")}).at(0)

    render({:template => "meals/add_new_meal.html.erb"})
  end

  def update
    the_id = params.fetch("path_id")
    @meal = Meal.where({ :id => the_id }).at(0)

    @meal.meal_name = params.fetch("query_meal_name")
    @meal.image = params.fetch("query_image")
    @meal.description = params.fetch("query_description")
    @meal.restaurant_id = params.fetch("query_restaurant_id")
    @meal.creator_id = params.fetch("query_creator_id")

    if @meal.valid?
      @meal.save
      redirect_to("/meals/#{@meal.id}", { :notice => "Meal updated successfully."} )
    else
      redirect_to("/meals/#{@meal.id}", { :alert => "Meal failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @meal = Meal.where({ :id => the_id }).at(0)

    @meal.destroy

    redirect_to("/meals", { :notice => "Meal deleted successfully."} )
  end

end
