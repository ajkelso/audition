class CreateAuditions < ActiveRecord::Migration[6.0]
  def change
    create_table :auditions do |t|
      t.string :location
      t.string :time
      t.integer :actor_id
      t.integer :project_id

      t.timestamps
    end
  end
end
