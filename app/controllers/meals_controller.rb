class MealsController < ApplicationController
    skip_before_action(:force_user_sign_in, {:only =>[:index, :show]}) 


  def index
    @q = Meal.ransack(params[:q])
    @meals = @q.result(:distinct => true).includes(:restaurant, :dietary_guidances, :diets)

    render({ :template => "meals/index.html.erb" })
  end

  def show
    the_id = params.fetch("meal_id")
    @meal = Meal.where({:id => the_id }).at(0)
    diet_id = DietaryGuidance.where({:meal_id => @meal.id}).pluck(:diet_id)
    @diets = Diet.where({:id => diet_id}).pluck(:diet_name)

    render({ :template => "meals/show.html.erb" })
  end

  def create
    @meal = Meal.new
    @meal.meal_name = params.fetch("query_meal_name")
    @meal.description = params.fetch("query_description")
    @meal.restaurant_id = params.fetch("query_restaurant_id")
    @meal.creator_id = @current_user.id

    if @meal.valid?
      @meal.save

      Diet.pluck(:id).each do |diet_id|
        diet_name = Diet.where({:id => diet_id}).pluck(:diet_name).at(0)
        checked = params.fetch(diet_name, nil)
        if checked == "on"
          guidance = DietaryGuidance.new
          guidance.meal_id = @meal.id 
          guidance.diet_id = diet_id 
          guidance.save
        end
      end

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
    @meal.description = params.fetch("query_description")


    if @meal.valid?
      @meal.save

      old_guidance = DietaryGuidance.where({:meal_id => @meal.id})
      old_guidance.destroy_all

      Diet.pluck(:id).each do |diet_id|
        diet_name = Diet.where({:id => diet_id}).pluck(:diet_name).at(0)
        checked = params.fetch(diet_name, nil)
        if checked == "on"
          guidance = DietaryGuidance.new
          guidance.meal_id = @meal.id 
          guidance.diet_id = diet_id 
          guidance.save
        end
      end

      redirect_to("/meals/#{@meal.id}", { :notice => "Meal updated successfully."} )
    else
      redirect_to("/meals/#{@meal.id}", { :alert => "Meal failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @meal = Meal.where({ :id => the_id }).at(0)

    @meal.destroy

    redirect_to( request.referrer )
  end

end
