class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :eventid
      t.integer :userid
      t.integer :attedence

      t.timestamps
    end
  end
end
