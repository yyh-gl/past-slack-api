class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :channel_name
      t.string :main_type
      t.string :sub_type
      t.string :user
      t.text :text
      t.string :client_msg_id
      t.string :ts
      t.text :reactions
      t.string :inviter
      t.string :edited_user
      t.string :edited_ts
      t.string :unfurl_links
      t.string :unfurl_media
      t.string :thread_ts
      t.string :is_thread_broadcast
      t.string :thread_channel_id
      t.string :thread_root_client_msg_id
      t.string :thread_root_ts

      t.timestamps
    end
  end
end
