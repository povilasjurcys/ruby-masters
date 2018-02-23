class CreateLearningUsersGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :learning_users_groups do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
