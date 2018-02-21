class CreateLearningAccomplishments < ActiveRecord::Migration[5.1]
  def change
    create_table :learning_accomplishments do |t|
      t.integer :status
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
