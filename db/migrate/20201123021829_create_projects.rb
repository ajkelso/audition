class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :medium
      t.integer :director_id
      t.integer :casting_id

      t.timestamps
    end
  end
end
