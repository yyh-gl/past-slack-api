class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :ch_id, null: false
      t.string :name, null: false
      t.string :ch_type, null: false

      t.timestamps
    end
  end
end
