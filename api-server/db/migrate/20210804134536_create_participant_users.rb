class CreateParticipantUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :participant_users do |t|
      t.integer :study_id
      t.integer :user_id

      t.timestamps
    end
  end
end
