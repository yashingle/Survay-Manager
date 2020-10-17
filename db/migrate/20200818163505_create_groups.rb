class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :product_access, :default => 1
      t.timestamps
    end
  end
end
