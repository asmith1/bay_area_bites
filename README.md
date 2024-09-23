# BayAreaBites

The main functionality of this application is to import and display the San Francisco food truck data. It loads it into its database and displays it on a website. This website is meant as a way to transition off of using the old system so that this site can be used to track food truck data going forward. (Hypothetically of course!) 

You can scroll through to browse food trucks and you can click into different food trucks for more information! You can edit the food trucks directly on the website and save them to update that record. The application supports loading food truck data from a CSV through a script. This can be done repeatedly when the CSV gets new food trucks added to it or updates its menu and it will update that data in the database. 

## Getting started:

  * Run `mix setup` to install and setup dependencies
  * You'll need to set up a local postgres database called "bay_area_bites"
      * See `config/dev.exs` for the config information
  * Import data from the CSV to seed the database for the first time by running `mix import_data_from_csv`
  * Start server by running `mix phx.server`
    * This will put the website live at [`localhost:4000`](http://localhost:4000)

## Usage:

For adding new food trucks to the site, you can replace `priv/food_truck_data.csv` with a new CSV and then run `mix import_data_from_csv` as many times as you'd like. Note that the application will assume that the location id is unique per food truck. 

- The home page can be found at [`localhost:4000`](http://localhost:4000), but it doesn't do much
- The main content can be found at [`localhost:4000/food_trucks`](http://localhost:4000/food_trucks)

There are also 2 more routes that are not very useful as they are currently built, but if you'd like to take a look they can be found at:
- [`localhost:4000/food_items`](http://localhost:4000/food_items)
- [`localhost:4000/food_truck_food_items`](http://localhost:4000/food_truck_food_items)

## Future Additions (if time allowed):
I left "TODO" comments throughout the codebase to detail additions I would make if I had more time. To list a few, high level, I would like to:


- Add the menu to the food truck show page
- Add the food trucks to the food items show page
   - I designed the database with these 2 items in mind, taking a future-focused approach. As it stands, the database structure seems rather silly. With these 2 additional features, however, it would be pretty cool!
- Add a search bar to the food trucks index page
- Make the home page nicer
- Add more logging
- Add more comprehensive testing
