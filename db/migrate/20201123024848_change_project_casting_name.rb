class ChangeProjectCastingName < ActiveRecord::Migration[6.0]
  def change
    change_table :projects do |t|
      t.rename :casting_id, :casting_director_id
    end
  end
end
