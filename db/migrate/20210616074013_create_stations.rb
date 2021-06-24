class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.text :line
      t.text :name
      t.text :time
      t.timestamps
    end
  end
end
