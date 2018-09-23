# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'activerecord-import'
require 'json'

courses=JSON.parse(open('db/jsonData/course.json').read).map {|x|x.except('independent_study','subjects','requirements')}
Course.import courses
instructors=JSON.parse(open('db/jsonData/instructor.json').read)
Instructor.import instructors
subjects=JSON.parse(open('db/jsonData/subject.json').read).map {|x|x.except('segments')}
Subject.import subjects