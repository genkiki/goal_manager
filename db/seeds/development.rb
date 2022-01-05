# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GoalState.create(state: '予定')
GoalState.create(state: '実施中')
GoalState.create(state: '達成')
GoalState.create(state: '達成ならず')
TaskState.create(state: '予定')
TaskState.create(state: '実施中')
TaskState.create(state: '完了')