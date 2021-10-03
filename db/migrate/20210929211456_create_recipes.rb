class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :author_id
      t.float :rate
      t.string :difficulty
      t.string :budget
      t.string :name
      t.string :prep_time
      t.string :total_time
      t.integer :people_quantity
      t.string :author_tip
      t.string :image
      t.integer :nb_comments
      t.string :cook_time

      t.timestamps
    end
  end
end
