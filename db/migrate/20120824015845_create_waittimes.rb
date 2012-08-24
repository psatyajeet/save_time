class CreateWaittimes < ActiveRecord::Migration
  def change
    create_table :waittimes do |t|
      t.string :content
      t.integer :location_id

      t.timestamps
    end
    add_index :waittimes, [:location_id, :created_at]
  end
end
