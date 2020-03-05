Rails.application.routes.draw do



  # Routes for the Dietary guidance resource:

  # CREATE
  post("/insert_dietary_guidance", { :controller => "dietary_guidances", :action => "create" })
          
  # UPDATE
  post("/modify_dietary_guidance/:path_id", { :controller => "dietary_guidances", :action => "update" })
  
  # DELETE
  get("/delete_dietary_guidance/:path_id", { :controller => "dietary_guidances", :action => "destroy" })

  #------------------------------

  # Routes for the Diet resource:

  # CREATE
  post("/insert_diet", { :controller => "diets", :action => "create" })
          
  # READ
  get("/diets", { :controller => "diets", :action => "index" })
  
  
  # UPDATE
  
  post("/modify_diet/:path_id", { :controller => "diets", :action => "update" })
  
  # DELETE
  get("/delete_diet/:path_id", { :controller => "diets", :action => "destroy" })

  #------------------------------

  # Routes for the Meal resource:

  # CREATE
  post("/insert_meal", { :controller => "meals", :action => "create" })
          
  # READ
  get("/meals/:meal_id", { :controller => "meals", :action => "show" })
  
  
  # UPDATE
  
  post("/modify_meal/:path_id", { :controller => "meals", :action => "update" })
  
  # DELETE
  get("/delete_meal/:path_id", { :controller => "meals", :action => "destroy" })

  #------------------------------

  # Routes for the Restaurant resource:

  # CREATE
  post("/insert_restaurant", { :controller => "restaurants", :action => "create" })
          
  # READ
  get("/restaurants", { :controller => "restaurants", :action => "index" })
  
  get("/restaurants/:path_id", { :controller => "restaurants", :action => "show" })
  
  # UPDATE
  
  post("/modify_restaurant/:path_id", { :controller => "restaurants", :action => "update" })
  
  # DELETE
  get("/delete_restaurant/:path_id", { :controller => "restaurants", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
