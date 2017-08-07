# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User seeds
User.create(
  name: "Admin Admin",
  username: "admin",
  email: "admin@aol.com",
  role: "admin",
  password: "Password"
)

User.create(
  name: "Parade Goat",
  username: "paradegoat",
  email: "goat@aol.com",
  role: "user",
  password: "Password"
)

# Quiz Seeds
Quiz.create(
  user_id: 1,
  title: "Fake Quiz",
  published: false,
  qajson: '[{"question":"Who is the current U.S. President?","answers":["George Clooney","Mark Wahlberg","Donald Trump","Sarah Palin"],"correct":"Donald Trump"},{"question":"What color is the sky?","answers":["Green","Blue","Turquoise","Magenta"],"correct":"Blue"},{"question":"What is ruby","answers":["A language","A gem","A sport","An airline"],"correct":"A gem"}]'
)

# Submission Seeds
Submission.create(
  user_id: 2,
  quiz_id: 1,
  complete: false,
  correct: 0,
  possible: 3,
  qajson: '[{"question":"Who is the current U.S. President?","answers":["George Clooney","Mark Wahlberg","Donald Trump","Sarah Palin"],"correct":"Donald Trump","selection":""},{"question":"What color is the sky?","answers":["Green","Blue","Turquoise","Magenta"],"correct":"Blue","selection":""},{"question":"What is ruby","answers":["A language","A gem","A sport","An airline"],"correct":"A gem","selection":""}]'
)
