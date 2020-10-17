class CreateSurvays < ActiveRecord::Migration
  def self.up
    create_table :survays do |t|
      t.string :title
      t.text :detail
      t.integer :total_points, :default => 10
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
  end
end
