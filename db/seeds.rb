# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'johndoe123', email: 'johndoe@test.com', password: 'password123', name: 'john doe')

Workout.create(name: 'running', description: 'jogging for 10 minutes', duration: 20, difficulty: 'Hard level of difficulty')
Workout.create(name: 'walking', description: 'walk at a brisk pace for 10 minutes', duration: 60, difficulty: 'Hard level of difficulty')
Workout.create(name: 'lifting', description: 'lift light weights. ask PT for rep amounts and duration', duration: 5, difficulty: 'Easy level of difficulty')
Workout.create(name: 'Balance Protocol', description: 'Improve static and dynamic functional balance', duration: 30, difficulty: 'Moderate level of difficulty')