class RenameCastingDirectorsToCasting < ActiveRecord::Migration[6.0]
  def change
    rename_table :casting_directors, :castings
  end
end
