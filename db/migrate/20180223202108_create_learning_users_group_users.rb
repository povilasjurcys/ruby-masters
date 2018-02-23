class CreateLearningUsersGroupUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :learning_users_group_users do |t|
      t.integer :users_group_id, null: false, index: true
      t.integer :user_id, null: false, index: true

      t.timestamps
    end
  end
end
