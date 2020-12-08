class RenameCastingDirectorsId < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :casting_director_id, :casting_id
  end
end
