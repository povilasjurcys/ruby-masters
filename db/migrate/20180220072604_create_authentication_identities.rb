class CreateAuthenticationIdentities < ActiveRecord::Migration[5.1]
  def change
    create_table :authentication_identities do |t|
      t.string :provider
      t.integer :user_id
      t.string :uid

      t.timestamps
    end
  end
end
