class CreateSurvayResponses < ActiveRecord::Migration
  def change
    create_table :survay_responses do |t|
      t.string :response
      t.integer :points
      t.integer :survay_id
      t.text :additional_info
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
  end
end
