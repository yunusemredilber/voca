class CreatePins < ActiveRecord::Migration[6.0]
  def change
    create_table :pins do |t|
      t.integer :code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :pins, :code, unique: true
  end
end
