# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all
LeadActor.destroy_all

will_smith = LeadActor.create!(name:'Will Smith', oscar: true, age: 53)
leonardo_dicaprio = LeadActor.create!(name:'Leonardo dicrapio', oscar: true, age: 47)
daniel_radcliffe = LeadActor.create!(name: "Daniel Radcliffe", oscar: false, age: 12)




will_smith.movies.create!(name:'King Richard', rating:90, over_two_hours: true, lead_actor_id:will_smith.id)
will_smith.movies.create!(name:'I Am Legend', rating:68, over_two_hours: false, lead_actor_id:will_smith.id)
will_smith.movies.create!(name:'The Pursuit of Happyness', rating:67, over_two_hours: false, lead_actor_id:will_smith.id)

leonardo_dicaprio.movies.create!(name:'Titanic', rating:87, over_two_hours: true, lead_actor_id:leonardo_dicaprio.id)
leonardo_dicaprio.movies.create!(name:'The Wolf of Wall Street', rating:79, over_two_hours: true, lead_actor_id:leonardo_dicaprio.id)
leonardo_dicaprio.movies.create!(name:'The Revenant', rating:78, over_two_hours: true, lead_actor_id:leonardo_dicaprio.id)

daniel_radcliffe.movies.create!(name:'Harry Potter: The Sorcerors Stone', rating:88, over_two_hours: true , lead_actor_id:daniel_radcliffe.id)
daniel_radcliffe.movies.create!(name:'Guns Akimbo', rating:51, over_two_hours: false , lead_actor_id:daniel_radcliffe.id)
daniel_radcliffe.movies.create!(name:'The Women in Black', rating:66, over_two_hours: false , lead_actor_id:daniel_radcliffe.id)
