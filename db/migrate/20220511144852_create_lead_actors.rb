class CreateLeadActors < ActiveRecord::Migration[5.2]
  def change
    create_table :lead_actors do |t|
      t.string :name
      t.boolean :oscar
      t.integer :age

      t.timestamps
    end
  end
end
