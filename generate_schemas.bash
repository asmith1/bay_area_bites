mix phx.gen.html Schema FoodTruck food_trucks \
    location_id:integer \
    name:string \
    facility_type:string \
    location_description:string \
    address:string \
    status:string \
    x_coordinate:float \
    y_coordinate:float \
    latitude:float \
    longitude:float \
    link_to_schedule_pdf:string \
    schedule_description:string

mix phx.gen.html Schema FoodItems food_items \
    name:string

mix phx.gen.html Schema FoodTruckFoodItem food_truck_food_items \
    food_truck_id:integer \
    food_item_id:integer

# I'm using a join table with a many-to-many relationship to food_trucks
# to enable easily searching menu by food truck as well as querying by food items offered.
# This also allows customization on how we display the food items on the UI
