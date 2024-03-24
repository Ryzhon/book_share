class CreateApiKeys < ActiveRecord::Migration[7.1]
  def change
    create_table :api_keys do |t|
      t.string :access_token, null: false
      t.datetime :expires_at
      t.references :user, null: false, foreign_key: true
      t.boolean :active, default: false

      t.timestamps
    end
    add_index :api_keys, :access_token, unique: true
  end
end
