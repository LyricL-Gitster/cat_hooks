# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

webhook_user_attrs = [
  { name: "Peter Venkman", url: "https://httpstat.us/200" },
  { name: "Gozer", url: "https://httpstat.us/500" }
]
WebhookUser.create! webhook_user_attrs

vehicle_attrs = [
  "Articulated Dump truck (ADT)",
  "Articulated Track Tractors",
  "Asphalt Pavers - Screed",
  "Asphalt Pavers - tracked",
  "Asphalt Pavers - wheeled",
  "Backhoe Loaders",
  "Bucket Wheel Excavator",
  "Challenger Tractor",
  "Cold Planers",
  "Combine harvesters",
  "D-series (Diesel)",
  "Draglines",
  "Drills",
  "Extra-Large Mining Excavators",
  "Feller buncher, wheeled",
  "Feller bunchers & Harvesters, tracked",
  "Forest Machines",
  "Forklifts",
  "Forwarder, wheeled",
  "Harvester, wheeled",
  "Haul Truck - semi trailer",
  "Integrated tool carriers",
  "Knuckleboom Loader",
  "Large Excavators",
  "Lexion",
  "Long Reach Excavators",
  "Material handler",
  "Medium Excavators",
  "Mini Excavators",
  "Motorgraders",
  "On-road trucks",
  "Pipelayers - Sidebooms",
  "R-series (Petrol)",
  "Rigid Dump Trucks",
  "Road Reclaimers",
  "Rollers",
  "Rope Shovels",
  "Skid steer, tracked",
  "Skid steer, wheeled",
  "Skidder, tracked",
  "Skidder, wheeled",
  "Small Excavators",
  "Telehandlers",
  "Track Loaders",
  "Track-type tractors (bulldozers)",
  "Ultra-High Demolition Excavators",
  "Utility vehicles",
  "Wheel Dozer/Soil/Landfill Compactors",
  "Wheel Excavators",
  "Wheel Loaders",
  "Wheel type Tractors",
  "Wheeled Scrapers"
].inject([]) do |memo, name|
  memo << { name:, count: rand(42) }
end
Vehicle.create! vehicle_attrs
