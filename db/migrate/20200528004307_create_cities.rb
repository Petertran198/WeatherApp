class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :zip
      t.string :location

      t.timestamps
    end
  end
end
