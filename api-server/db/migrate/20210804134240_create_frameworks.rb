class CreateFrameworks < ActiveRecord::Migration[6.1]
  def change
    create_table :frameworks do |t|
      t.string :name
      t.string :img_url
      t.string :type
      t.integer :study_id

      t.timestamps
    end
  end
end
