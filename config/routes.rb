Rails.application.routes.draw do


  # Routes for the Reaction resource:

  # CREATE
  post("/insert_like", { :controller => "reactions", :action => "create_like" })
  post("/insert_dislike", { :controller => "reactions", :action => "create_dislike" })

  # READ
  get("/reactions", { :controller => "reactions", :action => "index" })
  
  get("/reactions/:path_id", { :controller => "reactions", :action => "show" })
  
  # UPDATE
  post("/modify_reaction/:path_id", { :controller => "reactions", :action => "update" })
  
  # DELETE
  get("/delete_reaction/:path_id", { :controller => "reactions", :action => "destroy" })

  #------------------------------

  get("/", {:controller => "application", :action => "homepage"})

  # Routes for the Dietary guidance resource:

  # CREATE
  post("/insert_dietary_guidance", { :controller => "dietary_guidances", :action => "create" })
          
  # UPDATE
  post("/modify_dietary_guidance/:path_id", { :controller => "dietary_guidances", :action => "update" })
  
  # DELETE
  get("/delete_dietary_guidance/:path_id", { :controller => "dietary_guidances", :action => "destroy" })

  #------------------------------

  # Routes for the Diet resource:

  # READ
  get("/diets", { :controller => "diets", :action => "index" })
  
  #------------------------------

  # Routes for the Meal resource:

  # CREATE
  post("/insert_meal", { :controller => "meals", :action => "create" })
  get("/add_meal",{:controller => "meals", :action => "add"})
  get("/add_meal/:restaurant_id", { :controller => "meals", :action => "add_from_restaurant" })

  # READ
  get("/meals", {:controller => "meals", :action => "index"})
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
  post("/select_restaurant", {:controller => "restaurants", :action =>"select"})
  get("/add_restaurant", {:controller => "restaurants", :action => "add"})

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
  get("/user_profile", { :controller => "users", :action => "user_profile" })       
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
