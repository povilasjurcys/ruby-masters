class CreateLearningTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :learning_topics do |t|
      t.string :title
      t.integer :course_id
      t.integer :parent_topic_id
      t.float :position

      t.timestamps
    end
  end
end
