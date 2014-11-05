class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :Email
      t.string :Name
      t.string :Gender

      t.timestamps
    end
  end
end
