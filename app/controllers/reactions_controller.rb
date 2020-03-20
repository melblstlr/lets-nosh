class ReactionsController < ApplicationController
  def index
    @reactions = Reaction.all.order({ :created_at => :desc })

    render({ :template => "reactions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @reaction = Reaction.where({:id => the_id }).at(0)

    render({ :template => "reactions/show.html.erb" })
  end

  def create_like
    @reaction = Reaction.new
    @reaction.reaction = "like"
    @reaction.meal_id = params.fetch("query_meal_id")
    @reaction.user_id = @current_user.id

    if @reaction.valid?
      @reaction.save
      redirect_to("/meals/#{@reaction.meal_id}")
    else
      redirect_to("/meals/#{@reaction.meal_id}", { :notice => "Reaction failed to create successfully." })
    end
  end

  def create_dislike
    @reaction = Reaction.new
    @reaction.reaction = "dislike"
    @reaction.meal_id = params.fetch("query_meal_id")
    @reaction.user_id = @current_user.id

    if @reaction.valid?
      @reaction.save
      redirect_to("/meals/#{@reaction.meal_id}")
    else
      redirect_to("/meals/#{@reaction.meal_id}", { :notice => "Reaction failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @reaction = Reaction.where({ :id => the_id }).at(0)

    @reaction.reaction = params.fetch("query_reaction")
    @reaction.meal_id = params.fetch("query_meal_id")
    @reaction.user_id = params.fetch("query_user_id")

    if @reaction.valid?
      @reaction.save
      redirect_to("/reactions/#{@reaction.id}", { :notice => "Reaction updated successfully."} )
    else
      redirect_to("/reactions/#{@reaction.id}", { :alert => "Reaction failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @reaction = Reaction.where({ :id => the_id }).at(0)

    @reaction.destroy

    redirect_to(request.referrer)
  end
end
