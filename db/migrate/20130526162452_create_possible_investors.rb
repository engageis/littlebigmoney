class CreatePossibleInvestors < ActiveRecord::Migration
  def change
    create_table :possible_investors do |t|
      t.references :user, :null => false
      t.references :project, :null => false
      t.float :amount, :null => false

      t.timestamps
    end
    add_index :possible_investors, :user_id
    add_index :possible_investors, :project_id
  end
end
