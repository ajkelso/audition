# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
actor1 = Actor.create(name: "Tom Hanks", email: 'hanx@hanx.com', phone_number: 5558675301, password: "pw")
actor2 = Actor.create(name: "Meryl Streep", email: 'meryl@streep.com', phone_number: 5558675302, password: "pw")
actor3 = Actor.create(name: "Brad Pitt", email: 'brad@pitt.com', phone_number: 5558675303, password: "pw")
director1 = Director.create(name: "Stephen Spielberg", email: 'ET@phonehome.com', phone_number: 5558675304, password: "pw")
director2 = Director.create(name: "Jerry Mitchell", email: 'jerry@jerry.com', phone_number: 5558675305, password: "pw")
director3 = Director.create(name: "Alfred Hitchcock", email: 'al@hitch.com', phone_number: 5558675306, password: "pw")
casting1 = Casting.create(name: "Bernie Telsey", email: 'bern@tels.com', phone_number: 5558675307, password: "pw")
casting2 = Casting.create(name: "Alison Estrin", email: 'ally@est.com', phone_number: 5558675308, password: "pw")
casting3 = Casting.create(name: "Tara Rubin", email: "tara@rubin.com", phone_number: 3452453567, password: "pw")
project1 = Project.create(title: "Home Alone", medium: "Theater", director_id: 1, casting_id: 1)
project2 = Project.create(title: "Flatiron", medium: "TV", director_id: 2, casting_id: 2)
project3 = Project.create(title: "Star Wars 17", medium: "Film", director_id: 3, casting_id: 3, seeking: false)
