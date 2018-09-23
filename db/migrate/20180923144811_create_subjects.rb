class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :abbrevation
      t.string :td
      t.string :type
      t.string :term

      t.timestamps
    end
  end
end
