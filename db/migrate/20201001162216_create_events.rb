# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :date
      t.belongs_to :creator, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
