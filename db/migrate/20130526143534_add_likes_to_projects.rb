class AddLikesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :likes, :intege
  end
end
