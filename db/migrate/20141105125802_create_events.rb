class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event
      t.string :evnt_discr
      t.date :evt_date

      t.timestamps
    end
  end
end
