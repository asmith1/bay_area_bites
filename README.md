# BayAreaBites

The main functionality of this application is to import and display the San Francisco food truck data. It loads it into its database and displays it on a website. You can scroll through to browse food trucks and you can click into different food trucks for more information! You can edit the food trucks directly on the website and save them to update that record. The application supports loading food truck data from a CSV through a script. This can be done repeatedly when the CSV gets new food trucks added to it or updates its menu and it will update that data in the database. This website is meant as a way to transition off of using the old system so that this site can be used to track food truck data going forward. (Hypothetically of course!)

To run locally:

  * Run `mix setup` to install and setup dependencies
  * You'll need to set up a local postgres database called "bay_area_bites"
      * See `config/dev.exs` for the config information
  * Import data from the CSV to seed the database for the first time by running `mix import_data_from_csv`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now site is live at [`localhost:4000`](http://localhost:4000)
