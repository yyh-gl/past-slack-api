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

      t.timestamps
    end
  end
end
