class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :credits
      t.references :subjects, foreign_key: true
      t.string :name
      t.string :prerequisites
      t.string :term
      t.string :id
      t.string :type

      t.timestamps
    end
  end
end
