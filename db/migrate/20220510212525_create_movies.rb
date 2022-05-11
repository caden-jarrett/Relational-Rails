class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :rating
      t.boolean :over_two_hours
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :actor_id

      t.timestamps
    end
  end
end
