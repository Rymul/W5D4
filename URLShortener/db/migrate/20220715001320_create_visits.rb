class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.references :url, null: false, foreign_key: {to_table: :shortened_urls}, index: true
      t.references :visitor, null: false, foreign_key: {to_table: :users}, index: true

      t.timestamps
    end
  end
end
