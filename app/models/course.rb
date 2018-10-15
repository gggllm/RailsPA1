class Course < ApplicationRecord
  has_and_belongs_to_many :users,join_table: :enrollments
  has_and_belongs_to_many :subjects, join_table: :segments
  has_many :enrollments
  has_many :segments
end
