class RenameUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :shortened_urls, :user_id, :submitter_id
  end
end
