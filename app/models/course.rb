class Course < ApplicationRecord
  has_many :enrollments
  has_many :segments
  has_many :users, through: :enrollments
  has_many :subjects, through: :segments

end
