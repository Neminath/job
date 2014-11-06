class CreateEventsUsersJoinTables < ActiveRecord::Migration
  def change
    create_table :events_users_join_tables do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end

      add_index:EventsUsersJoinTables,:event_id
      add_index:EventsUsersJoinTables,:user_id
      add_index:EventsUsersJoinTables,[:event_id,:user_id],unique:true

  end
end
