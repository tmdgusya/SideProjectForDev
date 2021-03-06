class CreateStudies < ActiveRecord::Migration[6.1]
  def change
    create_table :studies do |t|
      t.string :title
      t.text :content
      t.datetime :due_date
      t.integer :max_people
      t.integer :ml
      t.boolean :is_delete
      t.string :study_period_type
      t.string :study_place_type
      t.integer :user_id

      t.timestamps
    end
  end
end
