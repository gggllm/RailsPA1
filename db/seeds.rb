# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'activerecord-import'
require 'json'

courses_json=JSON.parse(open('db/jsonData/course.json').read)
segments_json=courses_json.flat_map {|x|x["subjects"].map{|segment|{"course_code"=>x["code"],"subject_id"=>segment["id"],"segment_id"=>segment["segment"]}}}

segments_json_by_course_code=segments_json.group_by {|x|x["course_code"]}

courses=courses_json.map {|x|x.except('independent_study','subjects','requirements')}
Course.import courses

Course.all.each{|course|segments_json_by_course_code[course.code].each {|segment| segment["course_id"]=course.id}}

Segment.import(segments_json.take_while{|x|x["course_id"]}.map{|x|x.except("course_code")})

instructors=JSON.parse(open('db/jsonData/instructor.json').read)
Instructor.import instructors
subjects=JSON.parse(open('db/jsonData/subject.json').read).map {|x|x.except('segments')}
Subject.import subjects


