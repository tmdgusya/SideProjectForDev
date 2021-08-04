class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :nickname
      t.string :role
      t.string :is_delete

      t.timestamps
    end
  end
end
