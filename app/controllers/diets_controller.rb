class DietsController < ApplicationController

  skip_before_action(:force_user_sign_in, {:only =>[:index, :show]}) 

  def index
    @diets = Diet.all.order({ :diet_name => :desc })

    render({ :template => "diets/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @diet = Diet.where({:id => the_id }).at(0)

    render({ :template => "diets/show.html.erb" })
  end

  def create
    @diet = Diet.new
    @diet.diet_name = params.fetch("query_diet_name")
    @diet.diet_description = params.fetch("query_diet_description")
    @diet.website_link = params.fetch("query_website_link")

    if @diet.valid?
      @diet.save
      redirect_to("/diets", { :notice => "Diet created successfully." })
    else
      redirect_to("/diets", { :notice => "Diet failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @diet = Diet.where({ :id => the_id }).at(0)

    @diet.diet_name = params.fetch("query_diet_name")
    @diet.diet_description = params.fetch("query_diet_description")
    @diet.website_link = params.fetch("query_website_link")

    if @diet.valid?
      @diet.save
      redirect_to("/diets/#{@diet.id}", { :notice => "Diet updated successfully."} )
    else
      redirect_to("/diets/#{@diet.id}", { :alert => "Diet failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @diet = Diet.where({ :id => the_id }).at(0)

    @diet.destroy

    redirect_to("/diets", { :notice => "Diet deleted successfully."} )
  end
end
