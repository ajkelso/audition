class AddSeekingToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :seeking, :boolean, :default => true
  end
end
