class AddLikesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :likes, :integer
  end
end
