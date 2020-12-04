class ChangeTimeInAuditions < ActiveRecord::Migration[6.0]
  def change
    change_column :auditions, :time, :datetime
  end
end
