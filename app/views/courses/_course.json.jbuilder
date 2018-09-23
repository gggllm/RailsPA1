json.extract! course, :id, :credits, :name, :code, :description, :created_at, :updated_at
json.url course_url(course, format: :json)
