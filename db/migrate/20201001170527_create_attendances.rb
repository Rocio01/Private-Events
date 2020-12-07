# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.belongs_to :attendee, foreign_key: { to_table: :users }
      t.belongs_to :attended_event, foreign_key: { to_table: :events }

      t.timestamps
    end
  end
end
