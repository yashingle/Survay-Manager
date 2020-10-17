class CreateOneTimeApiKeys < ActiveRecord::Migration
  def change
    create_table :one_time_api_keys do |t|
      t.integer :user_id
      t.string :one_time_api_key
      t.timestamps
    end
  end
end
