class DietaryGuidancesController < ApplicationController
  def index
    @dietary_guidances = DietaryGuidance.all.order({ :created_at => :desc })

    render({ :template => "dietary_guidances/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @dietary_guidance = DietaryGuidance.where({:id => the_id }).at(0)

    render({ :template => "dietary_guidances/show.html.erb" })
  end

  def create
    @dietary_guidance = DietaryGuidance.new
    @dietary_guidance.meal_id = params.fetch("query_meal_id")
    @dietary_guidance.diet_id = params.fetch("query_diet_id")

    if @dietary_guidance.valid?
      @dietary_guidance.save
      redirect_to("/dietary_guidances", { :notice => "Dietary guidance created successfully." })
    else
      redirect_to("/dietary_guidances", { :notice => "Dietary guidance failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @dietary_guidance = DietaryGuidance.where({ :id => the_id }).at(0)

    @dietary_guidance.meal_id = params.fetch("query_meal_id")
    @dietary_guidance.diet_id = params.fetch("query_diet_id")

    if @dietary_guidance.valid?
      @dietary_guidance.save
      redirect_to("/dietary_guidances/#{@dietary_guidance.id}", { :notice => "Dietary guidance updated successfully."} )
    else
      redirect_to("/dietary_guidances/#{@dietary_guidance.id}", { :alert => "Dietary guidance failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @dietary_guidance = DietaryGuidance.where({ :id => the_id }).at(0)

    @dietary_guidance.destroy

    redirect_to("/dietary_guidances", { :notice => "Dietary guidance deleted successfully."} )
  end
end
