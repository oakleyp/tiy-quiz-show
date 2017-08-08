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
Quiz.create(
user_id: 1,
title: "world capitals",
published: false,
qajson: '[{"question":"capita of Greece","answers":["tabuli","viena","athens","rome"],"correct":"athens"},{"question":"capital of romania?","answers":["triesta","tirana","bucarest","corfu"],"correct":"bucarest"},{"question":"capital of Albania?","answers":["create","rome","tirana","voodoo"],"correct":"tirana"},{"question":"capita of china","answers":["beijin","cimchi","roman nudals","korea"],"correct":"Washington DC"},{"question":"Capital of Germany","answers":["frankfruit","switenduale","Amsterdam","berlin"],"correct":"berlin"},{"question":"capital of France","answers":["rome","french fries","crepes","paris"],"correct":"paris"},{"question":"capital of turkey","answers":["crete","kostandinopoli","hummus","ankara"],"correct":"ankara"},{"question":"Itali","answers":[],"correct":"rome"},{"question":"capital of afganistan","answers":["falaphel","kabul","india","gorgea"],"correct":"kabul"},{"question":"capital of japan","answers":["beijin","tokeyo","kobi","codi"],"correct":"tokyo"},{"question":"Bunus ? capita of USA","answers":["texas","NY","Washigton DC","Liberty statue"],"correct":"Washington DC"}]'
)

Quiz.create(
user_id: 1,
title: "ramdom medical questions",
published: false,
qajson: '[{"question":"Which neurotransmitter is responsible for inhibition and increased gregariousness?","answers":["GABA","Norepinepherine","Dopamine","Seratonin"],"correct":"GABA"},{"question":"Which metabolic pathway does the Atkins diet rely on?","answers":["Glycogen","Ketone","Lipid","Nutriene"],"correct":"Ketone"},{"question":"Which type of vertebrae are found in a human neck?","answers":["Cervical","Thoracic","Lumbar","Xenic"],"correct":"Cervical"},{"question":"What is the term for an iris containing more two different colors?","answers":["Heterochromia","Neutrochromia","Halogenhromia","Monochromia"],"correct":"Heterochromia"},{"question":"What is the medical term for difficulty swallowing?","answers":["Ganglion","Polycystic","Dyspareunia","Dysphagia"],"correct":"Dysphagia"},{"question":"What is the average velocity of a swallow carrying a coconut across a vast distance?","answers":[],"correct":""},{"question":"What primary macronutrient is hair made of?","answers":["Glucose","Lipids","Proteins","Arsenic"],"correct":"Proteins"},{"question":"Which type of seizure is responsible for the uncontrollable movement of limbs?","answers":["Hokey Pokey","Petit Mal","Grand Mal","Histrionic"],"correct":"Grand Mal"},{"question":"What are Phytonutrients?","answers":[],"correct":""},{"question":"What is a common counterindication of taking just about any prescription med ever?","answers":[],"correct":""}]'
)

Quiz.create(
user_id: 1,
title: "Game of Thrones",
published: false,
qajson: '[{"question":"What is the northernmost castle in Westeros","answers":["Winterfell","Castle Black","Highgarden","Dragonstone"],"correct":"Castle Black"},{"question":"What materials are NOT known to kill white walkers?","answers":["Dragonglass","Fire ","Valyrian steel","Nightshade"],"correct":"Nightshade"},{"question":"Of what region is Danaerys Targaryen the ruling Khaleesi?","answers":["Pentos","Qaarth","The Great Grass Sea","Valyria"],"correct":"The Great Grass Sea"},{"question":"What is Jamie Lannisters alias?","answers":["The King Slayer","The Mad King","The Golden Hand","King of the North"],"correct":"The King Slayer"},{"question":"What was the name of Danys unborn son?","answers":["Rhaego","Drogo","Balarian","Daario"],"correct":"Rhaego"}]'
)
Quiz.create(
user_id: 1,
title: "The big bang theory",
published: false,
qajson: '[{"question":"What is Sheldons job?","answers":["Theoretical Physicist","Biologist","Engineer","Astronomu"],"correct":"Theoretical Physicist"},{"question":"What is the name of Sheldons favorite cat?","answers":["Robert Oppenheimer","Sgt Fuzzyboots","Feinmen","Zazzles"],"correct":"Zazzles"},{"question":"Who owns the comic book store?","answers":["Barry","Howard","Will","Stuart"],"correct":"Stuart"},{"question":"What does Sheldon say after a joke?","answers":["Gotcha","Bazinga","Just kidding","Never mind"],"correct":"Bazinga"},{"question":"Who is Howards wife?","answers":["Penny","Bernadette","Beatrix","Amy"],"correct":"Bernadette"},{"question":"What is Rajs phobia early on?","answers":["spiders","talking to women","heights","cats"],"correct":"talking to women"},{"question":"What job does Penny eventually get?","answers":["pharmaceutical sales","nurse","secretary","paralegal"],"correct":"pharmaceutical sales"},{"question":"What is the name of Rajs dog?","answers":["Lady","Trixie","Cinnamon","Lega"],"correct":"Cinnamon"},{"question":"What does Amy study?","answers":["brains","bones","hematology","cancer"],"correct":"brains"},{"question":"What floor do Penny, Leonard, and Sheldon live on?","answers":["1","2","3","4"],"correct":"4"}]'
)
Quiz.create(
user_id: 1,
title: "The big bang theory",
published: false,
qajson: '[{"question":"What is Sheldons job?","answers":["Theoretical Physicist","Biologist","Engineer","Astronomu"],"correct":"Theoretical Physicist"},{"question":"What is the name of Sheldons favorite cat?","answers":["Robert Oppenheimer","Sgt Fuzzyboots","Feinmen","Zazzles"],"correct":"Zazzles"},{"question":"Who owns the comic book store?","answers":["Barry","Howard","Will","Stuart"],"correct":"Stuart"},{"question":"What does Sheldon say after a joke?","answers":["Gotcha","Bazinga","Just kidding","Never mind"],"correct":"Bazinga"},{"question":"Who is Howards wife?","answers":["Penny","Bernadette","Beatrix","Amy"],"correct":"Bernadette"},{"question":"What is Rajs phobia early on?","answers":["spiders","talking to women","heights","cats"],"correct":"talking to women"},{"question":"What job does Penny eventually get?","answers":["pharmaceutical sales","nurse","secretary","paralegal"],"correct":"pharmaceutical sales"},{"question":"What is the name of Rajs dog?","answers":["Lady","Trixie","Cinnamon","Lega"],"correct":"Cinnamon"},{"question":"What does Amy study?","answers":["brains","bones","hematology","cancer"],"correct":"brains"},{"question":"What floor do Penny, Leonard, and Sheldon live on?","answers":["1","2","3","4"],"correct":"4"}]'
)
# Submission Seeds
Submission.create(
  user_id: 2,
  quiz_id: 1,
  complete: true,
  correct: 0,
  possible: 3,
  qajson: '[{"question":"Who is the current U.S. President?","answers":["George Clooney","Mark Wahlberg","Donald Trump","Sarah Palin"],"correct":"Donald Trump","selection":"Sarah Palin"},{"question":"What color is the sky?","answers":["Green","Blue","Turquoise","Magenta"],"correct":"Blue","selection":"magenta"},{"question":"What is ruby","answers":["A language","A gem","A sport","An airline"],"correct":"A gem","selection":"A sport"}]'
)
