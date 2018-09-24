class IndexController < ApplicationController
  def index
    @instructors = Instructor.all
    @subjects = Subject.all
    @courses = Course.all
  end
end