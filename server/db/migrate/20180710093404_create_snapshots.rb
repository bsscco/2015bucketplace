class CreateSnapshots < ActiveRecord::Migration[5.2]
  def change
    create_table :snapshots do |t|
      t.string :image_url
      t.integer :user_id

      t.timestamps
    end
  end
end
