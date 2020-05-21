class CreateBirds < ActiveRecord::Migration[6.0]
  def change
    create_table :birds do |t|
      t.string :color
      t.string :species

      t.timestamps
    end
  end
end
