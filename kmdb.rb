# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# **************************
studio = Studio.new
studio["name"] = "Warner Bros."
studio.save

warner = Studio.find_by({ "name" => "Warner Bros." })

movies = Movie.new
movies["title"] = "Batman Begins"
movies["year_released"] = 2005
movies["rated"] = "PG-13"
movies["studio_id"] = warner["id"]
movies.save

movies2 = Movie.new
movies2["title"] = "The Dark Knight"
movies2["year_released"] = 2008
movies2["rated"] = "PG-13"
movies2["studio_id"] = warner["id"]
movies2.save

movies3 = Movie.new
movies3["title"] = "The Dark Night Rises"
movies3["year_released"] = 2012
movies3["rated"] = "PG-13"
movies3["studio_id"] = warner["id"]
movies3.save

##Add Actors for first film
actors = Actor.new
actors["name"]="Christian Bale"
actors.save

actors2 = Actor.new
actors2["name"]="Michael Caine"
actors2.save

actors3 = Actor.new
actors3["name"]="Liam Neeson"
actors3.save

actors4 = Actor.new
actors4["name"]="Katie Holmes"
actors4.save

actors5 = Actor.new
actors5["name"]="Gary Oldman"
actors5.save

##Assign roles for first film
roles = Role.new
roles["movie_id"]=movies["id"]
# actor = Actor.find_by({ "name" => "Christian Bale" })
roles["actor_id"]=actors["id"]
roles["character_name"]="Bruce Wayne"
roles.save

roles2 = Role.new
roles["movie_id"]=movies["id"]
# actor2 = Actor.find_by({ "name" => "Michael Caine" })
roles2["actor_id"]=actors2["id"]
roles2["character_name"]="Alfred"
roles2.save

roles3 = Role.new
roles["movie_id"]=movies["id"]
# actor3 = Actor.find_by({ "name" => "Liam Neeson" })
roles3["actor_id"]=actors3["id"]
roles3["character_name"]="Ra's Al Ghul"
roles3.save

roles4 = Role.new
roles["movie_id"]=movies["id"]
# actor4 = Actor.find_by({ "name" => "Katie Holmes" })
roles4["actor_id"]=actors4["id"]
roles4["character_name"]="Rachel Dawes"
roles4.save

roles5 = Role.new
roles["movie_id"]=movies["id"]
# actor5 = Actor.find_by({ "name" => "Gary Oldman" })
roles5["actor_id"]=actors5["id"]
roles5["character_name"]="Commissioner Gordon"
roles5.save


##Assign Actors and roles for second film
actors6 = Actor.new
actors6["name"]="Heath Ledger"
actors6.save

actors7 = Actor.new
actors7["name"]="Aaron Eckhart"
actors7.save

actors8 = Actor.new
actors8["name"]="Maggie Gyllenhaal"
actors8.save

roles6 = Role.new
roles6["movie_id"]=movies2["id"]
# actor3 = Actor.find_by({ "name" => "Christian Bale" })
roles6["actor_id"]=actors["id"]
roles6["character_name"]="Bruce Wayne"
roles6.save

roles7 = Role.new
roles7["movie_id"]=movies2["id"]
# actor4 = Actor.find_by({ "name" => "Heath Ledger" })
roles7["actor_id"]=actors6["id"]
roles7["character_name"]="Joker"
roles7.save

roles8 = Role.new
roles8["movie_id"]=movies2["id"]
# actor5 = Actor.find_by({ "name" => "Aaron Eckhart" })
roles8["actor_id"]=actors7["id"]
roles8["character_name"]="Harvey Dent"
roles8.save

roles9 = Role.new
roles9["movie_id"]=movies2["id"]
actor6 = Actor.find_by({ "name" => "Michael Caine" })
roles9["actor_id"]=actors2["id"]
roles9["character_name"]="Alfred"
roles9.save

roles10 = Role.new
roles10["movie_id"]=movies2["id"]
# actor7 = Actor.find_by({ "name" => "Maggie Gyllenhaal" })
roles10["actor_id"]=actors8["id"]
roles10["character_name"]="Rachel Dawes"
roles10.save


