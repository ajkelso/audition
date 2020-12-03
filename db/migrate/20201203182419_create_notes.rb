class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :content
      t.integer :audition_id
      t.integer :notable_id
      t.string :notable_type

      t.timestamps
    end
  end
end
