class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.references :short_url, null: false, foreign_key: true, index: true
      t.references :visitor_id, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
