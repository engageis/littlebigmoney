class AddColumnsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :kind, :string, null: false, default: ""
    add_column :projects, :country, :string, null: false, default: ""
    execute("UPDATE projects SET kind = 'donate'")
    execute("UPDATE projects SET country = 'colombia'")
  end
end