##Insert Actors and roles for final movie
actors9 = Actor.new
actors9["name"]="Tom Hardy"
actors9.save

actors10 = Actor.new
actors10["name"]="Joseph Gordon-Levitt"
actors10.save

actors11 = Actor.new
actors11["name"]="Anne Hathaway"
actors11.save

roles11 = Role.new
roles11["movie_id"]=movies3["id"]
# actor3 = Actor.find_by({ "name" => "Christian Bale" })
roles11["actor_id"]=actors["id"]
roles11["character_name"]="Bruce Wayne"
roles11.save

roles12 = Role.new
roles12["movie_id"]=movies["id"]
# actor4 = Actor.find_by({ "name" => "Heath Ledger" })
roles12["actor_id"]=actors5["id"]
roles12["character_name"]="Commissioner Gordon"
roles12.save

roles13 = Role.new
roles13["movie_id"]=movies2["id"]
# actor5 = Actor.find_by({ "name" => "Aaron Eckhart" })
roles13["actor_id"]=actors9["id"]
roles13["character_name"]="Bane"
roles13.save

roles14 = Role.new
roles14["movie_id"]=movies2["id"]
# actor6 = Actor.find_by({ "name" => "Michael Caine" })
roles14["actor_id"]=actors10["id"]
roles14["character_name"]="John Blake"
roles14.save

roles15 = Role.new
roles15["movie_id"]=movies2["id"]
# actor7 = Actor.find_by({ "name" => "Maggie Gyllenhaal" })
roles15["actor_id"]=actors11["id"]
roles15["character_name"]="Selina Kyle"
roles15.save



# # - Insert and read contact data for companies in the database

# # 1. insert new rows in the contacts table with relationship to a company

# # first query to find the row in companies for Apple
# apple = Company.find_by({ "name" => "Apple" })

# contact = Contact.new
# contact["first_name"] = "Tim"
# contact["last_name"] = "Cook"
# contact["email"] = "tim@apple.com"
# contact["company_id"] = apple["id"]
# contact.save

# contact = Contact.new
# contact["first_name"] = "Craig"
# contact["last_name"] = "Federighi"
# contact["email"] = "craig@apple.com"
# contact["company_id"] = apple["id"]
# contact.save

# amazon = Company.find_by({ "name" => "Amazon" })

# contact = Contact.new
# contact["first_name"] = "Jeff"
# contact["last_name"] = "Bezos"
# contact["email"] = "jeff@amazon.com"
# contact["company_id"] = amazon["id"]
# contact.save

puts "There are #{Studio.all.count} studios"
puts "There are #{Movie.all.count} movies"
puts "There are #{Actor.all.count} actors"
puts "There are #{Role.all.count} roles"

puts "Movies"
puts "======"
puts ""
all_movies = Movie.all
for movie in all_movies
    # read each contact row's first_name and last_name columns
    name = movie["title"]
    year = movie["year_released"]
    rating = movie["rated"]
    studio_id = movie["studio_id"]
    studio_record = Studio.find_by({ "id" => studio_id })
    studio_name = studio_record["name"]
    puts "#{name} #{year} #{rating} #{studio_name}"
  end

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""
roles = Role.all
for role in roles
    # read each contact row's first_name and last_name columns
    movie = Movie.find_by({"id" => role["movie_id"]})
    actor = Actor.find_by({"id" => role["actor_id"]})
    puts "#{movie["title"]} #{actor["actor_name"]} #{role["movie_role"]}"
##
    # actor_id = role["actor_id"]
    # actor_record = Actor.find_by({ "id" => actor_id })
    # actor_name = actor_record["name"]
    # role_name = role["character_name"]
    
    # movie_record = Movie.find_by({ "id" => role["movie_id"] })
    # puts movie_record.inspect
    # movie_names = movie_record["title"]
    # puts "#{movie_names} #{actor_name} #{role_name}"
  end