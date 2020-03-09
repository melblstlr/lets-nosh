namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
    require 'faker'

    User.delete_all
    Restaurant.delete_all
    Meal.delete_all
    Diet.delete_all
    DietaryGuidance.delete_all

    mel = User.new
    mel.email = "melissaboelstler@gmail.com"
    mel.password = "password"
    mel.first_name = "Melissa"
    mel.last_name = "Boelstler"
    mel.username = "mboelstler"
    mel.save
    p mel.errors.full_messages

    20.times do
      u = User.new
      u.first_name = Faker::Name.first_name
      u.last_name = Faker::Name.last_name
      u.email = u.first_name + u.last_name + "@example.com"
      u.password = "password"
      u.username = u.first_name.at(0) + u.last_name 
      
      u.save
      # p u.errors.full_messages 
      # p "user"
    end

    15.times do
      r = Restaurant.new
      r.restaurant_name = Faker::Restaurant.name
      r.address = Faker::Address.full_address
      r.chain = [true, false].sample
    
      r.save
      # p r.errors.full_messages 
      # p "rest"
    end

    75.times do
      m = Meal.new
      m.meal_name = Faker::Food.dish
      m.description = Faker::Food.description
      m.creator_id = User.pluck(:id).sample
      m.restaurant_id = Restaurant.pluck(:id).sample
    
      m.save
       p m.errors.full_messages
      p "meal" 
    end

    gf=Diet.new
    gf.diet_name = "Gluten Free"
    gf.diet_description = "A Gluten Free Diet removes gluten, a protein found in most grains. The gluten found in wheat, barley, rye and triticale (a cross between wheat and rye) can trigger serious health problems or other insensitivities."
    gf.website_link = "https://www.mayoclinic.org/healthy-lifestyle/nutrition-and-healthy-eating/in-depth/gluten-free-diet/art-20048530"
    gf.save
    # p gf.errors.full_messages
    # p "gf"

    df = Diet.new
    df.diet_name = "Dairy Free"
    df.diet_description = "This diet removes all products that contain dairy."
    df.website_link = "https://www.godairyfree.org/dairy-free-information/new-to-the-dairy-free-diet-start-here"
    df.save
    # p df.errors.full_messages
    # p "df"
    
    nf = Diet.new
    nf.diet_name = "Nut Free"
    nf.diet_description = "This diet removes all products that contain nuts, including peanuts."
    nf.website_link = "https://www.bbcgoodfood.com/howto/guide/spotlight-nut-free-diets"
    nf.save
    p nf.errors.full_messages
    p "nf"

    sf = Diet.new
    sf.diet_name = "Soy Free"
    sf.diet_description = "This diet removes all products containing soy."
    sf.website_link = "https://www.verywellhealth.com/food-and-ingredients-to-avoid-on-a-soy-free-diet-1324000"
    sf.save
    p sf.errors.full_messages
    p "sf"

    v = Diet.new
    v.diet_name = "Vegetarian"
    v.diet_description = "At a high level, vegtarian diets exclude animal products, but this can be interpreted in many ways. In this case, we define vegtarian the lacto-ovo vegetarian. This is a diet excluding animal meats and fish, but including egg and milk products."
    v.website_link = "https://www.mayoclinic.org/healthy-lifestyle/nutrition-and-healthy-eating/in-depth/vegetarian-diet/art-20046446"
    v.save
    p v.errors.full_messages
    p "v"

    veg = Diet.new
    veg.diet_name = "Vegan"
    veg.diet_description = "Vegan diets exclude meat, poultry, fish, eggs and dairy products — and foods that contain these products. The vegan diet would also exclude honey, as it is an animal by-product."
    veg.website_link = "https://www.vegan.com"
    veg.save
    p veg.errors.full_messages
    p "veg"

    keto = Diet.new
    keto.diet_name = "Keto"
    keto.diet_description = "The ketogenic diet is a very low-carb, high-fat diet that shares many similarities with the Atkins and low-carb diets."
    keto.website_link = "https://www.healthline.com/nutrition/ketogenic-diet-101#what-it-is"
    keto.save
    p keto.errors.full_messages
    p "keto"

    paleo = Diet.new
    paleo.diet_name = "Paleo"
    paleo.diet_description = "A paleo diet typically includes lean meats, fish, fruits, vegetables, nuts and seeds — foods that in the past could be obtained by hunting and gathering. A paleo diet limits foods that became common when farming emerged about 10,000 years ago. These foods include dairy products, legumes and grains."
    paleo.website_link = "https://www.mayoclinic.org/healthy-lifestyle/nutrition-and-healthy-eating/in-depth/paleo-diet/art-20111182"
    paleo.save
    p paleo.errors.full_messages
    p "paleo"


    100.times do
      d = DietaryGuidance.new
      d.diet_id = Diet.pluck(:id).sample
      d.meal_id = Meal.pluck(:id).sample
   
      d.save
      # p d.errors.full_messages
      # p "dg"
    end

    200.times do
      r= Reaction.new
      r.user_id = User.pluck(:id).sample
      r.meal_id = Meal.pluck(:id).sample
      r.reaction = ["like","dislike"].sample
      r.save
    end

  end
end
