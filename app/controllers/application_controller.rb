class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  before_action(:force_user_sign_in, {:except =>[:homepage]})
  
  def load_current_user
    the_id = session.fetch(:user_id)
    @current_user = User.where({ :id => the_id }).at(0)
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

  def homepage
      @q = Restaurant.ransack(params[:q])
      @restaurants = @q.result(:distinct => true).includes(:meals, :dietary_guidances, :diets)

    render({:template => "index.html.erb"})
  end

end
