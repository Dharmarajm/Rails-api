class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
      t.string :name
      t.integer :phone_number
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
