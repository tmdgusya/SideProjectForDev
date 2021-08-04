class CreateLikeHisotries < ActiveRecord::Migration[6.1]
  def change
    create_table :like_hisotries do |t|
      t.integer :study_id
      t.integer :user_id

      t.timestamps
    end
  end
end
