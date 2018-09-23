class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.integer :credits
      t.string :name
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
