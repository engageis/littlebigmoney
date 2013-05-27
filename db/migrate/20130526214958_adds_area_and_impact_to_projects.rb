class AddsAreaAndImpactToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :entrepreneur_type, :string
    add_column :projects, :area, :string
    add_column :projects, :impact, :string
  end
end
