class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :rating
      t.boolean :over_two_hours
      t.references :lead_actor, foreign_key: true

      t.timestamps
    end
  end
end
