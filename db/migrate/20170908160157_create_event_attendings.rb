class CreateEventAttendings < ActiveRecord::Migration[5.0]
  def change
    create_table :event_attendings do |t|
    	t.integer :event_attendee_id, index: true
    	t.integer :attended_event_id, index: true

    	t.timestamps
    end
  end
end
