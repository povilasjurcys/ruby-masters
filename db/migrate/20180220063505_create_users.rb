class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :image_url
      t.string :github_uid, null: false

      t.timestamps
    end

    add_index :users, :github_uid, unique: true
  end
end
