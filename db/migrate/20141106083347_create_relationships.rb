class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :attend

      t.timestamps
    end
  end
end
