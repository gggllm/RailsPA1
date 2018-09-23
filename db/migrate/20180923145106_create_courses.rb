class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses,id:false do |t|
      t.string :credits
      t.string :name
      t.string :prerequisites
      t.string :term
      t.string :id
      t.string :type

      t.timestamps
    end
  end
end
