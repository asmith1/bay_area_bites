# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BayAreaBites.Repo.insert!(%BayAreaBites.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# for parsing the food items:
# Remove "COLD TRUCK.", "cold truck", "cold truck:" (any case & with or without . or : at end)
# ignore menu items if there there are no colons & data is longer than X characters long
